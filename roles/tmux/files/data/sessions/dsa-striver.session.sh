# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Projects/dsa"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "dsa-striver"; then

  # Create a new window inline within session layout definition.
  new_window "code"
  run_cmd "nvim ./striver-a2z-dsa/"

  split_h 30
  run_cmd "air"

  # Select the default active window on session creation.
  select_pane 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
