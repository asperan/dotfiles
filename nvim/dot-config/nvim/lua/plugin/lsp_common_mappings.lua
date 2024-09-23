local M = {}

function M.mappings(bufnr)
    local wk = require("which-key")
    wk.register({
        w = {
            name = "workspace",
            s = { require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols' },
            a =  { vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder' },
            r = { vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder' },
            l = { function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, '[W]orkspace [L]ist Folders' },
        },
        r = {
            name = "refactor",
            n = { vim.lsp.buf.rename, '[R]e[n]ame' },
            f = { vim.lsp.buf.format, '[F]ormat' },
        },
        c = {
            name = "code",
            a = { vim.lsp.buf.code_action, '[C]ode [A]ction' },
            l = { vim.lsp.codelens.run, '[C]ode [L]ens' },
        },
        d = {
            name = "[D]ocument",
            s = { require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols' }
        },
        D = { vim.lsp.buf.type_definition, 'Type [D]efinition' },
        ["sh"] = { vim.lsp.buf.signature_help, '[S]ignature [H]elp' },
        a = {
            name = "alerts",
            a = { vim.diagnostic.setqflist, '[A]lerts: [A]ll'},
            e = { function() vim.diagnostic.setqflist({ severity = "E" }) end, '[A]lerts: [E]rrors' },
            w = { function() vim.diagnostic.setqflist({ severity = "W" }) end, '[A]lerts: [W]arnings' },
        }
    }, { prefix = "<leader>", buffer = bufnr })

    wk.register({
        d = { vim.lsp.buf.definition, '[G]oto [D]efinition' },
        r = { require('telescope.builtin').lsp_references, '[G]oto [R]eferences' },
        i = { vim.lsp.buf.implementation, '[G]oto [I]mplementation' },
        D = { vim.lsp.buf.declaration, '[G]oto [D]eclaration' },
    }, { prefix = "g", buffer = bufnr })

    -- See `:help K` for why this keymap
    wk.register({
        ["K"] = { vim.lsp.buf.hover, 'Hover Documentation' },
        ["<C-k>"] = { vim.lsp.buf.signature_help, 'Signature Documentation' },
    }, { buffer = bufnr })
    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

return M
