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

-- установка менеджера плагинов
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {}
local opts = {}

require("lazy").setup("plugins")

-- горячие клавиши для телескоп
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<c-p>', builtin.find_files,{})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- настройки treesitter
local config = require ("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "python"},
  highlight = { enable = true},
  indent = {enable = true},
})

-- горячие клавищи neo-tree
vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal toggle left<CR>')
--цветовое оформление, выше написано, что оно мне 
--не понравилось так и есть
 
--require("catppuccin").setup()
--vim.cmd.colorscheme "catppuccin"
