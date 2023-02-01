local status, _ = pcall(vim.cmd, "colorscheme jellybeans")
if not status then
    print("Colorscheme not found!")
    return
end

vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
vim.cmd [[highlight NonText guibg=NONE ctermbg=NONE]]
