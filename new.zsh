samples=~/utils/new/samples/
if [[ ! -e "$samples" ]]; then
    echo "Create $samples directory"
fi

hook='neovide .'
function new() {
    if [[ ! -e "${samples}${1}" ]]; then
        echo "No such sample for '${1}' language"
        return
    fi
    cp -r "${samples}${1}" .

    mv $1 $2
    cd $2
    eval $hook
}

alias new=new
