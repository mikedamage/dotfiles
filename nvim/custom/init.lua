-- example file i.e lua/custom/init.lua

local api = vim.api
local g = vim.g
local opt = vim.opt

-- local filetype = vim.filetype

-- enable treesitter code folding:
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- load your globals, autocmds here or anything .__.
g.mapleader = ","

api.nvim_set_option("scrolloff", 5)

-- Neovide GUI specific options
if g.neovide then
  opt.guifont = "Iosevka Nerd Font:h24"
  g.neovide_cursor_animation_length = 0.025

   vim.keymap.set("n", "<C-=>", function()
      local gfn = vim.o.guifont
      local size = tonumber(string.match(gfn, ":h(%d+)$"), 10)
      opt.guifont = "Iosevka Nerd Font:h" .. (size + 2)
   end, { desc = "Increase GUI font size" })

   vim.keymap.set("n", "<C-->", function()
      local gfn = vim.o.guifont
      local size = tonumber(string.match(gfn, ":h(%d+)$"), 10)
      opt.guifont = "Iosevka Nerd Font:h" .. (size - 2)
   end, { desc = "Decrease font size" })
end

-- Autocommands
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
   pattern = "*.mdx",
   callback = function()
      api.nvim_buf_set_option(0, "filetype", "markdown")
      api.nvim_buf_set_option(0, "syntax", "javascriptreact.markdown")
   end,
})

-- Unfold auto-folded code sections
api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
  pattern = "*",
  callback = function()
    api.nvim_command(":normal! zR")
  end,
})

-- Remove dot from indentkeys in ruby files
api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
   pattern = "*.rb",
   callback = function()
      vim.opt.indentkeys:remove(".")
   end
})
