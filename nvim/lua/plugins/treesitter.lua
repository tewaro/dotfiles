local languages = {
	"c",
	"lua",
	"vim",
	"vimdoc",
	"cpp",
	"rust",
	"go",
	"python",
	"haskell",
	"markdown",
	"markdown_inline"
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function ()
		local ts = require("nvim-treesitter")

		ts.install(languages)
		vim.api.nvim_create_autocmd('FileType', {
			group = vim.api.nvim_create_augroup('treesitter.setup', {}),
			callback = function(args)
				local buf = args.buf
				local filetype = args.match

				-- you need some mechanism to avoid running on buffers that do not
				-- correspond to a language (like oil.nvim buffers), this implementation
				-- checks if a parser exists for the current language
				local language = vim.treesitter.language.get_lang(filetype) or filetype
				if not vim.treesitter.language.add(language) then
						return
				end

				-- replicate `fold = { enable = true }`
				vim.wo.foldmethod = 'expr'
				vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

				-- replicate `highlight = { enable = true }`
				vim.treesitter.start(buf, language)

				-- replicate `indent = { enable = true }`
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		})
	end
}
