vim.opt.list = true
vim.opt.listchars = { tab = "»·", trail = "·", extends = ">", precedes = "<", space = "·" }

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

-- Default settings (4 spaces)
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Override settings for Lua files (2 spaces)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

-- Insert final new line
vim.opt.fixendofline = true
