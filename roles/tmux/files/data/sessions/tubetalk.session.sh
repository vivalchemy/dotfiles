session_root "~/Public/tube-talk"
if initialize_session "tubetalk"; then
  new_window "server"
  run_cmd "cd web"
  run_cmd "bun run dev" # nextjs
  split_h 50
  run_cmd "cd web"
  run_cmd "bun run db" # pocketbase
  new_window "nvim"
  run_cmd "n"
  select_window 1
fi
finalize_and_go_to_session
