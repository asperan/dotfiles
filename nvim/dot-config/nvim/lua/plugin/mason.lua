-- [[ Configure LSP ]]
-- This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    require("plugin.lsp_common_mappings").mappings(bufnr)
end

-- Enable the following language servers
--    Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--    Add any additional override configuration in the following tables. They will be passed to
--    the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    rust_analyzer = {},
    ltex = {},
    typst_lsp = {
        settings = {
            exportPdf = "onSave",
        },
    },
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}

require("mason-tool-installer").setup({
    ensure_installed = {
        'shellcheck',
        'hadolint',
    },
    auto_update = true,
    run_on_start = true,
    start_delay = 3000, -- ms
    debounce_hours = 24,
})
