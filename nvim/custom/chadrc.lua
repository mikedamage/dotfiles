-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "gruvbox_material",
}

M.plugins = {
   user = require "custom.plugins",

   override = {
      ["nvim-treesitter/nvim-treesitter"] = {
         autotag = {
            enable = true,
         },

         endwise = {
           enable = true,
         },

         rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = 2000,
         },
      },

      ["nvim-telescope/telescope.nvim"] = {
         extensions_list = { "themes", "terms", "fzf", "live_grep_args" },
         requires = {
            { "nvim-telescope/telescope-live-grep-args.nvim" },
         },
      },

      ["williamboman/mason.nvim"] = {
        ensure_installed = {
          "lua-language-server",
          "stylua",
          "css-lsp",
          "html-lsp",
          "typescript-language-server",
          "json-lsp",
          "shfmt",
          "shellcheck",
          "solargraph",
        },
      }
   },
}

M.mappings = require "custom.mappings"

return M
