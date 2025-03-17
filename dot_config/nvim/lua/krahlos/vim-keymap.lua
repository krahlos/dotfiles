vim.g.mapleader = " "

-- Allow pasting with CTRL+V
vim.keymap.set("i", "<C-v>", '<Esc>"+p', { desc = "Paste with CTRL+V", noremap = true, silent = true })

-- Allow copying with CTRL+C
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy with CTRL+C", noremap = true, silent = true })

-- Allow cutting with CTRL+X
vim.keymap.set("v", "<C-x>", '"+d', { desc = "Cut with CTRL+X", noremap = true, silent = true })

-- Select all with CTRL+A
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all with CTRL+A", noremap = true, silent = true })

-- Save file with CTRL+S
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file with CTRL+S", silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file with CTRL+S", silent = true })

-- Save all files with CTRL+Shift+S
vim.keymap.set("n", "<C-S>", ":wa<CR>", { desc = "Save all files with CTRL+Shift+S", silent = true })

-- Undo with CTRL+Z
vim.keymap.set("n", "<C-z>", "u", { desc = "Undo with CTRL+Z", silent = true })
vim.keymap.set("i", "<C-z>", "<Esc>u", { desc = "Undo with CTRL+Z", silent = true })

-- Jump to the beginning and the end of the line
vim.keymap.set("i", "<C-Left>", "^", { noremap = true })
vim.keymap.set("i", "<C-Right>", "$", { noremap = true })

-- Jump to the beginning and the end of the file
vim.keymap.set("n", "<C-Home>", "gg", { noremap = true, silent = true })
vim.keymap.set("n", "<C-End>", "G", { noremap = true, silent = true })

-- Jump back and forth with Alt + arrow keys
vim.keymap.set("n", "<A-Left>", "<C-o>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Right>", "<C-i>", { noremap = true, silent = true })

-- In visual mode move selected lines up and down with Alt + arrow keys
vim.keymap.set("v", "<A-Left>", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Right>", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Format file with <leader>ff
vim.keymap.set("n", "<leader>ff", ":lua vim.lsp.buf.formatting()<CR>", { desc = "Format file", silent = true })
