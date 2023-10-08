local lint = require("lint")

lint.linters_by_ft = {
	python = { "mypy" },
	lua = { "luacheck" },
	yaml = { "yamllint" },
}
