vim.keymap.set("n", "-", "<cmd>Oil --float <CR>", { desc = "Open Parent Directory in Oil" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "jj Escape" })
vim.keymap.set("i", "kk", "<Esc>", { desc = "kk Escape" })
vim.keymap.set("i", "hh", "<Esc>", { desc = "hh Escape" })
vim.keymap.set("i", "lll", "<Esc>", { desc = "lll Escape" })
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open diagnostics in float" })
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ lsp_format = "fallback" })
end, { desc = "[C]ode [F]ormat current file" })
vim.keymap.set("n", "<localleader>ip", function()
	local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
	if venv ~= nil then
		-- in the form of /home/benlubas/.virtualenvs/VENV_NAME
		venv = string.match(venv, "/.+/(.+)")
		vim.cmd(("MoltenInit %s"):format(venv))
	else
		vim.cmd("MoltenInit python3")
	end
end, { desc = "Initialize Molten for python3", silent = true })
vim.keymap.set(
	"n",
	"<localleader>os",
	":noautocmd MoltenEnterOutput<CR>",
	{ desc = "open output window", silent = true }
)
vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
vim.keymap.set(
	"v",
	"<localleader>r",
	":<C-u>MoltenEvaluateVisual<CR>",
	{ desc = "execute visual selection", silent = true }
)
vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })
