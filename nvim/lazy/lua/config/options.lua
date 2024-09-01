-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- init.lua または適切な設定ファイルに追加
vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave" }, {
  pattern = "*",
  callback = function()
    vim.cmd("silent! wall")
  end,
})
