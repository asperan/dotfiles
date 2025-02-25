local wk = require("which-key")

wk.add(
    {
        mode = "n",
        {
            group = "open",
            "<leader>o",
            { "<leader>oc", "<cmd>Oil<cr>", desc = "Open file manager in current file directory" },
        },
        { "[d", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic message" },
        { "]d", vim.diagnostic.goto_next, desc = "Go to next diagnostic message" },
        { "<leader>e", vim.diagnostic.open_float, desc = "Open floating diagnostic message" },
        { "<leader>q", vim.diagnostic.setloclist, desc = "Open diagnostic list" },
        { "[<space>", function ()
            vim.fn.append(vim.fn.line(".") - 1, vim.fn.call("repeat", {{""}, vim.v.count1}))
            end, desc = "Create new lines above", silent = true },
        { "]<space>", function () vim.fn.append(vim.fn.line("."), vim.fn.call('repeat', {{""}, vim.v.count1})) end, desc = "Create new lines below", silent = true },
        {
            group = "buffer",
            "<leader>b",
            { "<leader>bd", '<cmd>lua vim.api.nvim_buf_delete(0, {force = (string.find(vim.api.nvim_buf_get_name(0), "^term:") ~= nil)})<cr>', desc = "Delete current buffer" },
            { "<leader>bt", '<cmd>terminal<cr>', desc = "Open a new terminal buffer" },
        },
    },
    {
        mode = "t",
        { "<esc>", "<c-\\><c-n>", desc = "Exit insert mode in terminal" }
    },
    {
        mode = { "n", "v" },
        { "<space>", "<nop>", desc = "<leader>" }
    },
    {
        expr = true,
        mode = "v",
        { "k", "v:count == 0 ? 'gk' : 'k'", desc = "Word wrap upward" },
        { "j", "v:count == 0 ? 'gj' : 'j'", desc = "Word wrap downward" },
    }
)

-- Keymaps to move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")
