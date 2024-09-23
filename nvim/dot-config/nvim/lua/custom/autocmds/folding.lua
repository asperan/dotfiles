local folding_group = vim.api.nvim_create_augroup("Folding", {})

vim.api.nvim_create_autocmd(
    {
        "BufWinEnter",
    },
    {
        group = folding_group,
        pattern = { "*" },
        command = "normal zR",
    }
)

