local toggle_term = require("toggleterm")
toggle_term.setup {

	-- open_mappingはinsert_modeでも機能してしまう為、space押すとラグが発生して不便。
	-- open_mapping = [[<leader>ot]],
	size = 10,
	hide_numbers = true,
	start_in_insert = true,
	shading_factor = '-30',
	persiste_size = false,
	terminal_mappings = true,
	insert_mapppings = false,
}

-- terminal_mapping = on or trueにすると起動先のterminal上でのマッピングを有効にする。

 -- open a vertical terminal if new
vim.keymap.set('n', '<leader>ov', [[<Cmd>ToggleTerm direction=vertical size=40<CR>]], {})
-- open a horizontal terminal if new
vim.keymap.set('n', '<leader>oh', [[<Cmd>ToggleTerm direction=horizontal<CR>]], {})

