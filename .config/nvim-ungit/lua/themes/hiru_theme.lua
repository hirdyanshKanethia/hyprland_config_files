local M = {}

M.base_30 = {
  white = "#ffffff",

  darker_black = "#000000",
  black = "#050505",
  black2 = "#0a0a0a",
  lighter_black = "#131313",

  one_bg = "#161616",
  one_bg2 = "#1d1d1d",
  one_bg3 = "#252525",

  grey = "#303030",
  grey_fg = "#3d3d3d",
  grey_fg2 = "#4a4a4a",
  light_grey = "#5a5a5a",

  red = "#ff2d2d",
  baby_pink = "#ff5fa2",
  pink = "#ff4f87",

  line = "#202020",

  green = "#39f100",
  vibrant_green = "#39ff14",

  nord_blue = "#66b3ff",
  blue = "#3399ff",

  yellow = "#ffff00",
  sun = "#fff44f",

  purple = "#e066ff",
  dark_purple = "#c266ff",

  teal = "#00ffd5",
  orange = "#ff9500",
  cyan = "#00ffff",

  statusline_bg = "#0d0d0d",
  lightbg = "#1a1a1a",

  pmenu_bg = "#39ff14",
  folder_bg = "#3399ff",
}

M.base_16 = {
  base00 = "#050505",
  base01 = "#0a0a0a",
  base02 = "#101010",
  base03 = "#161616",
  base04 = "#252525",

  base05 = "#ffffff",
  base06 = "#fafafa",
  base07 = "#ffffff",

  base08 = "#ff2d2d",
  base09 = "#ffff00",
  base0A = "#ff9500",
  base0B = "#39ff14",
  base0C = "#00ffff",
  base0D = "#3399ff",
  base0E = "#e066ff",
  base0F = "#ff4f87",
}

M.type = "dark"

M = require("base46").override_theme(M, "hiru_theme")

return M
