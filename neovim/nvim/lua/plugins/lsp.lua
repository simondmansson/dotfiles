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
	},
	config = function()
		require("lspconfig").lua_ls.setup {}
		require("lspconfig").ts_ls.setup {}
		require("lspconfig").fsautocomplete.setup {}
		require("lspconfig").omnisharp.setup {
		  cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
		  enable_import_completion = true,
		  organize_imports_on_format = true,
		  enable_roslyn_analyzers = true,
		--  root_dir = function ()
                 --   return vim.loop.cwd() -- current working directory
		  -- end,
		}
	end
}
