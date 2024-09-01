return {
  -- amongst your other plugins
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      {
        "<leader>oh",
        "<cmd>ToggleTerm direction=float<cr>",
      },
    },
    opts = {
      size = 10,
      hide_number = true,
      start_in_insert = true,
      shading_factor = "-30",
      persiste_size = false,
      terminal_mappings = true,
      insert_mappings = false,
    },
  },
}
