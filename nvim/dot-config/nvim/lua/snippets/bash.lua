local ls = require("luasnip")
local snippet = ls.snippet

ls.add_snippets("bash", {
    snippet({
        trig = "set",
    },
    {
        ls.text_node("set -euo pipefail")
    }),
})
