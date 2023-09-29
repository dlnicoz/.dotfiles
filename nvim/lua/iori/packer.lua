local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

         	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			-- vim.cmd("colorscheme rose-pine")
		end,
	})
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("theprimeagen/harpoon")
	use("theprimeagen/refactoring.nvim")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("nvim-treesitter/nvim-treesitter-context")


	-- lsp all configuration
	use({
		"nvimdev/lspsaga.nvim",
		after = "nvim-lspconfig",
		
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "rcarriga/nvim-dap-ui" },
            {"mfussenegger/nvim-dap"},
			{"mfussenegger/nvim-lint"},
			{ "nvimdev/lspsaga.nvim" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
            { "jay-babu/mason-null-ls.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{"ray-x/lsp_signature.nvim"},
			{ "onsails/lspkind.nvim" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-cmdline" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "mattn/emmet-vim" },

			{ "rafamadriz/friendly-snippets" },
		},
	})
	use("phaazon/hop.nvim")
	use({ "justinhj/battery.nvim" })
	use("nvim-lua/plenary.nvim")
	use("folke/zen-mode.nvim")
	use("github/copilot.vim")
	use("eandrju/cellular-automaton.nvim")
	use("laytan/cloak.nvim")
	use("terrortylor/nvim-comment")
	require("nvim_comment").setup()
	use("kyazdani42/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")
	use("ellisonleao/gruvbox.nvim")
	use("nvim-lualine/lualine.nvim")
	use("glepnir/dashboard-nvim")
	-- using packer.nvim
	-- use {
	--     'goolord/alpha-nvim',
	--     config = function()
	--         -- require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
	--         require 'alpha'.setup(require 'alpha.themes.startify'.config)
	--     end
	-- }
	use({ "akinsho/bufferline.nvim", tag = "v3.*" })
	-- Lua
	-- use({
	--     "folke/which-key.nvim",
	--     config = function()
	--         vim.o.timeout = true
	--         vim.o.timeoutlen = 300
	--         require("which-key").setup({
	--             -- your configuration comes here
	--             -- or leave it empty to use the default settings
	--             -- refer to the configuration section below
	--         })
	--     end,
	-- })
	-- tabline
	--
	--
	--
	--
	--
	--
	--
	--
	--
	--
	-- chris at machine plugins
	-- use {
	--   "zbirenbaum/copilot.lua",
	--   event = { "VimEnter" },
	--   config = function()
	--     vim.defer_fn(function()
	--       require "user.copilot"
	--     end, 100)
	--   end,
	-- }
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-ts-autotag")
	use("kylechui/nvim-surround")
	use({
		"abecodes/tabout.nvim",
		wants = { "nvim-treesitter" }, -- or require if not used so far
	})
	-- Note Taking
	use("mickael-menu/zk-nvim")
	-- Color
	-- use("NvChad/nvim-colorizer.lua")
	-- use "ziontee113/color-picker.nvim"
	use("nvim-colortils/colortils.nvim")
	use("lunarvim/onedarker.nvim")
	use("lunarvim/darkplus.nvim")
	use("folke/tokyonight.nvim")

	-- Terminal
	use("akinsho/toggleterm.nvim")
	-- Project
	use("ahmedkhalf/project.nvim")
	use("windwp/nvim-spectre")
	-- Session
	-- use "rmagatti/auto-session"
	-- use "rmagatti/session-lens"

	-- Quickfix
	use("kevinhwang91/nvim-bqf")

	-- Code Runner
	use("is0n/jaq-nvim")
	use({
		"0x100101/lab.nvim",
		run = "cd js && npm ci",
	})

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")
	use("ruifm/gitlinker.nvim")
	use("mattn/vim-gist")
	use("mattn/webapi-vim")
	use("norcalli/nvim-colorizer.lua")

	-- Github
	use("pwntester/octo.nvim")

	-- Editing Support
	use("windwp/nvim-autopairs")
	use("monaqa/dial.nvim")
	use("nacro90/numb.nvim")
	use("andymass/vim-matchup")
	use("karb94/neoscroll.nvim")
	use("junegunn/vim-slash")
	-- iori
	use("lukas-reineke/indent-blankline.nvim", main == "ibl", opts == {})
	use("echasnovski/mini.indentscope",  version == false)

	use("jose-elias-alvarez/null-ls.nvim")

	use("MunifTanjim/eslint.nvim")
	use("MunifTanjim/prettier.nvim")
	-- Lua
	use({
		"folke/trouble.nvim",
	})
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
