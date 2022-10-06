local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local extra_settings = {}

local servers = {
  "solargraph",
  "cssls",
  "html",
  "tsserver",
  "jsonls",
}

for _, lsp in ipairs(servers) do
  if lsp == "solargraph" then
    extra_settings = {
      solargraph = {
        completion = true,
        diagnostic = true,
        folding = true,
        references = true,
        rename = true,
        symbols = true,
      }
    }
  else
    extra_settings = {}
  end
  
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    settings = extra_settings,
  }
end

-- lspconfig.solargraph.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "ruby" },
--   root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
--   settings = {
--     solargraph = {
--       -- autoformat = true,
--       completion = true,
--       diagnostic = true,
--       folding = true,
--       references = true,
--       rename = true,
--       symbols = true,
--     },
--   },
-- }
