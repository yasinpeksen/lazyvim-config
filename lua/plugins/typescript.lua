-- TypeScript: extend DAP with NestJS configs (extras loaded in config/lazy.lua)
return {
  -- Extend nvim-dap with NestJS launch configs
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      local js_ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

      -- NestJS launch configurations (Node/TS extras already add "Launch file" and "Attach")
      for _, ft in ipairs(js_ft) do
        local configs = dap.configurations[ft] or {}
        -- NestJS: start with debug (npx nest start --debug)
        table.insert(configs, {
          type = "pwa-node",
          request = "launch",
          name = "NestJS: Start (debug)",
          runtimeExecutable = "npx",
          runtimeArgs = { "nest", "start", "--debug" },
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          sourceMaps = true,
          skipFiles = { "<node_internals>/**", "node_modules/**" },
          resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
        })
        -- NestJS: run built app (node dist/main.js)
        table.insert(configs, {
          type = "pwa-node",
          request = "launch",
          name = "NestJS: Run built (dist/main)",
          program = "${workspaceFolder}/dist/main.js",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          skipFiles = { "<node_internals>/**", "node_modules/**" },
          resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
        })
        dap.configurations[ft] = configs
      end

      return {}
    end,
  },

  -- Ensure ESLint and js-debug-adapter are installed via Mason
  -- {
  --   "williamboman/mason.nvim",
  --   opts = function(_, opts)
  --     opts.ensure_installed = opts.ensure_installed or {}
  --     vim.list_extend(opts.ensure_installed, {
  --       "eslint_d",
  --       "js-debug-adapter",
  --     })
  --   end,
  -- },
}
