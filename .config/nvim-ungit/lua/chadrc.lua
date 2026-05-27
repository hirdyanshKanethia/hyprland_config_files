-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "eldritch",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

-- autocommand to resize panes upon tree open (close works by default idk how) 
vim.api.nvim_create_autocmd({ "WinNew", "WinClosed" }, {
  callback = function()
    vim.defer_fn(function()
      vim.cmd "wincmd ="
    end, 50)
  end,
})

return M
