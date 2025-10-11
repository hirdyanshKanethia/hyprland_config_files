return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- compitest
  {
    "xeluxee/competitest.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VeryLazy",
    config = function()
      require "plugins.competitest"
    end,
  },

  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = { "gopls", "gofumpt" },
  --     automatic_installation = true,
  --   },
  -- },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   opts = {
  --     ensure_installed = { "gopls" },
  --   },
  -- },
  -- {
  --   "jayp0521/mason-null-ls.nvim",
  --   opts = {
  --     ensure_installed = { "gofumpt" },
  --     automatic_installation = true,
  --   },
  -- },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
