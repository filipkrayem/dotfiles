local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"rose-pine/neovim",
		as = "rose-pine",
	})

	use({
		"folke/tokyonight.nvim",
	})

	use({
		"daschw/leaf.nvim",
	})

	use({
		"sainnhe/sonokai",
	})

	use({
		"EdenEast/nightfox.nvim",
	})

	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			})
		end,
	})

	use("numToStr/Comment.nvim")

	use("nvim-treesitter/playground")
	use("theprimeagen/harpoon")
	use("theprimeagen/refactoring.nvim")
	use("mbbill/undotree")
	use("nvim-treesitter/nvim-treesitter-context")
	use("mortepau/codicons.nvim")
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
	})

	use("kdheepak/tabline.nvim")
	use("christoomey/vim-tmux-navigator")

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})

	use("MunifTanjim/prettier.nvim")
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")
	use("princejoogie/tailwind-highlight.nvim")

	-- use("jose-elias-alvarez/typescript.nvim")
	use({
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})

	use({ "catppuccin/nvim" })

	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	use("mg979/vim-visual-multi", { branch = "master" })

	use("kylechui/nvim-surround")
	use("nvim-lua/plenary.nvim")

	use("nvim-lualine/lualine.nvim")
	use("onsails/lspkind.nvim")

	use("jay-babu/mason-null-ls.nvim")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({
		"ray-x/lsp_signature.nvim",
	})
	use({

		"hrsh7th/cmp-nvim-lsp-signature-help",
	})

	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	})

	use("petertriho/nvim-scrollbar")

	use("windwp/nvim-ts-autotag")

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	use("f-person/git-blame.nvim")
	use("APZelos/blamer.nvim")

	use("akinsho/git-conflict.nvim")

	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	use("folke/zen-mode.nvim")
	use("tpope/vim-fugitive")
	use("airblade/vim-gitgutter")
	use("github/copilot.vim")
	use("eandrju/cellular-automaton.nvim")
end)
