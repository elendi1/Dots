-- General
lvim.log.level = "warn"
lvim.format_on_save = false

-- Colorscheme
lvim.colorscheme = "tokyonight"
vim.g.tokyonight_style = "night"

-- Builtin
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.dap.active = true

-- Treesitter
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

-- LSP
lvim.lsp.automatic_servers_installation = false
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
local opts = {}
local servers = require "nvim-lsp-installer.servers"
local server_available, requested_server = servers.get_server "pylsp"
if server_available then
  opts.cmd_env = requested_server:get_default_options().cmd_env
end
require("lvim.lsp.manager").setup("pylsp", opts)

-- DAP
-- DAP vtext
require("nvim-dap-virtual-text").setup {
    commented = true,
}
-- DAP UI
local dap, dapui = require "dap", require "dapui"
dapui.setup {} -- use default
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
-- DAP Python
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
-- DAP Keybindings
lvim.builtin.which_key.mappings["d"] = {
   name = "+Debugger",
   R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
   E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
   C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
   U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
   b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
   c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
   d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
   e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
   g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
   h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
   S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
   i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
   o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
   p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
   q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
   r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
   s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
   t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
   x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
   u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
}

-- Keymappings
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}


-- Which-key keybindings for Trouble
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- Additional Plugins
lvim.plugins = {
  { "folke/tokyonight.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "theHamsta/nvim-dap-virtual-text" },
  { "rcarriga/nvim-dap-ui" },
  { "mfussenegger/nvim-dap-python" },
  { "nvim-telescope/telescope-dap.nvim" },
}
