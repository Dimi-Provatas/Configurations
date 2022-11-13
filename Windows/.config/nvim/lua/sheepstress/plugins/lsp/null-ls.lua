local setup, null_ls = pcall(require, "null_ls")
if not setup then
  return
end

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostincs

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
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
