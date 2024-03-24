
function ColorMyPencils(color)
	color = color or "dracula"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.api.nvim_set_hl(0, "LineNr", { fg="#000076"})
	vim.api.nvim_set_hl(0, "Comment", { fg="#000076"})

    vim.cmd('highlight SignColumn guibg=NONE')

end

ColorMyPencils()
