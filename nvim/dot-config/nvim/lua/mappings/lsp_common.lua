local M = {}

function M.mappings(bufnr)
    local wk = require("which-key")
    wk.add({
        mode = "n",
        buffer = bufnr,
        {
            desc = "workspace",
            "<leader>w",
            { "s", require('telescope.builtin').lsp_dynamic_workspace_symbols, desc = "[W]orkspace [S]ymbols" },
            { "a", vim.lsp.buf.add_workspace_folder, desc = "[W]orkspace [A]dd folder" },
            { "r", vim.lsp.buf.remove_workspace_folder, desc = "[W]orkspace [R]emove Folder" },
            { "l", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, desc = "[W]orkspace [L]ist Folders" },
        },
        {
            desc = "refactor",
            "<leader>r",
            { "n", vim.lsp.buf.rename, desc = "[R]e[n]ame" },
            { "f", vim.lsp.buf.format, desc = "[R]e[f]ormat" },
        },
        {
            desc = "code",
            "<leader>c",
            { "a", vim.lsp.buf.code_action, desc = "[C]ode [A]ction" },
            { "l", vim.lsp.codelens.run, desc = "[C]ode [L]ens" },
        },
        {
            desc = "[D]ocument",
            "<leader>d",
            { "s", require("telescope.builtin").lsp_document_symbols, desc = "[D]ocument [S]ymbols" },
        },
        { "<leader>D", vim.lsp.buf.type_definition, desc = "Type [D]efinition" },
        { "<leader>sh", vim.lsp.buf.signature_help, desc = "[S]ignature [H]elp" },
        {
            desc = "alerts",
            "<leader>a",
            { "a", vim.diagnostic.setqflist, desc = "[A]lerts: [A]ll" },
            { "e", function() vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.E }) end, desc = "[A]lerts: [E]rrors" },
            { "w", function () vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.W }) end, desc = "[A]lerts: [W]arnings" },
        },
        {
            desc = "Goto",
            buffer = bufnr,
            "g",
            { "d", vim.lsp.buf.definition, desc = "[G]oto [D]efinition" },
            { "r", require("telescope.builtin").lsp_references, desc = "[G]oto [R]eferences" },
            { "i", vim.lsp.buf.implementation, desc = "[G]oto [I]mplementation" },
            { "D", vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration" },
        },
        -- See `:help K` for why this keymap
        { "K", vim.lsp.buf.hover, desc = "Hover Documentation", buffer = bufnr },
        { "<c-k>", vim.lsp.buf.signature_help, desc = "Signature Documentation", buffer = bufnr },
    })

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

return M
