return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "c_sharp", "fsharp", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "html", "markdown", "markdown_inline", "xml", "yaml", "sql", },
			sync_install = false,
			auto_install = false,
			ignore_install = {},
			highlight = { enable = true },
			indent = { enable = true },
			additional_vim_regex_highlighting = false,
		})
	end
}
