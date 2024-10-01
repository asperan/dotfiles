local M = {}

function M.config()
    local wk = require("which-key")
    local builtin = require('telescope.builtin')
    wk.add({
        mode = "n",
        {
            group = "file",
            "<leader>f",
            { "<leader>ff", builtin.find_files, desc = "[F]ind [F]iles" },
            { "<leader>fg", builtin.live_grep, desc = "[F]ile [G]rep" },
            { "<leader>fb", builtin.buffers, desc = "[B]uffers" },
            { "<leader>fh", builtin.help_tags, desc = "[H]elp Tags" },
        },
        {
            "<leader>/", function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
            end, desc = "[/] Fuzzily search in current buffer"
        },
    })
end

return M
