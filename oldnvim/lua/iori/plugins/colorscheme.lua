return {
  {
    "bluz71/vim-nightfly-guicolors",
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme tokyonight-moon]])
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
