return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys = {
		{
			"<leader>f",
			function()
				require("fzf-lua").files()
			end,
			desc = "[F]ind files in pwd",
		},
		{
			"<leader>sg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "[S]earch by [G]repping pwd",
		},
		{
			"<leader>sd",
			function()
				require("fzf-lua").files({ cwd = "~/.dotfiles" })
			end,
			desc = "[S]earch [D]otfiles config files",
		},
		{
			"<leader>sf",
			function()
				require("fzf-lua").built_in()
			end,
			desc = "[S]earch [F]inders",
		},
		{
			"<leader>sk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "[S]earch [K]eymaps",
		},
		{
			"<leader>sv",
			function()
				require("fzf-lua").grep_visual()
			end,
			desc = "[S]earch [V]isual",
		},
		{
			"<leader>sb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "[S]earch Buffers",
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").lgrep_curbuf()
			end,
			desc = "[/] Search Current Buffer",
		},
	},
}
