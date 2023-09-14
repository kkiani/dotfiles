local result = os.execute("git diff --cached --quiet")
if result == 0 then
	print("No changes to commit")
	return true
else
	print("Changes to commit")
	return false
end
