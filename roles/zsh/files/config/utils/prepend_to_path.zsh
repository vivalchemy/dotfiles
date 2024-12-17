# Prepends a directory to the PATH
prependToPath() {
    if [ -d "$1" ]; then
        export PATH="$1:$PATH"
    fi
}
