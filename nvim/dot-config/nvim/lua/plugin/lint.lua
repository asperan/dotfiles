require("lint").linters_by_ft = {
    sh = { "shellcheck", },
    bash = { "shellcheck", },
    dockerfile = { "hadolint", },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function ()
        require("lint").try_lint()
    end
})
