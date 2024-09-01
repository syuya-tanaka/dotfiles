vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      -- config dap
      dap.icons = {
        breakpoint = "🐞",
        currentpos = "🦅",
      }
    end,
  },

  -- Golang
  {
    -- default keymaps
    -- key	Description
    -- c	continue
    -- n	next
    -- s	step
    -- o	stepout
    -- S	cap S: stop debug
    -- u	up
    -- D	cap D: down
    -- C	cap C: run to cursor
    -- b	toggle breakpoint
    -- P	cap P: pause
    -- p	print, hover value (also in visual mode)

    "leoluz/nvim-dap-go",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-go").setup()
      opts = {
        dap_adapters = {
          go = {
            type = "server",
            port = "${port}",
            executable = {
              command = "dlv",
              args = { "dap", "-l", "127.0.0.1:${port}" },
            },
          },
        },

        dap_configurations = {
          -- HINT
          -- :h dap.txt + code.vsualstudio.com/Docs/editor/debugging
          -- 都度改善していく必要あると思う。
          {
            type = "go",
            name = "Launch Debug",
            -- ↓ デバッグ対象のプログラムを走らせる指示。
            request = "launch",
            program = "${file}",
            -- ↓ for docker container
            -- env = {
            -- 	DB_USER = "docker",
            -- 	DB_PASS = "docker",
            -- 	DB_NAME = "docker",
            -- }
          },

          {
            type = "go",
            name = "Attach local",
            request = "attach",
            mode = "local",
            program = "${file}",
          },

          {
            type = "go",
            name = "Debug the Test",
            request = "launch",
            mode = "test",
            program = "${file}",
          },

          {
            type = "go",
            name = "Debug test (go.mode)",
            request = "launch",
            mode = "test",
            program = "./${relativeFileDirname}",
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
      }
    end,
  },

  -- Java
  -- {
  --
  -- }

  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    dependencies = { "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },

    opts = {
      layouts = {
        {
          -- watches, stacks, breakpoints, scopes, repl, console
          elements = {
            { id = "watches", size = 0.20 },
            { id = "stacks", size = 0.20 },
            { id = "breakpoints", size = 0.20 },
            { id = "scopes", size = 0.40 },
            { id = "repl", size = 0.80, position = "bottom" },
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
    },
    config = function()
      local dapui = require("dapui")
      dapui.setup()

      local dap = require("dap")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
  },
}
