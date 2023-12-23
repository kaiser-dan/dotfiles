-- Font and spacing
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 4 spaces for a tab

-- Command line (not command-line)
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages

-- Line numbers and wraping
vim.opt.relativenumber = true -- relative line numbers
vim.opt.wrap = false -- wrap lines

-- Folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Aesthetics
vim.opt.termguicolors = true -- enable 24-bit colors
lvim.colorscheme = "sonokai"
-- lvim.colorscheme = "visual_studio_code"
