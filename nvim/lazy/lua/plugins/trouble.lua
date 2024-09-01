return {
  -- change trouble config
  {
    "folke/trouble.nvim",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
    },
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
}
