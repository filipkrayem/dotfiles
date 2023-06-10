vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 40,
		relativenumber = true,
	},
	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},
	renderer = {
		group_empty = true,
		root_folder_label = false,
	},
	filters = {
		dotfiles = false,
		custom = { "^.git$", "node_modules/*", ".cache/*", ".DS_Store", ".vscode/", ".idea/" },
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")

		api.config.mappings.default_on_attach(bufnr)
		-- vim.keymap.del("n", "s", { buffer = bufnr })
	end,
})
