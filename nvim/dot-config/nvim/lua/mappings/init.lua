local wk = require("which-key")

-- Normal mode
wk.register({
    ["<c-s>"] = { "<cmd>w<cr>", "Save buffer" },
    ["<a-j>"] = { "<c-d>zz", "Jump half page down and center line on screen" },
    ["<a-k>"] = { "<c-u>zz", "Jump half page down and center line on screen" },
    ["<a-o>"] = { "o<esc>", "Create new line below and return in normal mode" },
    ["<a-O>"] = { "O<esc>", "Create new line above and return in normal mode" },
    ["<c-o>"] = { "<cmd>Explore<cr>", "Open NetRW in current file directory" },
    ["<c-s-o>"] = { function ()
        require("utility")
        local buffer_name = vim.api.nvim_buf_get_name(0)
        local expanded_dir = op_lazy_ternary(
            string.find(buffer_name, "^term:"), -- Check if buffer is a terminal
            function() return string.sub(string.match(buffer_name, '^term:%/(%g%g-)%d+:'), 2, -2) end, -- retrieve base dir from terminal name
            function() return vim.fn.getcwd() end -- Get current directory
        )
        vim.api.nvim_exec2(":Explore " .. expanded_dir, {})
    end, "Open NetRW in base directory"},
    ["[d"] = { vim.diagnostic.goto_prev, "Go to previous diagnostic message" },
    ["]d"] = { vim.diagnostic.goto_next, "Go to next diagnostic message" },
    ["<leader>e"] = { vim.diagnostic.open_float, "Open floating diagnostic message" },
    ["<leader>q"] = { vim.diagnostic.setloclist, "Open diagnostic list" },
}, {})

-- Normal mode expressions
wk.register({
    k = { "v:count == 0 ? 'gk' : 'k'", 'Word wrap upward' },
    j = { "v:count == 0 ? 'gj' : 'j'", 'Word wrap downward' },
}, { expr = true })

-- Keymaps to move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- Visual mode
-- wk.register({
--     J = { "<cmd>m '>+1<cr>gv=gv", "Move line down" },
--     K = { "<cmd>m '<-2<cr>gv=gv", "Move line up" },
-- }, { mode = 'v' })

-- Terminal mode
wk.register({
    ["<esc>"] = { "<c-\\><c-n>", "Exit insert mode in terminal" },
}, { mode = 't' })

-- Other
wk.register({
    ["<space>"] = { "<nop>", "<leader>" },
}, { mode = { 'n', 'v' } })

