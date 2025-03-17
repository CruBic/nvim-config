local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy=false,
  },
  {
  "neovim/nvim-lspconfig",
   config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
   end,
},
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "eslintd",
        "prettierd",
        "html-lsp",
        "typescript-language-server",
        "angular-language-server",
        "dot-language-server",
        "json-lsp",
        "sqlls",
        "taplo",
        "terraform-ls",
        "yaml-language-server",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
{
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",
        "vimdoc",

        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "sql",
        "yaml",
        "angular"
      },
    },
  },
}
return plugins
