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

require('lspconfig')['clangd'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  cmd = { "clangd", "--completion-style=detailed" },
}

require('lspconfig')['pyright'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic"
      }
    },
  }
}

-- https://luals.github.io/#neovim-install
require('lspconfig')['lua_ls'].setup{
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

require('lspconfig')['gopls'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig')['omnisharp'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}
