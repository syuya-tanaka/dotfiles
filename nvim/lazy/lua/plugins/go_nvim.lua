return {
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
          icons = {
            breakpoint = "🐞",
            currentpos = "🦅",
          },
        })
      require("go.format").gofmt()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    -- n	next
    -- s	step
    -- o	stepout
    -- S	cap S: stop debug
    -- u	up
    -- D	cap D: down
    -- C	cap C: run to cursor
    -- b	toggle breakpoint
    -- P	cap P: pause
    -- p	print, hover value (also in visual mode)
    keys = {
      {
        '<leader>go', '<cmd>GoRun<CR>',
      },

      {
        '<leader>gf', '<cmd>GoFmt<CR>',
      },
      {
        '<leader>gi', '<cmd>GoImport<CR>',
      },
      {
        '<leader>gD', '<cmd>GoDoc<CR>',
      },
      {
        '<leader>gd', '<cmd>GoDebug<CR>',
      },
      {
        '<leader>ds', '<cmd>GoDbgStop<CR>',
      },
      {
        '<leader>gs', '<cmd>GoStop<CR>',
      },
    },
  },
}
