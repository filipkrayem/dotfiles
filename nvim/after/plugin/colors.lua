vim.opt.termguicolors = true

require("tokyonight").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	transparent = true, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "transparent", -- style for sidebars, see below
		floats = "transparent", -- style for floating windows
	},
	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = false, -- dims inactive windows
	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	---@param colors ColorScheme
	on_colors = function(colors) end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	---@param highlights Highlights
	---@param colors ColorScheme
	on_highlights = function(hl, c)
		hl.LineNr = { fg = c.comment }
	end,
})

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = {
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
	show_end_of_buffer = true, -- show the '~' characters after the end of buffers
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = function(colors)
		return {
			LineNr = { fg = colors.overlay0 },
		}
	end,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		harpoon = true,
		notify = false,
		mini = false,
		neotree = true,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- require("leaf").setup({
-- 	underlineStyle = "undercurl",
-- 	commentStyle = "italic",
-- 	functionStyle = "NONE",
-- 	keywordStyle = "italic",
-- 	statementStyle = "bold",
-- 	typeStyle = "NONE",
-- 	variablebuiltinStyle = "italic",
-- 	transparent = true,
-- 	colors = {},
-- 	overrides = {},
-- 	theme = "dark", -- default, based on vim.o.background, alternatives: "light", "dark"
-- 	contrast = "low", -- default, alternatives: "medium", "high"
-- })
--
-- require("nightfox").setup({
-- 	options = {
-- 		-- Compiled file's destination location
-- 		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
-- 		compile_file_suffix = "_compiled", -- Compiled file suffix
-- 		transparent = true, -- Disable setting background
-- 		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
-- 		dim_inactive = false, -- Non focused panes set to alternative background
-- 		module_default = true, -- Default enable value for modules
-- 		colorblind = {
-- 			enable = true, -- Enable colorblind support
-- 			simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
-- 			severity = {
-- 				protan = 0, -- Severity [0,1] for protan (red)
-- 				tritan = 0, -- Severity [0,1] for tritan (blue)
-- 				deutan = 0, -- Severity [0,1] for deutan (green)
-- 			},
-- 		},
-- 		styles = { -- Style to be applied to different syntax groups
-- 			comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
-- 			conditionals = "NONE",
-- 			constants = "NONE",
-- 			functions = "NONE",
-- 			keywords = "NONE",
-- 			numbers = "NONE",
-- 			operators = "NONE",
-- 			strings = "NONE",
-- 			types = "NONE",
-- 			variables = "NONE",
-- 		},
-- 		inverse = { -- Inverse highlight for different types
-- 			match_paren = true,
-- 			visual = false,
-- 			search = false,
-- 		},
-- 		modules = { -- List of various plugins and additional options
-- 			-- ...
-- 		},
-- 	},
-- 	palettes = {},
-- 	specs = {},
-- 	groups = {},
-- })

require("rose-pine").setup({
	variant = "moon", -- auto, main, moon, or dawn
	dark_variant = "moon", -- main, moon, or dawn
	dim_inactive_windows = false,
	extend_background_behind_borders = true,

	styles = {
		bold = true,
		italic = true,
		transparency = true,
	},

	groups = {
		border = "muted",
		link = "iris",
		panel = "surface",

		error = "love",
		hint = "iris",
		info = "foam",
		warn = "gold",

		git_add = "foam",
		git_change = "gold",
		git_delete = "love",
		git_dirty = "gold",
		git_ignore = "muted",
		git_merge = "iris",
		git_rename = "pine",
		git_stage = "iris",
		git_text = "gold",
		git_untracked = "subtle",

		headings = {
			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
		-- Alternatively, set all headings at once.
		-- headings = "subtle",
	},

	highlight_groups = {
		Comment = { fg = "#907aa9" },
		NeoTreeDirectoryName = { fg = "iris" },
		NeoTreeDirectoryIcon = { fg = "iris" },
		NeoTreeExpander = { fg = "iris" },
		NeoTreeRootName = {
			fg = "iris",
			bold = true,
		},
		Keyword = { fg = "rose" },
		Type = { fg = "gold" },
		Property = { fg = "iris" },

		-- VertSplit = { fg = "muted", bg = "muted" },
	},

	before_highlight = function(group, highlight, palette)
		-- Disable all undercurls
		-- if highlight.undercurl then
		--     highlight.undercurl = false
		-- end
		--
		-- Change palette colour
		--
		-- if highlight.fg == palette.foam then
		-- 	highlight.fg = palette.iris
		-- end
	end,
})

vim.cmd.colorscheme("catppuccin")
