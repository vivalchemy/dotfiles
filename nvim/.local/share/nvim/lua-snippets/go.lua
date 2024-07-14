local ls = require("luasnip")

local function get_formatted_filename()
	local filename = vim.fn.expand("%:t:r") -- Get the filename without extension

	-- Convert _word to Word and capitalize the first letter
	filename = vim.fn.substitute(filename, "^\\d*_", "", "")
	filename = vim.fn.substitute(filename, "_\\(\\w\\)", "\\U\\1", "g") -- Vimscript pattern to uppercase the character after _
	filename = vim.fn.substitute(filename, "^\\l", "\\U&", "") -- Vimscript pattern to uppercase the first letter

	return filename
end

local function get_current_directory()
	local fullpath = vim.fn.expand("%:p:h")
	local directory_name = vim.fn.fnamemodify(fullpath, ":t")
	return vim.fn.substitute(directory_name, "-", "", "g")
end

-- ls.text_node({"","some",""}) will result in
--
-- some
--

return {
	ls.snippet("dsa", {
		ls.text_node("package "),
		ls.text_node(get_current_directory()), -- Get the current directory name
		ls.text_node({ "", "", 'import "testing"', "", "" }),
		ls.text_node("func "),
		ls.text_node(get_formatted_filename()), -- Insert formatted filename
		ls.text_node("("),
		ls.insert_node(1, "nums []int"),
		ls.text_node(")"),
		ls.insert_node(2, "int"),
		ls.text_node({ " {", "  " }),
		ls.insert_node(0),
		ls.text_node({ "", "}", "", "" }),
		ls.text_node("func Test"),
		ls.text_node(get_formatted_filename()), -- Reuse formatted filename for test
		ls.text_node({ "(t *testing.T) {", "", "}", "" }),
	}),
	ls.snippet("lua snippet test", {
		ls.text_node("The test was successful"),
	}),
}
