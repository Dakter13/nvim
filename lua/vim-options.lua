-- табуляция теперь два символа
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- задает нумерацию строк
vim.cmd("set number")

--Копирование в визуальном режиме с-с
vim.api.nvim_set_keymap('v', '<c-c>', '"+y', { noremap = true, silent = true })
