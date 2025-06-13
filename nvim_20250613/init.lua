-- FILE: ~/.config/nvim/init.lua
-- set leader key to space
vim.g.mapleader = ' '

-- key mappings
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })  -- save file
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })  -- quit neovim
vim.keymap.set('n', 'q', '<Nop>', { noremap = true, silent = true }) -- disable recording
vim.keymap.set('n', '<leader>r', 'q', { noremap = true, silent = true }) -- recording to <space>r
vim.keymap.set('n', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true }) 
-- window navigation in normal mode ('n') (rely on vim-tmux-navigator for <C-h/j/k/l>)
vim.keymap.set('n', '<C-h>', '<cmd>lua require("tmux").move_left()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<cmd>lua require("tmux").move_down()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<cmd>lua require("tmux").move_up()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<cmd>lua require("tmux").move_right()<CR>', { noremap = true, silent = true })

-- terminal mode navigation ('t')
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><cmd>lua require("tmux").move_left]<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><cmd>lua require("tmux").move_down]<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><cmd>lua require("tmux").move_up]<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><cmd>lua require("tmux").move_right]<CR>]], { noremap = true, silent = true })

-- disable vi compatibility mode
vim.opt.compatible = false

-- basic settings
vim.opt.number = true  -- show line numbers
vim.opt.relativenumber = true  -- show relative line numbers for better navigation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.timeoutlen = 600  -- faster leader timeout
vim.opt.cursorline = true  -- highlight the current line for better readability
vim.o.termguicolors = true
vim.o.syntax = 'on'
vim.opt.smartindent = true

-- python3 path
vim.g.python3_host_prog = '/Users/adamjensen/.pyenv/shims/python3'

-- packer bootstrap
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- autocommand for packer sync
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost init.lua source <afile> | PackerSync
    augroup end
]])

-- plugins
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-fugitive'
    use 'christoomey/vim-tmux-navigator'
    use {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end }
    use 'tpope/vim-commentary'
    if packer_bootstrap then
        require('packer').sync()
    end
end)
