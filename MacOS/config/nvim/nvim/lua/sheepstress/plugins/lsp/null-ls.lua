local setup, null_ls = pcall(require, "null_ls")
if not setup then
    return
end

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostincs

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        formatting.blade,
        formatting.clang_format,
        formatting.habolint,
        formatting.gitlint,
        formatting.prettier,
        formatting.ktlint,
        formatting.luacheck,
        formatting.vale,
        formatting.psalm,
        formatting.black,
        formatting.shellcheck,
        formatting.sql_formatter,
        formatting.taplo,
        formatting.vint,
        formatting.cfn_lint,
        formatting.codespell,
        formatting.cspell,
        formatting.editorconfig_checker,
        formatting.missspell,
    },
    -- configure format on save
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<leader>f", function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, {
                buffer = bufnr,
                desc = "[lsp] format"
            })

            -- format on save
            vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
            vim.api.nvim_create_autocmd(event, {
                buffer = bufnr,
                group = group,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr, async = async })
                end,
                desc = "[lsp] format on save",
            })
        end

        if client.supports_method("textDocument/rangeFormatting") then
            vim.keymap.set("x", "<leader>f", function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })
        end
    end,
})
