function arrow() {
    sed -u 's/^/-----> /'
}

function indent() {
    sed -u 's/^/       /'
}

function export_env_vars() {
    whitelist_regex=${2:-''}
    blacklist_regex=${3:-'^(PATH|GIT_DIR|CPATH|CPPATH|LD_PRELOAD|LIBRARY_PATH)$'}
    if [ -d "$env_path" ]; then
        echo "Will export the following config vars:" | arrow
        for e in $(ls $env_path); do
            echo "$e" | grep -E "$whitelist_regex" | grep -vE "$blacklist_regex" &&
                export "$e=$(cat $env_path/$e)"
            :
        done
    fi
}
