local st = vim.api.nvim_exec("!git diff --cached", true)
if st == "\n" then
	print("fap")
else
	print("shit")
	print(st)
end
