#!/usr/bin/env bash

MY_UID=$(id -u)

# Ports that are almost always system / noise
DENY_REGEX='^(systemd|dbus|avahi|cups|pipewire|wireplumber|bluetoothd|NetworkManager)$'

# 1. Open TCP ports (authoritative)
mapfile -t ports < <(
  nmap -sT localhost 2>/dev/null |
  awk '/^[0-9]+\/tcp\s+open/ {
    split($1, a, "/");
    print a[1]
  }'
)

tooltip=""
count=0

for port in "${ports[@]}"; do
  # Skip privileged ports (system-owned by design)
  (( port < 1024 )) && continue

  # Find any process owning this port (IPv4 + IPv6)
  pid=$(lsof -nP -iTCP:"$port" -t 2>/dev/null | head -n1)
  [[ -z "$pid" ]] && continue

  # Get UID of process
  uid=$(ps -o uid= -p "$pid" 2>/dev/null | tr -d ' ')
  [[ "$uid" != "$MY_UID" ]] && continue

  pname=$(ps -o comm= -p "$pid" 2>/dev/null)

  # Filter known system junk even if user-owned
  [[ "$pname" =~ $DENY_REGEX ]] && continue

  tooltip+="${port}  ${pname}  PID ${pid}
"
  ((count++))
done

if (( count == 0 )); then
  printf '{"text":"󰛳 0","tooltip":"No user-level network services open"}\n'
  exit 0
fi

# Proper JSON encoding (handles newlines correctly)
tooltip_json=$(printf "%s" "$tooltip" | jq -Rs .)

printf '{"text":"󰛳 %d","tooltip":%s}\n' "$count" "$tooltip_json"
