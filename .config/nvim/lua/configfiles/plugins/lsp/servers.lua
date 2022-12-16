local utils = require('configfiles.plugins.lsp.utils')

local lsp_flags = {
  debounce_text_changes = 150,
  allow_incremental_sync = true,
}

local capabilities = utils.capabilities()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  utils.mappings(bufnr)
  if client.server_capabilities.signatureHelpProvider then
    require('lsp-overloads').setup(client, { })
  end
end

require('lspconfig')['pyright'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}
require('lspconfig')['clangd'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  cmd = { "clangd", "--completion-style=detailed" }

}
require('lspconfig')['sumneko_lua'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    Lua = {
      completion = {
        enable = true,
      },
      diagnostics = { globals = { 'vim' }}
    }
  }
}
require('lspconfig')['tsserver'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}
require('lspconfig')['rust_analyzer'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {}
  }
}
require('lspconfig')['bashls'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}
require('lspconfig')['texlab'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}
