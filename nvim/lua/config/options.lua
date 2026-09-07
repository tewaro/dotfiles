-- Number
vim.opt.number = true
vim.opt.relativenumber = false

-- Mouse/Cursor
vim.opt.mouse = 'a'
vim.opt.cursorline = true

-- Tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

-- Status Line
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0
vim.opt.scrolloff = 5

-- New Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Display Certain WhiteSpace
vim.opt.list = true
vim.opt.listchars = {tab = "» " ,trail = "·"}

-- End of Line Options
vim.opt.tw = 100
vim.opt.colorcolumn = "101"

-- Project-local config
vim.opt.exrc = true

-- File reloading
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "checktime",
})

-- Notify when file is reloaded
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  command = "lua vim.notify('File changed on disk. Buffer reloaded.', vim.log.levels.WARN)",
})

