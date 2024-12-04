local state = ya.sync(function(st)
	return {
		cwd = tostring(cx.active.current.cwd),
	}
end)

local function fail(s, ...)
	ya.notify({ title = "Directory Finder", content = s:format(...), timeout = 5, level = "error" })
end

local function entry()
	local st = state()

	-- First, try to get the git root directory
	-- local git_child, err =
	-- 	Command("git"):args({ "rev-parse", "--show-toplevel" }):stdout(Command.PIPED):stderr(Command.NULL):spawn()

	local root_dir = st.cwd -- Default to current working directory

	-- if git_child then
	-- 	local git_root, err = git_child:wait_with_output()
	--
	-- 	if git_root and git_root.status.success then
	-- 		-- Trim newline and use as root for fd
	-- 		root_dir = git_root.stdout:gsub("\n$", "")
	-- 	end
	-- end

	local fd_child, err =
		Command("fd"):args({ ".", "--type=directory" }):arg(root_dir):stdout(Command.PIPED):stderr(Command.NULL):spawn()

	if not fd_child then
		return fail("Failed to start `fd`, error: " .. err)
	end

	local _permit = ya.hide()
	local fzf_child, err =
		Command("fzf"):stdin(fd_child:take_stdout()):stdout(Command.PIPED):stderr(Command.NULL):spawn()

	if not fzf_child then
		return fail("Failed to start `fzf`, error: " .. err)
	end

	local output, err = fzf_child:wait_with_output()
	_permit:drop()

	if not output then
		return fail("Cannot read output, error: " .. err)
	elseif not output.status.success and output.status.code ~= 130 then
		return fail("Command exited with error code %s", output.status.code)
	end

	local target = output.stdout:gsub("\n$", "")
	if target ~= "" then
		ya.manager_emit("cd", { target })
	end
end

return { entry = entry }
