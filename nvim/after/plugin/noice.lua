local noice = require("noice")
noice.setup({

	replace_last = true,

	presets = {
		lsp_doc_border = true,
		inc_rename = true,
	},

	cmdline = {
		format = {
			cmdline = { icon = ">_" },
		},
	},

	format = {
		level = {
			icons = {
				error = "✖︎ ",
				warn = "▼ ",
				info = "● ",
			},
		},
	},

	messages = {
		view = "notify",
	},

	routes = {
		{
			view = "notify",
			filter = {
				event = "msg_show",
				kind = "search_count",
			},
			opts = { skip = true }
		},


		{
			view = "mini",
			filter = {
				event = "msg_show",
				kind = "",
				find = "vim-go",
			},
		},

		{
			view = "mini",
			filter = {
				event = "msg_show",
				kind = "",
				find = "書",
			},
		},
	},
})


