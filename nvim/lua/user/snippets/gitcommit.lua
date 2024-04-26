local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

local s = ls.snippet
local i = ls.insert_node

ls.add_snippets("gitcommit", {
	s(
		{ trig = "feat", dscr = "New feature commit with scope", snippetType = "autosnippet" },
		fmt("feat({}): {}", {
			i(1, "scope"),
			i(2, "description"),
		})
	),
})

ls.add_snippets("gitcommit", {
	s(
		{ trig = "feat", dscr = "New feature commit without scope", snippetType = "autosnippet" },
		fmt("feat: {}", {
			i(1, "description"),
		})
	),
})

ls.add_snippets("gitcommit", {
	s(
		{ trig = "fix", dscr = "New fix commit with scope", snippetType = "autosnippet" },
		fmt("fix({}): {}", {
			i(1, "scope"),
			i(2, "description"),
		})
	),
})

ls.add_snippets("gitcommit", {
	s(
		{ trig = "fix", dscr = "New fix commit without scope", snippetType = "autosnippet" },
		fmt("fix: {}", {
			i(1, "description"),
		})
	),
})

ls.add_snippets("gitcommit", {
	s(
		{ trig = "chore", dscr = "New chore commit with scope", snippetType = "autosnippet" },
		fmt("chore({}): {}", {
			i(1, "scope"),
			i(2, "description"),
		})
	),
})

ls.add_snippets("gitcommit", {
	s(
		{ trig = "chore", dscr = "New chore commit without scope", snippetType = "autosnippet" },
		fmt("chore: {}", {
			i(1, "description"),
		})
	),
})
