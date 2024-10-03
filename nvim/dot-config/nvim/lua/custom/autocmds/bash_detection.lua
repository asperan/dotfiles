local bash_detection_group = vim.api.nvim_create_augroup("BashDetection", {})

vim.api.nvim_create_autocmd("BufEnter", {
    group = bash_detection_group,
    pattern = "*",
    callback = function ()
        if (vim.fn.getline(1) == "#!/bin/bash") then
            vim.api.nvim_exec2(":setfiletype bash", {})
        end
    end,
})
