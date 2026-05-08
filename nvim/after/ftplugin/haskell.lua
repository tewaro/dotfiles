local ht = require("haskell-tools")
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr }
-- haskell-language-server relies heavily on codeLenses,

opts["desc"] = "run codelens"
vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, opts)

opts["desc"] = "hoogle search for definition under the cursor"
vim.keymap.set("n", "<leader>hs", ht.hoogle.hoogle_signature, opts)

opts["desc"] = "Evaluate all code snippets"
vim.keymap.set("n", "<leader>ea", ht.lsp.buf_eval_all, opts)

-- Toggle a GHCi repl for the current package
opts["desc"] = "GHCi repl for current package"
vim.keymap.set("n", "<leader>rr", ht.repl.toggle, opts)

-- Toggle a GHCi repl for the current buffer
opts["desc"] = "GHCi repl for current buffer"
vim.keymap.set("n", "<leader>rf", function()
	ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, opts)

opts["desc"] = "GHCi repl quit"
vim.keymap.set("n", "<leader>rq", ht.repl.quit, opts)
