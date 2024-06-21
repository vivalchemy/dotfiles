session_root "~/Projects/next-test"

if initialize_session "next-test"; then
  new_window "server"
  run_cmd "bun run dev"

  new_window "nvim"
  run_cmd "nvim ."

  new_window "terminal"

  select_window 1
fi

finalize_and_go_to_session
