return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use

  "christoomey/vim-tmux-navigator", -- tmux & split window navigation

  "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },
  "phaazon/hop.nvim",

  "glepnir/dashboard-nvim",

  "ellisonleao/gruvbox.nvim",

  "akinsho/bufferline.nvim",

  "windwp/nvim-autopairs",

  "ray-x/lsp_signature.nvim",

  "HiPhish/rainbow-delimiters.nvim",

  "karb94/neoscroll.nvim",

  -- "lukas-reineke/indent-blankline.nvim",

  "echasnovski/mini.indentscope",

  "nvimdev/lspsaga.nvim",

  "folke/tokyonight.nvim",

  "sainnhe/sonokai",

  "rose-pine/neovim",

  "lunarvim/onedarker.nvim",

  "lunarvim/darkplus.nvim",

  "kevinhwang91/nvim-bqf",
  -- "p00f/nvim-ts-rainbow",
  "lewis6991/gitsigns.nvim",
  -- "f-person/git-blame.nvim",
  "ruifm/gitlinker.nvim",
  "mattn/vim-gist",
  "mattn/webapi-vim",
}
