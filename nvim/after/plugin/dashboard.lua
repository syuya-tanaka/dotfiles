
require("dashboard").setup({
	theme = 'doom',
	config = {
		header = {
			[[																	  ]],
			[[																	  ]],
			[[																	  ]],
			[[																	  ]],
			[[																	  ]],
			[[																	  ]],
			[[																	  ]],
			[[																	  ]],
			[[																	  ]],
			[[																	  ]],
			[[																	  ]],
			[[																	  ]],
			[[																	  ]],
			[[██████╗  ██████╗  ██████╗ ███╗   ███╗     ██╗ ██╗ ███████╗ ██╗██╗  ██╗]],
			[[██╔══██╗██╔═══██╗██╔═══██╗████╗ ████║    ████████╗╚════██║███║██║  ██║]],
			[[██████╔╝██║   ██║██║   ██║██╔████╔██║    ╚██╔═██╔╝    ██╔╝╚██║███████║]],
			[[██╔══██╗██║   ██║██║   ██║██║╚██╔╝██║    ████████╗   ██╔╝  ██║╚════██║]],
			[[██║  ██║╚██████╔╝╚██████╔╝██║ ╚═╝ ██║    ╚██╔═██╔╝   ██║   ██║     ██║]],
			[[╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═╝     ╚═╝ ╚═╝    ╚═╝   ╚═╝     ╚═╝]],
			[[																	  ]],
			[[																	  ]],
		}, --your header
		center = {
			{
				icon = '󰈞  ',
				icon_hl = 'Title',
				desc = 'Find File           ',
				desc_hl = 'String',
				key = 'f',
				-- keymap = '<leader>pf',
				key_hl = 'Number',
				key_format = ' %s', -- remove default surrounding `[]`
				action = 'Telescope find_files cwd='
			},

			{
				icon = '  ',
				desc = 'New file',
				key = 'n',
				-- keymap = '',
				key_format = ' %s', -- remove default surrounding `[]`
				action = function()
					vim.cmd(':ene')
				end
			},

			{
				icon = '  ',
				desc = 'Recent files',
				key = 'r',
				-- keymap = '',
				key_format = ' %s', -- remove default surrounding `[]`
				action = 'Telescope oldfiles'
			},

		},
		footer = {},
	}
})
