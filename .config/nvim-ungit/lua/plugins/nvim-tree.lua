return {
  -- NvimTree plugin override
  {
    "nvim-tree/nvim-tree.lua",
    filters = {
      dotfiles = true, -- show dotfiles (like .env)
    },
    opts = {
      view = {
        width = 26, -- sidebar width
        side = "left", -- "left" or "right"
        number = true, -- show absolute number
        relativenumber = true, -- show relative numbers
      },
      renderer = {
        highlight_git = false,
        highlight_opened_files = "all",
      },
      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
    },
  },
}
