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

require("lazy").setup({
	require("verdant.plugins.popup"),
	require("verdant.plugins.plenary"),
	require("verdant.plugins.vim-cool"),
	require("verdant.colorscheme"),
	require("verdant.plugins.legendary"),
	require("verdant.plugins.flash"),
	require("verdant.plugins.smart-splits"),
	require("verdant.plugins.indent-blankline"),
	require("verdant.plugins.nvim-tree"),
	require("verdant.plugins.treesitter"),
	require("verdant.plugins.treesitter.autotag"),
	require("verdant.plugins.treesitter.autopairs"),
	require("verdant.plugins.treesj"),
	require("verdant.plugins.wildfire"),
	require("verdant.plugins.scrollEOF"),
	require("verdant.plugins.better-escape"),
	require("verdant.plugins.comment"),
	require("verdant.plugins.surround"),
	require("verdant.plugins.vim-pasta"),
	require("verdant.plugins.vim-illuminate"),
	require("verdant.plugins.vim-unimpaired"),
	require("verdant.plugins.vim-repeat"),
	require("verdant.plugins.vim-lastplace"),
	require("verdant.plugins.vim-visual-star-search"),
	require("verdant.plugins.vim-visual-multi"),
	require("verdant.plugins.vim-textobj-xmlattr"),
	require("verdant.plugins.neoscroll"),
	require("verdant.plugins.telescope"),
	require("verdant.plugins.lsp-zero"),
	require("verdant.plugins.conform"),
	require("verdant.plugins.nvim-ufo"),
	require("verdant.plugins.heirline"),
	require("verdant.plugins.toggleterm"),
	require("verdant.plugins.gitsigns"),
	require("verdant.plugins.marks"),
	require("verdant.plugins.nvim-spider"),
	require("verdant.plugins.fzf-lua"),
	require("verdant.plugins.neotest"),
	require("verdant.plugins.tailwind-tools"),
	require("verdant.plugins.wezterm-move"),
	require("verdant.plugins.edgy"),
	require("verdant.plugins.neogit"),
	require("verdant.plugins.mini-ai"),
	require("verdant.plugins.vim-bufsurf"),
	-- require("verdant.plugins.multiple-cursors"),
	-- require("verdant.plugins.qmk"),
})
