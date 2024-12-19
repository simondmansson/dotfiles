return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		"saghen/blink.cmp",
	},
	config = function()
		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if not client then return end
				if client.supports_method('textDocument/formatting') then
					vim.api.nvim_create_autocmd('BufWritePre', {
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
						end
					})
				end
			end
		})

		local lsp = require('vim.lsp')
		vim.keymap.set('n', 'gd', lsp.buf.definition)
		vim.keymap.set('n', 'gh', lsp.buf.hover)

		local capabilities = require('blink.cmp').get_lsp_capabilities()
		local lspconfig = require('lspconfig')
		lspconfig.lua_ls.setup { capabilities = capabilities }
		lspconfig.ts_ls.setup { capabilities = capabilities }
		lspconfig.fsautocomplete.setup { capabilities = capabilities }
		--require 'lspconfig'.csharp_ls.setup {}
		lspconfig.omnisharp.setup {
			capabilities = capabilities,
			enable_roslyn_analysers = true,
			enable_import_completion = true,
			organize_imports_on_format = true,
			enable_decompilation_support = true,
			filetypes = { 'cs', 'vb', 'csproj', 'sln', 'slnx', 'props', 'csx', 'targets' },
			cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
			on_attach = function(client, bufnr)
				-- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483#issuecomment-1492605642
				local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
				for i, v in ipairs(tokenModifiers) do
					tmp = string.gsub(v, ' ', '_')
					tokenModifiers[i] = string.gsub(tmp, '-_', '')
				end
				local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
				for i, v in ipairs(tokenTypes) do
					tmp = string.gsub(v, ' ', '_')
					tokenTypes[i] = string.gsub(tmp, '-_', '')
				end
				on_attach(client, bufnr)
			end,
			flags = {
				debounce_text_changes = 150,
			}
		}
	end
}
