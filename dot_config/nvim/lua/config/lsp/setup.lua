-- Setup installer & lsp configs
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local ufo_utils = require("utils._ufo")
local ufo_config_handler = ufo_utils.handler

mason.setup({
  ui = {
    border = EcoVim.ui.float.border or "rounded",
  },
})

-- Get capabilities from blink.cmp
local capabilities = require('blink.cmp').get_lsp_capabilities()

-- Set folding capabilities for nvim-ufo
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local function on_attach(client, bufnr)
  vim.lsp.inlay_hint.enable(true, { bufnr })
  if client.server_capabilities.documentSymbolProvider then
    pcall(function()
      require("nvim-navic").attach(client, bufnr)
    end)
  end
end

-- Global override for floating preview border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or EcoVim.ui.float.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Default config for all LSP servers
vim.lsp.config('*', {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Server-specific configurations
vim.lsp.config('lua_ls', {
  settings = require("config.lsp.servers.lua_ls").settings,
})

vim.lsp.config('jsonls', {
  settings = require("config.lsp.servers.jsonls").settings,
})

vim.lsp.config('cssls', {
  on_attach = require("config.lsp.servers.cssls").on_attach,
  settings = require("config.lsp.servers.cssls").settings,
})

vim.lsp.config('eslint', {
  on_attach = require("config.lsp.servers.eslint").on_attach,
  settings = {
    eslint = require("config.lsp.servers.eslint").settings,
  },
  flags = {
    allow_incremental_sync = false,
    debounce_text_changes = 1000,
  },
})

vim.lsp.config('tailwindcss', {
  filetypes = require("config.lsp.servers.tailwindcss").filetypes,
  init_options = require("config.lsp.servers.tailwindcss").init_options,
  on_attach = require("config.lsp.servers.tailwindcss").on_attach,
  settings = require("config.lsp.servers.tailwindcss").settings,
})

vim.lsp.config('vuels', {
  filetypes = require("config.lsp.servers.vuels").filetypes,
  init_options = require("config.lsp.servers.vuels").init_options,
  on_attach = require("config.lsp.servers.vuels").on_attach,
  settings = require("config.lsp.servers.vuels").settings,
})

-- Setup mason-lspconfig
mason_lsp.setup({
  ensure_installed = {
    "bashls",
    "cssls",
    "eslint",
    "graphql",
    "html",
    "jsonls",
    "lua_ls",
    "prismals",
    "tailwindcss",
  },
  automatic_enable = {
    exclude = { "ts_ls" }, -- We use typescript-tools instead
  },
})

-- Setup typescript-tools separately (not via mason-lspconfig automatic_enable)
require("typescript-tools").setup({
  capabilities = capabilities,
  handlers = require("config.lsp.servers.tsserver").handlers,
  on_attach = require("config.lsp.servers.tsserver").on_attach,
  settings = require("config.lsp.servers.tsserver").settings,
})

-- Setup nvim-ufo for folding
require("ufo").setup({
  fold_virt_text_handler = ufo_config_handler,
  close_fold_kinds_for_ft = { default = { "imports" } },
})
