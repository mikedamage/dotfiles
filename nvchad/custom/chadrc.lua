-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "catppuccin",
}

M.plugins = {
   user = require "custom.plugins",

   override = {
      ["nvim-treesitter/nvim-treesitter"] = {
         autotag = {
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
   },
}

M.mappings = require "custom.mappings"

return M
