-- custom plugins init

return {
  ["editorconfig/editorconfig-vim"] = { "editorconfig/editorconfig-vim" },

  ["tpope/vim-fugitive"] = { "tpope/vim-fugitive" },

  ["goolord/alpha-nvim"] = {
    disable = false,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- ["jose-elias-alvarez/null-ls.nvim"] = {
  --   after = "nvim-lspconfig",
  --
  --   config = function()
  --     require("custom.plugins.null-ls").setup()
  --   end,
  -- },

  ["windwp/nvim-ts-autotag"] = { "windwp/nvim-ts-autotag" },

  ["p00f/nvim-ts-rainbow"] = { "p00f/nvim-ts-rainbow" },

  ["jdhao/better-escape.vim"] = {
    event = "InsertEnter",
  },

  ["lambdalisue/suda.vim"] = { "lambdalisue/suda.vim" },

  ["ibhagwan/fzf-lua"] = {
    requires = { "kyazdani42/nvim-web-devicons" },
  },

  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

  ["nvim-telescope/telescope-live-grep-args.nvim"] = { "nvim-telescope/telescope-live-grep-args.nvim" },

  ["ur4ltz/surround.nvim"] = {
    config = function()
      require("surround").setup { mappings_style = "sandwich" }
    end,
  },

  ["RRethy/nvim-treesitter-endwise"] = { "RRethy/nvim-treesitter-endwise" },

  ["iamcco/markdown-preview.nvim"] = {
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  ["simrat39/symbols-outline.nvim"] = {
    config = function()
      require("symbols-outline").setup()
    end
  },

  ["rcarriga/nvim-notify"] = {
    config = function()
      vim.notify = require("notify")
    end,
  },

  ["MunifTanjim/nui.nvim"] = { "MunifTanjim/nui.nvim" },
}
