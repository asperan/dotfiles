local M = {}

function M.config()
    local wk = require("which-key")
    wk.add({
        mode = "n",
        { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
    })

end

return M
