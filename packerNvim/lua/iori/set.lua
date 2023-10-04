local g = vim.g
local o = vim.o
local opt = vim.opt
opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4 opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.cindent = true
opt.wrap = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true

opt.termguicolors = true
opt.cursorline = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

