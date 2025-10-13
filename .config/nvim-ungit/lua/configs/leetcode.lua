-- configs/leetcode.lua
return {
  arg = "lc",
  lang = "cpp",

  cn = {
    enabled = false,
    translator = true,
    translate_problems = true,
  },

  storage = {
    home = vim.fn.stdpath "data" .. "/leetcode",
    cache = vim.fn.stdpath "cache" .. "/leetcode",
  },

  plugins = { non_standalone = true },
  logging = true,
  injector = {},
  cache = { update_interval = 60 * 60 * 24 * 7 },
  editor = { reset_previous_code = true, fold_imports = true },

  console = {
    open_on_runcode = true,
    dir = "row",
    size = { width = "90%", height = "75%" },
    result = { size = "60%" },
    testcase = { virt_text = true, size = "40%" },
  },

  description = { position = "left", width = "40%", show_stats = true },

  picker = { provider = "telescope" },
  hooks = {
    enter = {},
    question_enter = {
      function()
        vim.keymap.set("n", "<leader>lr", "<cmd>Leet run<CR>", { buffer = true, desc = "LC: Run code" })
        vim.keymap.set("n", "<leader>ls", "<cmd>Leet submit<CR>", { buffer = true, desc = "LC: Submit code" })
        vim.keymap.set("n", "<leader>lc", "<cmd>Leet console<CR>", { buffer = true, desc = "LC: Open console" })
        vim.keymap.set("n", "<leader>li", "<cmd>Leet info<CR>", { buffer = true, desc = "LC: Open question info" })
        vim.keymap.set(
          "n",
          "<leader>lo",
          "<cmd>Leet open<CR>",
          { buffer = true, desc = "LC: Open question in browser" }
        )
        vim.keymap.set(
          "n",
          "<leader>ld",
          "<cmd>Leet reset<CR>",
          { buffer = true, desc = "LC: Reset code section to default snippet" }
        )
        vim.keymap.set(
          "n",
          "<leader>lt",
          "<cmd>Leet desc<CR>",
          { buffer = true, desc = "LC: Toggle question description" }
        )
      end,
    },
    leave = {},
  },

  keys = {
    toggle = { "q" },
    confirm = { "<CR>" },
    reset_testcases = "r",
    use_testcase = "U",
    focus_testcases = "H",
    focus_result = "L",
  },

  theme = {},
  image_support = false,
}
