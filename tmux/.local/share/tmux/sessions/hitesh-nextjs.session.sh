session_root "~/Projects/hitesh-next/"
if initialize_session "hitesh-nextjs"; then
  new_window "server"
  run_cmd "bun run dev"
  new_window "nvim"
  run_cmd "nv"
  new_window "term"
  select_window 1
fi
finalize_and_go_to_session
