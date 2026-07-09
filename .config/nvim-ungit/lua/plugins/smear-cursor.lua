return {
  "sphamba/smear-cursor.nvim",
  lazy = false,

  config = function()
    require("smear_cursor").setup {

      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      scroll_buffer_space = true,

      smear_insert_mode = false,
      vertical_bar_cursor_insert_mode = true,

      stiffness = 0.8,
      trailing_stiffness = 0.5,

      distance_stop_animating = 0.5,

      time_interval = 7,

      legacy_computing_symbols_support = false,
    }
  end,
}
