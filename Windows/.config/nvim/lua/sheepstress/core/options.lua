local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indents
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrap
opt.wrap = false
opt.whichwrap = "<,>,[,],h,l"

-- search
opt.ignorecase = true
opt.smartcase = true

-- cursor
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.list = true
opt.listchars = {
  trail = '·',
}
vim.api.nvim_create_autocmd('BufWritePre', {command = '%s/\\s\\+$//e'})

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
