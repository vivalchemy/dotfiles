# Prepends a directory to the PATH
prependToPath() {
    local expanded_path=$(realpath "$1")
    if [[ -d "$expanded_path" ]] && [[ ":$PATH:" != *":$expanded_path:"* ]]; then
        export PATH="$expanded_path:$PATH"
    fi
}
