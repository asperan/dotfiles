local wk = require("which-key")

wk.register({
    b = {
        name = "buffer",
        -- Delete the current buffer. Forces the close when the buffer is a terminal.
        d = { '<cmd>lua vim.api.nvim_buf_delete(0, {force = (string.find(vim.api.nvim_buf_get_name(0), "^term:") ~= nil)})<cr>', "Delete current buffer", },
        t = { "<cmd>terminal<cr>", "Open a new terminal buffer" },
    },
}, { prefix = "<leader>" })

