# prepends to completion directory
prependToFpath() {
    if [ -d "$1" ]; then
        fpath=($1 $fpath)
    fi
}

