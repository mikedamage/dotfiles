local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  local servers = { "html", "vuels", "tailwindcss" }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = function(client, bufnr)
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        attach(client, bufnr)

        if lsp == "vuels" then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              print("Format document")
              vim.lsp.buf.formatting_sync(nil, 4000)
            end
          })
        end
      end,
      capabilities = capabilities
    }
  end
end

return M
