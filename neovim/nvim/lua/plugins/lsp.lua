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
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "Fix startup error by disabling semantic tokens for omnisharp",
			group = vim.api.nvim_create_augroup("OmnisharpHook", {}),
			callback = function(ev)
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				if not client then return end
				if client.name == "omnisharp" then
					client.server_capabilities.semanticTokensProvider = nil
				end
			end,
		})

		local lsp = require('vim.lsp')
		vim.keymap.set('n', 'gd', lsp.buf.definition)
		vim.keymap.set('n', 'gh', lsp.buf.hover, { silent = true, noremap = true })
		vim.keymap.set('n', 'gi', lsp.buf.implementation)
		vim.keymap.set('n', 'gs', lsp.buf.signature_help, { silent = true, noremap = true })


		local capabilities = require('blink.cmp').get_lsp_capabilities()
		local lspconfig = require('lspconfig')
		lspconfig.lua_ls.setup { capabilities = capabilities }
		lspconfig.ts_ls.setup { capabilities = capabilities }
		lspconfig.fsautocomplete.setup { capabilities = capabilities }
		lspconfig.omnisharp.setup {
			capabilities = capabilities,
			enable_roslyn_analysers = true,
			enable_import_completion = true,
			organize_imports_on_format = false,
			enable_decompilation_support = true,
			filetypes = { 'cs', 'vb', 'csproj', 'sln', 'slnx', 'props', 'csx', 'targets' },
			cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
		}
	end
}
