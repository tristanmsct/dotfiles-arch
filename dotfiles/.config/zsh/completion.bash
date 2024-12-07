#/usr/bin/env bash
# Just a collection of auto completion commands for my bash custom scripts.

complete -W "mono multi main-off" chdis
complete -W "up down status" rpivpn
complete -W "-clean -month -archive -location" notes
complete -W "aqua bonsai cava matrix" anim

_proton_completions() {
    local current previous commands countries

    # Current word being completed and previous word.
    current="${COMP_WORDS[COMP_CWORD]}"
    previous="${COMP_WORDS[COMP_CWORD-1]}"

    # Commands for the first argument.
    commands="up down status"

    # Country codes for `proton up`.
    countries="fr uk"

    # If completing the first argument (e.g., `proton <...>`).
    if [[ $COMP_CWORD -eq 1 ]]; then
        COMPREPLY=($(compgen -W "$commands" -- "$current"))
        return
    fi

    # If completing after `proton up`.
    if [[ $previous == "up" ]]; then
        COMPREPLY=($(compgen -W "$countries" -- "$current"))
        return
    fi

    # Default empty completion.
    COMPREPLY=()
}

# Attach the function to the `proton` command.
complete -F _proton_completions proton
