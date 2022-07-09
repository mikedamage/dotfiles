local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
   -- JS and web files:
   b.formatting.prettierd.with {
      extra_filetypes = { "ruby" },
   },
   b.diagnostics.eslint,
   b.diagnostics.rubocop,

   -- Lua:
   b.formatting.stylua,

   -- Shell scripts:
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,

      -- format on save:
      on_attach = function(client)
         if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 3000)"
         end
      end,
   }
end

return M

--[[
-- Old attempt at format on save:

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.gitsigns
  },

  -- Format files on save
  on_attach = function(client, bufnr)
    print("Buffer num " .. bufnr)
    print("Document formatting support: " .. client.resolved_capabilities.document_formatting)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.formatting_sync()
        end
      })
    end
  end
})
--]]
