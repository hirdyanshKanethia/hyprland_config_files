require "nvchad.mappings"

local map = vim.keymap.set

-- Existing mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set("n", "d", '"_d', { desc = "Delete without copying" })
vim.keymap.set("v", "d", '"_d', { desc = "Delete without copying" })

-- Disable default Tab/Shift-Tab buffer switching
vim.keymap.set({ "n", "v", "x" }, "<Tab>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v", "x" }, "<S-Tab>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v", "x" }, "<A-h>", "<Nop>", { silent = true })

-- Map Alt+Shift+h/l to previous/next buffer
vim.keymap.set("n", "<A-H>", ":bprev<CR>", { desc = "Previous buffer", silent = true })
vim.keymap.set("n", "<A-L>", ":bnext<CR>", { desc = "Next buffer", silent = true })

-- Tmux naviagtor keybinds
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Window left" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Window right" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Window up" })

-- require neoscroll and setup defaults
local neoscroll = require "neoscroll"
require("neoscroll").setup {
  mappings = { -- Keys to be mapped to their corresponding default scrolling animation
    "<C-u>",
    "<C-d>",
    "<C-b>",
    "<C-f>",
    "<C-y>",
    "<C-e>",
    "zt",
    "zz",
    "zb",
  },
  hide_cursor = true, -- Hide cursor while scrolling
  stop_eof = true, -- Stop at <EOF> when scrolling downwards
  respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  duration_multiplier = 1.0, -- Global duration multiplier
  easing = "linear", -- Default easing function
  pre_hook = nil, -- Function to run before the scrolling animation starts
  post_hook = nil, -- Function to run after the scrolling animation ends
  performance_mode = false, -- Disable "Performance Mode" on all buffers.
  ignored_events = { -- Events ignored while scrolling
    "WinScrolled",
    "CursorMoved",
  },
}

-- Define all scroll keymaps
local scroll_keys = {
  ["<A-k>"] = function()
    neoscroll.ctrl_u { duration = 250, easing = "sine" }
  end,
  ["<A-j>"] = function()
    neoscroll.ctrl_d { duration = 250, easing = "sine" }
  end,
  ["<A-h>"] = function()
    neoscroll.ctrl_b { duration = 450, easing = "circular" }
  end,
  ["<A-l>"] = function()
    neoscroll.ctrl_f { duration = 450, easing = "circular" }
  end,
  ["<C-y>"] = function()
    neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
  end,
  ["<C-e>"] = function()
    neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
  end,
  ["zt"] = function()
    neoscroll.zt { half_win_duration = 250 }
  end,
  ["zz"] = function()
    neoscroll.zz { half_win_duration = 250 }
  end,
  ["zb"] = function()
    neoscroll.zb { half_win_duration = 250 }
  end,
  -- Your custom Alt+j/k
  -- ["<A-j>"] = function() neoscroll.scroll(vim.wo.scroll, { move_cursor = true, duration = 150 }) end,
  -- ["<A-k>"] = function() neoscroll.scroll(-vim.wo.scroll, { move_cursor = true, duration = 150 }) end,
}

local modes = { "n", "v", "x" }

-- Apply keymaps
for key, func in pairs(scroll_keys) do
  vim.keymap.set(modes, key, func, { silent = true })
end
