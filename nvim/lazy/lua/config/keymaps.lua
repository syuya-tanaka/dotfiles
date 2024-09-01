-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- Go to netrw.
vim.keymap.set("n", "<Leader>pv", vim.cmd.Ex)

-- Split window.
vim.keymap.set("n", "ss", ":split<Return>", opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window.
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")

-- Resize windows(vim).
vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")

-- Move in bulk.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Moves relative to the cursor.
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Yank once and use it continuously.
vim.keymap.set("x", "<leader>p", '"_dp')

-- great yank. not register only, copy to system's clipboard. great.
-- <leader>yap store register and clipboard.
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- delete register.
vim.keymap.set("n", "<leader>dr", '"_d')
vim.keymap.set("v", "<leader>dr", '"_d')

vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("i", "<C-c>", "<Esc>")

-- Macros are getting in the way with 'q'.
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

-- Quickfix related.
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- vim.keymap.set("n", "<leader>xx", ":copen<CR>")
-- vim.keymap.set("n", "<leader>xl", ":cclose<CR>")

-- Switching Buffers.
vim.keymap.set("n", "<leader>n", ":bprev<CR>", { silent = true })
vim.keymap.set("n", "<leader>N", ":bnext<CR>", { silent = true })

-- Delete Current Buffer.
vim.keymap.set("n", "<leader>cb", ":bdelete<CR>", { silent = true })

-- Grant execute permission to the current file.
vim.keymap.set("n", "<leader>ex", "<cmd>!chmod +x %<CR>", { silent = true })

-- Inc-rename
vim.keymap.set("n", "<leader>cr", ":IncRename ")

-- Tagbar
vim.keymap.set("n", "<leader>tg", ":TagbarToggle<CR>", { silent = true })

-- Register
vim.keymap.set("n", "<leader>r", ":lua ClearRegister()<CR>", { silent = true })

-- todo-comments
vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>")
vim.keymap.set("n", "<leader>tl", ":TodoLocList<CR>")

-- Noice
vim.keymap.set("n", "<leader>nf", ":NoiceHistory<CR>", { silent = true })

-- lazygit
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", opts)

-- diffview
vim.keymap.set("n", "<leader>dh", ":DiffviewFileHistory<CR>", opts)

-- dap
-- vim.keymap.set('n', '<leader>dp', ':lua require"dapui".toggle()<CR>', {silent = true})
vim.keymap.set("n", "<leader>bb", ':lua require"dap".toggle_breakpoint()<CR>', { silent = true })
vim.keymap.set("n", "<leader>B", ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
vim.keymap.set("n", "<leader>lp", ':lua require"dap".set_breakpoint(nil, nil,vim.fn.input("Log point message: "))<CR>')
-- vim.keymap.set('n', '<leader>dc', ':lua require"dap".continue()<CR>', {silent = true})
-- vim.keymap.set('n', '<leader>di', ':lua require"dap".step_into()<CR>', {silent = true})
-- vim.keymap.set('n', '<leader>do', ':lua require"dap".step_over()<CR>', {silent = true})
-- vim.keymap.set('n', '<leader>ds', ':lua require"dap".step_out()<CR>', {silent = true})
vim.keymap.set("n", "<leader>da", ':lua require"dap".clear_breakpoints()<CR>', { silent = true })
-- vim.keymap.set('n', '<leader>dt', ':lua require"dap-go".debug_test()<CR>', {silent = true})

-- golang
vim.keymap.set("n", "<leader>go", ":GoRun<CR>", { silent = true })
vim.keymap.set("n", "<leader>gf", ":GoFmt<CR>", { silent = true })
vim.keymap.set("n", "<leader>gi", ":GoImport<CR>", { silent = true })
vim.keymap.set("n", "<leader>gD", ":GoDoc ")
vim.keymap.set("n", "<leader>gd", ":GoDebug<CR>", { silent = true })
vim.keymap.set("n", "<leader>ds", ":GoDbgStop<CR>", { silent = true })
vim.keymap.set("n", "<leader>gs", ":GoStop<CR>", { silent = true })
