return {
    "shaunsingh/nord.nvim",
    name = "nord",
    lazy = false,
    priority = 1000,
    config = function()
    	  require("nord").set()
    	  vim.cmd.colorscheme "nord"
vim.g.nord_disable_background = true
    	end,
}
