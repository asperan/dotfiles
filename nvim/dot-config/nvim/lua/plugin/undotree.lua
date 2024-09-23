local M = {}

function M.config()
    local wk = require("which-key")
    wk.register({
        u = { vim.cmd.UndotreeToggle, "Toggle Undotree" },
    }, { prefix = '<leader>' })

    vim.g.undotree_WindowLayout = 2
end

return M
