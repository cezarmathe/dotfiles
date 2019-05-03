

function goto() {
    local base_bookmarks_path="${HOME}/Bookmarks"

    local bookmark_full_unicode='\uf02e'
    local bookmark_empty_unicode='\uf097'
    local folder_unicode='\uf07b'
    
    local goto_path="$1"; shift

    # local bm_name="$(grep \w/.)"

    if [[ -z "${goto_path}" ]]; then
        echo "${bookmark_full_unicode} Bookmarks"
        echo "${folder_unicode} Shell"
        ls -G "${HOME}/Bookmarks/shell"
        echo "${folder_unicode} VsCode workspaces"
        ls -G "${HOME}/Bookmarks/vscode"
        return
    fi

    local cd_dir=""

    if [[ -f "${base_bookmarks_path}/shell/${goto_path}" ]]; then
        cd_dir="$(cat ${base_bookmarks_path}/shell/${goto_path})"
    elif [[ -f "${base_bookmarks_path}/vscode/${goto_path}.code-workspace" ]]; then
        cd_dir=$(jq -r '.folders[0].path' "${HOME}/Bookmarks/vscode/${goto_path}.code-workspace")
    fi

    if [[ ! -z "${cd_dir}" ]]; then
        cd ${cd_dir}
	return
    fi
    echo "Bookmark ${goto_path} not found."
}
