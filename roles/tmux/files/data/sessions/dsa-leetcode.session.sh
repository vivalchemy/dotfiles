session_root "~/Projects/dsa"

if initialize_session "dsa-leetcode"; then

  new_window "code"
  run_cmd "nvim ./leetcode/"

  split_h 30
  run_cmd "air"

  select_pane 1

fi

finalize_and_go_to_session
