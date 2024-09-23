local format_group = vim.api.nvim_create_augroup("Format", {})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = format_group,
    pattern = { "*" },
    command = "%s/\\s\\+$//e",
})

