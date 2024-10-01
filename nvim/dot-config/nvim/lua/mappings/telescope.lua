local wk = require("which-key")
local builtin = require('telescope.builtin')
wk.register({
    f = {
        name = "file",
        f = { builtin.find_files, "[F]ind [F]iles" },
        g = { builtin.live_grep, "[F]ile [G]rep" },
        b = { builtin.buffers, "[B]uffers" },
        h = { builtin.help_tags, "[H]elp Tags" },
    },
    ["/"] = { function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
        })
    end, "[/] Fuzzily search in current buffer" }
}, { prefix = "<leader>" })

pcall(require('telescope').load_extension, 'fzf')
