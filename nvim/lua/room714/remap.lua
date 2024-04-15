vim.g.mapleader = " "
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
vim.keymap.set("x", "<leader>p", "\"_dp")

-- great yank. not register only, copy to system's clipboard. great.
-- <leader>yap store register and clipboard.
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- delete register.
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("v", "<leader>d", "\"_d")


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

-- Switching Buffers.
vim.keymap.set("n", "<leader>n", ":bprev<CR>", { silent = true })
vim.keymap.set("n", "<leader>N", ":bnext<CR>", { silent = true })

-- Delete Current Buffer.
vim.keymap.set("n", "<leader>cb", ":bdelete<CR>", { silent = true })

-- Grant execute permission to the current file.
vim.keymap.set("n", "<leader>ex", "<cmd>!chmod +x %<CR>", { silent = true })

-- Trouble
vim.keymap.set('n', "<leader>xx", ":TroubleToggle<CR>", opts)

-- Inc-rename
vim.keymap.set("n", "<leader>cr", ":IncRename ")

-- Tagbar
vim.keymap.set('n', '<leader>tg', ':TagbarToggle<CR>', { silent = true })

-- Color
vim.keymap.set('n', '<leader>bc', ':lua ColorMyPencils()<CR>', {silent = true})

-- todo-comments
vim.keymap.set('n', '<leader>td', ':TodoTelescope<CR>')
vim.keymap.set('n', '<leader>tl', ':TodoLocList<CR>')

-- Noice
vim.keymap.set('n', '<leader>nf', ':NoiceHistory<CR>', {silent = true})

-- lazygit
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', opts)
