require("go").setup({
	icons = {
		breakpoint = "🐞",
		currentpos = "🦅",
	},
})

require("go.format").gofmt()

require("nvim-dap-virtual-text").setup({
	highlight_changed_variables = true
})

require("dapui").setup({
	layouts = {
		{
			-- watches, stacks, breakpoints, scopes, repl, console
			elements = {
				{ id = "watches", size = 0.20 },
				{ id = "stacks", size = 0.20 },
				{ id = "breakpoints", size = 0.20 },
				{ id = "scopes", size = 0.40 },
				{ id = "repl", size = 0.80, position = "bottom"},
				{ id = "console", size = 0.20, position = "bottom" },
			},
			-- ↓ 横のサイズ
			size = 50,
			position = "left",
		},
		-- {
			-- repl
			-- elements = { "repl" },
			-- size = 0.30,
			-- position = "bottom",
		-- },
	},
})



vim.keymap.set('n', '<leader>go', ':GoRun<CR>', {silent = true})
vim.keymap.set('n', '<leader>gf', ':GoFmt<CR>', {silent = true})
vim.keymap.set('n', '<leader>gi', ':GoImport<CR>', {silent = true})
vim.keymap.set('n', '<leader>gD', ':GoDoc ')
vim.keymap.set('n', '<leader>gd', ':GoDebug<CR>', {silent = true})
vim.keymap.set('n', '<leader>ds', ':GoDbgStop<CR>', {silent = true})
vim.keymap.set('n', '<leader>gs', ':GoStop<CR>', {silent = true})
