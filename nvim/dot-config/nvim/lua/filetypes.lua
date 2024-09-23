local ls = require("luasnip")

-- Make bash extend sh to inherit all the snippets
ls.filetype_extend("bash", { "sh" })

vim.filetype.add({ extension = { typ = "typst" } })
