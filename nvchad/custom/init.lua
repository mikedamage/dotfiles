-- example file i.e lua/custom/init.lua

local api = vim.api
local g = vim.g
-- local filetype = vim.filetype

-- load your globals, autocmds here or anything .__.
g.mapleader = ","

api.nvim_set_option("scrolloff", 5)

--[[
filetype.add {
   extension = {
      mdx = "markdown",
   },
}
]]
--

api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
   pattern = "*.mdx",
   callback = function()
      api.nvim_buf_set_option(0, "filetype", "markdown")
      api.nvim_buf_set_option(0, "syntax", "javascriptreact.markdown")
   end,
})
