# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Public/tube-talk"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "tubetalk"; then

  # Create a new window inline within session layout definition.
  new_window "server"
  run_cmd "bun run dev"
  split_h 50
  run_cmd "bun run db"

  # Load a defined window layout.
  new_window "nvim"
  run_cmd "n"

  new_window "term"

  # Select the default active window on session creation.lect the default active window on session creation.
  select_window 0

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
