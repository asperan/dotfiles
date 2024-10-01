local M = {}

function M.mappings(bufnr)
    local wk = require("which-key")
    wk.add({
        mode = "n",
        buffer = bufnr,
        {
            group = "workspace",
            "<leader>w",
            { "<leader>ws", require('telescope.builtin').lsp_dynamic_workspace_symbols, desc = "[W]orkspace [S]ymbols" },
            { "<leader>wa", vim.lsp.buf.add_workspace_folder, desc = "[W]orkspace [A]dd folder" },
            { "<leader>wr", vim.lsp.buf.remove_workspace_folder, desc = "[W]orkspace [R]emove Folder" },
            { "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, desc = "[W]orkspace [L]ist Folders" },
        },
        {
            group = "refactor",
            "<leader>r",
            { "<leader>rn", vim.lsp.buf.rename, desc = "[R]e[n]ame" },
            { "<leader>rf", vim.lsp.buf.format, desc = "[R]e[f]ormat" },
        },
        {
            group = "code",
            "<leader>c",
            { "<leader>ca", vim.lsp.buf.code_action, desc = "[C]ode [A]ction" },
            { "<leader>cl", vim.lsp.codelens.run, desc = "[C]ode [L]ens" },
        },
        {
            group = "document",
            "<leader>d",
            { "<leader>ds", require("telescope.builtin").lsp_document_symbols, desc = "[D]ocument [S]ymbols" },
        },
        { "<leader>D", vim.lsp.buf.type_definition, desc = "Type [D]efinition" },
        { "<leader>sh", vim.lsp.buf.signature_help, desc = "[S]ignature [H]elp" },
        {
            group = "alerts",
            "<leader>a",
            { "<leader>aa", vim.diagnostic.setqflist, desc = "[A]lerts: [A]ll" },
            { "<leader>ae", function() vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.E }) end, desc = "[A]lerts: [E]rrors" },
            { "<leader>aw", function () vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.W }) end, desc = "[A]lerts: [W]arnings" },
        },
        {
            group = "Goto",
            buffer = bufnr,
            "g",
            { "gd", vim.lsp.buf.definition, desc = "[G]oto [D]efinition" },
            { "gr", require("telescope.builtin").lsp_references, desc = "[G]oto [R]eferences" },
            { "gi", vim.lsp.buf.implementation, desc = "[G]oto [I]mplementation" },
            { "gD", vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration" },
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
