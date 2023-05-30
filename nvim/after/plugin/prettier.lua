local prettier = require("prettier")

prettier.setup({
	bin = "prettierd", -- or `'prettierd'` (v0.23.3+)
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
	cli_options = {
		arrow_parens = "always",
		bracket_spacing = false,
		bracket_same_line = false,
		embedded_language_formatting = "auto",
		html_whitespace_sensitivity = "css",
		jsx_bracket_same_line = true,
		jsx_single_quote = false,
		print_width = 120,
		prose_wrap = "preserve",
		quote_props = "as-needed",
		semi = true,
		single_quote = false,
		single_attribute_per_line = false,
		tab_width = 4,
		trailing_comma = "always",
		use_tabs = false,
		vue_indent_script_and_style = false,
	},
})
