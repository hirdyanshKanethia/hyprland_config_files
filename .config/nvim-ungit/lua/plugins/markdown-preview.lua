return {
  "iamcco/markdown-preview.nvim",

  ft = { "markdown" },

  cmd = {
    "MarkdownPreview",
    "MarkdownPreviewToggle",
    "MarkdownPreviewStop",
  },

  build = "cd app && npm install",

  config = function()
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_refresh_slow = 0
    vim.g.mkdp_theme = "dark"

    -- disable this for now
    vim.g.mkdp_combine_preview = 0

    -- debug URL
    vim.g.mkdp_echo_preview_url = 1

    -- browser
    -- vim.g.mkdp_browser = "firefox"
  end,
}
