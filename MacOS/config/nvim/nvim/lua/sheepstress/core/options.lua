local opt = vim.opt

-- general
opt.iskeyword:append("-")
opt.lazyredraw = true
opt.wildignore:append({
    "node_modules",
    "vendor",
    "target",
    "dist",
})

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indents
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrap
-- opt.wrap = false
opt.whichwrap = "<,>,[,],h,l"
opt.breakindent = true
opt.breakindentopt = { shift = 2 }

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- format
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
opt.scrolloff = 8

-- cursor
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "number"
opt.list = true
opt.listchars = {
    trail = '·',
}
vim.api.nvim_create_autocmd('BufWritePre', { command = '%s/\\s\\+$//e' })
opt.foldmethod = "indent"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true
