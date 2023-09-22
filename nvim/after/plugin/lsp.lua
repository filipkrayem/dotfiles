local lsp = require("lsp-zero").preset({})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<CR>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "<leader>gd", function()
		require("telescope.builtin").lsp_definitions()
	end, opts)
	vim.keymap.set("n", "gd", function()
		require("telescope.builtin").lsp_definitions()
	end, opts)
	vim.keymap.set("n", "<leader>gt", function()
		require("telescope.builtin").lsp_type_definitions()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>ws", function()
		require("telescope.builtin").lsp_dynamic_workspace_symbols()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>gr", function()
		require("telescope.builtin").lsp_references()
	end, opts)
	vim.keymap.set("n", "<leader>gi", function()
		require("telescope.builtin").lsp_implementations()
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)

	-- format on save + organize imports
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_buf_create_user_command(bufnr, "LspFormatting", function()
			vim.lsp.buf.format({
				bufnr = bufnr,
				filter = function(c)
					return c.name == "null-ls"
				end,
			})
		end, {})
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			command = "undojoin | LspFormatting",
		})
	end

	local tw_highlight = require("tailwind-highlight")

	tw_highlight.setup(client, bufnr, {
		single_column = false,
		mode = "background",
		debounce = 200,
	})
end)

lsp.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
})

require("lspconfig").eslint.setup({
	single_file_support = false,
	settings = {
		format = false,
		lint = true,
		codeActionOnSave = {
			enable = false,
			mode = "all",
		},
		codeAction = {
			disableRuleComment = {
				enable = false,
			},
			showDocumentation = {
				enable = false,
			},
		},
	},
})

lsp.setup()

cmp.setup({
	mapping = cmp_mappings,
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
		-- { name = "nvim_lsp_signature_help" },
	},
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	window = {
		documentation = cmp.config.window.bordered({}),
		completion = cmp.config.window.bordered(),
		signature = cmp.config.window.bordered(),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = require("lspkind").cmp_format({
			mode = "symbol_text", -- show only symbol annotations
			maxwidth = 80, -- prevent the popup from showing more than provided characters
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
			preset = "codicons",
			before = function(entry, vim_item)
				if entry.completion_item.detail ~= nil and entry.completion_item.detail ~= "" then
					if entry.completion_item.detail:len() > 30 then
						vim_item.menu = entry.completion_item.detail:sub(1, 30) .. "..."
					else
						vim_item.menu = entry.completion_item.detail
					end
				else
					local menu_text = {
						nvim_lsp = "[LSP]",
						buffer = "[BUF]",
						luasnip = "[SNP]",
						path = "[PTH]",
						nvim_lua = "[LUA]",
					}
					vim_item.menu = menu_text[entry.source.name]
				end
				return vim_item
			end,
		}),
	},
})

local null_ls = require("null-ls")

require("mason-null-ls").setup({
	ensure_installed = {
		"prettierd",
		"stylua",
		"rustfmt",
		"tsserver",
		-- Opt to list sources here, when available in mason.
	},
	automatic_installation = false,
	handlers = {},
})

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.eslint_d.with({
			filter = function(diagnostic)
				return not string.find(diagnostic.code or "", "typescript-eslint", 1, true)
			end,
			condition = function()
				return false
			end,
		}),
		null_ls.builtins.formatting.eslint_d.with({
			condition = function()
				return false
			end,
		}),
		null_ls.builtins.formatting.gofmt.with({
			extra_args = { "-s" },
		}),
		null_ls.builtins.formatting.prismaFmt,
	},
	debug = false,
})

vim.diagnostic.config({
	virtual_text = true,
})
