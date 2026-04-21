-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- ----- TypeScript / ESLint (Lint) -----
-- Show diagnostics (Trouble)
map("n", "<leader>lD", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Lint: Diagnostics (Trouble)" })
-- Format with LSP (ESLint when in TS/JS)
map("n", "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Lint: Format (ESLint/LSP)" })
-- Fix all in buffer (code action)
map("n", "<leader>lF", function()
  vim.lsp.buf.code_action({ context = { only = { "source.fixAll" } }, apply = true })
end, { desc = "Lint: Fix all (ESLint)" })

-- ----- Debug (DAP) - TypeScript / Node / NestJS -----
-- DAP core extra also provides: <leader>db breakpoint, <leader>dc continue, <leader>di/do/dO step, <leader>du UI, etc.
-- Choose debug configuration and start (Launch file / NestJS / Attach)
map("n", "<leader>dd", function()
  local dap = require("dap")
  local ft = vim.bo.filetype
  local configs = dap.configurations[ft] or dap.configurations.javascript or dap.configurations.typescript or {}
  if #configs == 0 then
    vim.notify("No DAP configurations for filetype: " .. ft, vim.log.levels.WARN)
    return
  end
  vim.ui.select(configs, {
    prompt = "Debug: Choose configuration",
    format_item = function(cfg)
      return cfg.name or cfg.type .. " " .. (cfg.request or "")
    end,
  }, function(choice)
    if choice then
      dap.run(choice)
    end
  end)
end, { desc = "Debug: Choose configuration" })

-- ----- Jest Tests -----
-- Run Jest test for current file in new terminal split
map("n", "<leader>ct", function()
  local filepath = vim.fn.expand("%")
  local command = "npx jest " .. filepath
  vim.cmd("terminal " .. command)
end, { desc = "Run Jest test for current file" })

--- Find gql resolver from action repository ---
vim.keymap.set(
  "n",
  "<leader>gR",
  require("helpers.find-resolver").find,
  { desc = "Find resolver from action repository" }
)
