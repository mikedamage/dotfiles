local M = {}

M.nvterm = {
   -- Normal mode keybindings
   n = {
      ["<leader>tf"] = {
         function()
            require("nvterm.terminal").toggle "float"
         end,
         "Toggle floating terminal",
      },
      ["<leader>tv"] = {
         function()
            require("nvterm.terminal").toggle "vertical"
         end,
         "Toggle vertical terminal",
      },
   },
}

M.telescope = {
   n = {
      ["<leader>fw"] = {
         "<cmd> Telescope live_grep_args<cr>",
         "   live grep w/ custom args",
      },
      ["<leader>ff"] = {
         function()
            require("fzf-lua").files()
         end,
         "   find files w/ fzf",
      },
   },
}

M.general = {
   n = {
      ["<leader>gs"] = { "<cmd> Git<cr>", "  Git status (fugitive)" },
      ["<leader>gc"] = { "<cmd> Git commit<cr>", "  Git commit" },
      ["<leader>gb"] = {
         "<cmd> FzfLua git_branches<cr>",
         "  Git branches fuzzy finder",
      },
      ["<C-p>"] = {
         function()
            require("fzf-lua").files()
         end,
         "   find files w/ fzf",
      },
   },
}

return M
