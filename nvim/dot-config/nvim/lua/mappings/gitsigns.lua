local M = {}

function M.on_attach(bufnr)
    local wk = require("which-key")
    local gitsigns = require("gitsigns")
    wk.add({
        mode = "n",
        buffer = bufnr,
        "<leader>g",
        group = "Git",
        {
            group = "Hunk",
            "<leader>gh",
            { "<leader>ghp", gitsigns.prev_hunk, desc = "[G]it [H]unk - [P]revious" },
            { "<leader>ghn", gitsigns.next_hunk, desc = "[G]it [H]unk - [N]ext" },
            { "<leader>ghv", gitsigns.preview_hunk, desc = "[G]it [H]unk - [V]iew" },
        }
    })
end

return M
