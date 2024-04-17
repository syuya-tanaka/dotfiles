-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
vim.cmd [[packadd dashboard-nvim]]
vim.cmd [[packadd nvim-web-devicons]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function ()
			vim.cmd('colorscheme rose-pine')
		end
	})

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('nvim-treesitter/playground')
	use('ThePrimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('tpope/vim-commentary')

	use({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage the language servers from neovim
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'rafamadriz/friendly-snippets'},
		},
	})

	-- UI
	use({
		'folke/noice.nvim',
		requires = {
			{ 'MunifTanjim/nui.nvim' },
			{ 'rcarriga/nvim-notify' },
		}
	})

	use({
		'nvim-lualine/lualine.nvim',
		requires = {
			{ 'nvim-tree/nvim-web-devicons', opt = true }
		}
	})

	use({
		"akinsho/toggleterm.nvim",
		tag = '*',
		config = function()
			require("toggleterm").setup()
		end
	})

	use { 'echasnovski/mini.indentscope', branch = 'stable' }
	use { 'echasnovski/mini.trailspace', branch = 'stable' }

	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	use({
		"kylechui/nvim-surround",
		tag = "*",
	})

	use { 'smjonas/inc-rename.nvim' }

	use {
		"nvimdev/dashboard-nvim",
		event = 'VimEnter',
		config = function()
			require('dashboard').setup({
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
		end,
		requires = { 'nvim-tree/nvim-web-devicons' }
	}

	use { "folke/trouble.nvim" }

	use {"preservim/tagbar"}

	use { "Pocco81/auto-save.nvim" }

	use { "lewis6991/gitsigns.nvim" }

	use { "folke/todo-comments.nvim" }

	use { "kdheepak/lazygit.nvim" }

	use { "sindrets/diffview.nvim" }

	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

	use({
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup()
		end,
	})

	-- dap(Debug adapter protocol)
	-- dapは、EditorとDebuggerの間で行われるやりとりを抽象的にまとめたプロトコル。
	-- 関係図: Editor ←→ DAP ←→ Debugger

	-- goのdebugger = delve を使うために、nvim-dap-goが必要。
	use { "mfussenegger/nvim-dap" }
	use { "theHamsta/nvim-dap-virtual-text"}
	use { "nvim-neotest/nvim-nio" }
	use { "rcarriga/nvim-dap-ui" }
	use { "leoluz/nvim-dap-go" }
	use { "mfussenegger/nvim-dap-python" }

	-- use { "fatih/vim-go" }
	--
	use 'ray-x/go.nvim'
	use 'ray-x/guihua.lua'

end)

