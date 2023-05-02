local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "awk_ls",
    "bashls",
    "clangd",
    "csharp_ls",
    "omnisharp_mono",
    "omnisharp",
    "cmake",
    "cssls",
    "cssmodules_ls",
    "dockerls",
    "dotls",
    "eslint",
    "grammarly",
    "graphql",
    "html",
    "jsonls",
    "quick_lint_js",
    "tsserver",
    "ltex",
    "marksman",
    "intelephense",
    "pylsp",
    "rust_analyzer",
    "sqls",
    "taplo",
    "tailwindcss",
    "volar",
    "wgsl_analyzer",
    "lemminx",
    "yamlls",
  },
})

mason_null_ls.setup({
  ensure_installed = {
    "blade",
    "clang_format",
    "habolint",
    "gitlint",
    "prettier",
    "ktlint",
    "luacheck",
    "vale",
    "psalm",
    "black",
    "shellcheck",
    "sql_formatter",
    "taplo",
    "vint",
    "cfn_lint",
    "codespell",
    "cspell",
    "editorconfig_checker",
    "missspell",
  },
})
