# prepends to completion directory
prependToFpath() {
    local expanded_path=$(realpath "$1")
    if [[ -d "$expanded_path" ]] && [[ " $fpath " != *" $expanded_path "* ]]; then
        fpath=($expanded_path $fpath)
    fi
}

