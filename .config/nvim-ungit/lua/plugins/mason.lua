-- ~/.config/nvim/lua/plugins/mason.lua
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "gopls", "gofumpt", "clangd" },
      automatic_installation = true,
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "gopls", "clangd" },
      automatic_installation = true,
    },
  },
  {
    "jayp0521/mason-null-ls.nvim",
    opts = {
      ensure_installed = { "gofumpt" },
      automatic_installation = true,
    },
  },
}
