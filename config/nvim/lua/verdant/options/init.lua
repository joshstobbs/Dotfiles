local opt = vim.opt
local cmd = vim.cmd

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = "expr"
-- opt.foldtext = "v:lua.vim.treesitter.foldtext()"
-- opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

opt.showcmdloc = "statusline"

opt.cursorline = true
cmd("set iskeyword+=-")
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]]) -- stop comments from starting on new lines
opt.shortmess:append("c")
opt.ignorecase = true
opt.smartcase = true
opt.swapfile = false
opt.cmdheight = 0
opt.laststatus = 3
opt.termguicolors = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.wrap = false
opt.number = true
opt.relativenumber = true
opt.wildmode = "longest:full,full"
opt.completeopt = "menuone,longest,preview"
opt.title = true
opt.mouse = "a"
opt.mousemoveevent = true
opt.breakindent = true
opt.linebreak = true
opt.list = true
opt.listchars = { tab = "▸ " } -- , trail = "·"
opt.fillchars:append({ eob = " " })
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.confirm = true -- ask for confirmation instead of erroring
opt.undofile = true -- persistent undo
opt.backup = true -- automatically save a backup file
opt.backupdir:remove(".") -- keep backups out of the current directory
opt.shortmess:append({ I = true }) -- disable the splash screen
opt.signcolumn = "yes:1"
opt.showmode = false
opt.updatetime = 4001 -- Set updatime to 1ms longer than the default to prevent polyglot from changing it
opt.redrawtime = 10000 -- Allow more time for loading syntax on large files
