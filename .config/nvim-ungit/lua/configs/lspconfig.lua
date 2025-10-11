require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
local neoscroll = require "neoscroll"

vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
  root_markers = { ".git" },
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
})

-- 2. Enable gopls
vim.lsp.enable "gopls"

-- 3. Attach keymaps and auto-format
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local buf = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.name ~= "gopls" then
      return
    end
    local buf = args.buf

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "Go to definition (smooth)" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = buf, desc = "Go to implementation" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = buf, desc = "Go to declaration" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "Hover docs" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf, desc = "LSP Rename" })

    -- Auto-formatting for servers that support it (like gopls)
    if client and client.supports_method "textDocument/formatting" then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
        buffer = buf,
        callback = function()
          vim.lsp.buf.format { bufnr = buf, async = true }
        end,
      })
    end
  end,
})
