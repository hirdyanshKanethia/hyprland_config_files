return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    -- keybinds are in mappings.lua file

    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = false }, -- Yazi
      git = { enabled = true },
      image = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = false }, -- Keep Telescope with NvChad
      quickfile = { enabled = true },
      rename = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false }, -- You already use neoscroll
      scratch = { enabled = true },
      statuscolumn = { enabled = true },
      terminal = { enabled = false }, -- tmux
      words = { enabled = true },
    },
  },
}
