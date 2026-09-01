-- echo executable("lua-language-server")
-- >> should return 1 to confirm that nvim can connect with the server



return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		-- npm i -g pyright
		vim.lsp.config('pyright', {
			capabilities = capabilities,
			settings = {
				python = {
					analysis = {
						diagnosticSeverityOverrides = {
							reportGeneralTypeIssues    = "none",
							reportOptionalSubscript    = "none",
							reportOptionalMemberAccess = "none"
						}
					}
				}
			}
		})

		vim.lsp.config('lua_ls', {
			capabilities = capabilities
		})

		vim.lsp.config('intelephense', {
			capabilities = capabilities
		})

		-- npm i -g typescript-language-server
		vim.lsp.config('ts_ls', {
			capabilities = capabilities
		})

		-- npm i -g vscode-langservers-extracted
		vim.lsp.config('cssls', {
			capabilities = capabilities
		})

		vim.lsp.config('html', {
			capabilities = capabilities
		})

		-- npm i -g bash-language-server
		vim.lsp.config('bashls', {
			capabilities = capabilities
		})

		vim.lsp.config('gopls', {
			capabilities = capabilities
		})

		vim.lsp.config('clangd', {
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--fallback-style=webkit"
			}
		})

		vim.lsp.enable({
			'lua_ls',
			'pyright',
			'ts_ls',
			'cssls',
			'html',
			'clangd',
			'gopls',
			'intelephense',
			'bashls',
		})
	end
}
