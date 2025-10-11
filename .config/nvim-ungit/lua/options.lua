require "nvchad.options"

-- add yours here!

-- Enable relative line numbers
vim.opt.relativenumber = true
vim.opt.number = true -- show absolute number for the current line

-- Optional: other common settings
vim.opt.tabstop = 2 -- number of spaces per tab
vim.opt.shiftwidth = 2 -- spaces used for autoindent
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.scrolloff = 4 -- keep 8 lines visible when scrolling
vim.opt.sidescrolloff = 4 -- same for horizontal scroll

-- Highlight color for opened files
vim.api.nvim_set_hl(0, "NvimTreeOpenedFile", { fg = "#00FF00", bold = true })
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
