-- require("nvim-dap-virtual-text").setup({
-- 	highlight_changed_variables = true
-- })


-- require("dapui").setup({
-- 	layouts = {
-- 		{
-- 			-- watches, stacks, breakpoints, scopes
-- 			elements = {
-- 				{ id = "watches", size = 0.20 },
-- 				{ id = "stacks", size = 0.20 },
-- 				{ id = "breakpoints", size = 0.20 },
-- 				{ id = "scopes", size = 0.40 },
-- 			},
-- 			-- ↓ 横のサイズ
-- 			size = 50,
-- 			position = "left",
-- 		},
-- 		{
-- 			-- repl
-- 			elements = { "repl" },
-- 			size = 0.30,
-- 			position = "bottom",
-- 		},
-- 	},
-- })

require("dap-go").setup({

	dap_adapters = {
		go = {
			type = 'server',
			port = '${port}',
			executable = {
				command = 'dlv',
				args = {'dap', '-l', '127.0.0.1:${port}' },
			}
		},
	},


	dap_configurations = {
		-- HINT
		-- :h dap.txt + code.vsualstudio.com/Docs/editor/debugging
		-- 都度改善していく必要あると思う。
		{
			type = 'go',
			name = 'Launch Debug',
			-- ↓ デバッグ対象のプログラムを走らせる指示。
			request = 'launch',
			program = "${file}",
			-- ↓ for docker container
			-- env = {
				-- 	DB_USER = "docker",
				-- 	DB_PASS = "docker",
				-- 	DB_NAME = "docker",
				-- }
			},

		{
			type = 'go',
			name = 'Attach local',
			request = 'attach',
			mode = 'local',
			program = '${file}',
		},

		{
			type = 'go',
			name = 'Debug the Test',
			request = 'launch',
			mode = 'test',
			program = '${file}',
		},

		{
			type = 'go',
			name = 'Debug test (go.mode)',
			request = 'launch',
			mode = 'test',
			program = './${relativeFileDirname}',
		},

		{
			type = "go",
			name = "Attach remote",
			-- ↓ not local.
			mode = "remote",
			--↓デバッグのために既に実行中のプロセスに対しての接続。
			request = "attach",
			program = "${file}",
		},
	},

	-- delve configurations
	delve = {
		-- the path to the executable dlv which will be used for debugging.
		-- by default, this is the "dlv" executable on your PATH.
		path = "dlv",
		-- time to wait for delve to initialize the debug session.
		-- default to 20 seconds
		initialize_timeout_sec = 20,
		-- a string that defines the port to start delve debugger.
		-- default to string "${port}" which instructs nvim-dap
		-- to start the process in a random available port
		port = "${port}",
		-- additional args to pass to dlv
		args = {},
		-- the build flags that are passed to delve.
		-- defaults to empty string, but can be used to provide flags
		-- such as "-tags=unit" to make sure the test suite is
		-- compiled during debugging, for example.
		-- passing build flags using args is ineffective, as those are
		-- ignored by delve in dap mode.
		build_flags = "",
	},

})

vim.fn.sign_define('DapBreakpoint', {text = '🐞'})


-- keymaps

-- vim.keymap.set('n', '<leader>dp', ':lua require"dapui".toggle()<CR>', {silent = true})
vim.keymap.set('n', '<leader>bb', ':lua require"dap".toggle_breakpoint()<CR>', {silent = true})
vim.keymap.set('n', '<leader>B', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
vim.keymap.set('n', '<leader>lp', ':lua require"dap".set_breakpoint(nil, nil,vim.fn.input("Log point message: "))<CR>')
-- vim.keymap.set('n', '<leader>dc', ':lua require"dap".continue()<CR>', {silent = true})
-- vim.keymap.set('n', '<leader>di', ':lua require"dap".step_into()<CR>', {silent = true})
-- vim.keymap.set('n', '<leader>do', ':lua require"dap".step_over()<CR>', {silent = true})
-- vim.keymap.set('n', '<leader>ds', ':lua require"dap".step_out()<CR>', {silent = true})
vim.keymap.set('n', '<leader>da', ':lua require"dap".clear_breakpoints()<CR>', {silent = true})
-- vim.keymap.set('n', '<leader>dt', ':lua require"dap-go".debug_test()<CR>', {silent = true})

-- trigger
-- https://microsoft.github.io/debug-adapter-protocol/overview
local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized['dap_config'] = function()
	dapui.open()
end
dap.listeners.before.event_terminated['dap_config'] = function()
	dapui.close()
end
dap.listeners.before.event_exited['dap_config'] = function()
	dapui.close()
end

vim.cmd('highlight DapUICursorLine ctermbg=Red')
