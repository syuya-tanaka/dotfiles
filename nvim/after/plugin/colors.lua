
function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.api.nvim_set_hl(0, "LineNr",  { fg="#6272A4"})
	vim.api.nvim_set_hl(0, "Comment", { fg="#6272A4"})

    vim.cmd('highlight SignColumn guibg=NONE')

	vim.cmd 'set winhighlight=NormalNC:none'

end

ColorMyPencils()
