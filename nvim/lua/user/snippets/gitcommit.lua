local ls = require("luasnip")
local snippet = ls.snippet
local text = ls.text_node
local insert = ls.insert_node

ls.config.setup({
	enable_autosnippets = true,
})

ls.add_snippets("gitcommit", {
	snippet({ trig = "feat", dscr = "a new feature added", snippetType = "autosnippet" }, {
		text("feat("),
		insert(1),
		text("): "),
		insert(2),
	}),
})

ls.add_snippets("gitcommit", {
	snippet({ trig = "fix", dscr = "fixing a bug", snippetType = "autosnippet" }, {
		text("fix("),
		insert(1),
		text("): "),
		insert(2),
	}),
})

ls.add_snippets("gitcommit", {
	snippet({ trig = "chore", dscr = "a chore change", snippetType = "autosnippet" }, {
		text("chore("),
		insert(1),
		text("): "),
		insert(2),
	}),
})
