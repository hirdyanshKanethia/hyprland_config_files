require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "clangd",
  "gopls",
  "rust-analyzer",
  "pyright",
  "ruff",
  "jdtls",
  "lua_ls",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
-- local neoscroll = require "neoscroll"

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

vim.lsp.config("clangd", {
  cmd = { "clangd", "--background-index" }, -- optional flags
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = { ".git", "compile_commands.json" },
  settings = {
    clangd = {
      -- You can set additional clangd options here if needed
    },
  },
})

vim.lsp.config("rust-analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", ".git" },

  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      check = {
        command = "clippy",
      },
      diagnostics = {
        enable = true,
        disabled = { "unresolved-proc-macro" }, -- optional
      },
    },
  },
})

vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic", -- or "strict"
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})

vim.lsp.config("ruff", {
  cmd = { "ruff", "server" },
  filetypes = { "python" },

  root_markers = {},

  init_options = {
    settings = {
      format = {
        enable = true,
      },
      lint = {
        enable = true,
      },
    },
  },
})

vim.lsp.config("jdtls", {
  cmd = { "jdtls" },
  filetypes = { "java" },
  root_markers = {
    ".git",
    "mvnw",
    "gradlew",
    "pom.xml",
    "build.gradle",
  },
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-21",
            path = "/usr/lib/jvm/java-21-openjdk",
          },
        },
      },
      format = {
        enabled = true,
      },
      saveActions = {
        organizeImports = true,
      },
      completion = {
        favoriteStaticMembers = {
          "org.junit.Assert.*",
          "org.junit.jupiter.api.Assertions.*",
          "org.mockito.Mockito.*",
        },
      },
    },
  },
})

-- 3. Attach keymaps and auto-format
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if
      client.name ~= "gopls"
      and client.name ~= "clangd"
      and client.name ~= "rust-analyzer"
      and client.name ~= "jdtls"
      and client.name ~= "pyright"
      and client.name ~= "ruff"
    then
      return
    end
    local buf = args.buf

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "Go to definition (smooth)" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = buf, desc = "Go to implementation" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = buf, desc = "Go to declaration" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "Hover docs" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf, desc = "LSP Rename" })
    vim.keymap.set("n", "<leader>df", vim.lsp.buf.code_action, {
      buffer = buf,
      desc = "LSP Code Action",
    })

    -- Auto-formatting
    if
      client
      and client:supports_method "textDocument/formatting"
      and (
        client.name == "gopls"
        or client.name == "clangd"
        or client.name == "rust-analyzer"
        or client.name == "ruff"
        or client.name == "jdtls"
      )
    then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormatOnSave", {}),
        buffer = buf,
        callback = function()
          vim.lsp.buf.format {
            bufnr = buf,
            filter = function(c)
              return c.name == client.name
            end,
          }
        end,
      })
    end
  end,
})
