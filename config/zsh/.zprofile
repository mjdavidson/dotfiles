# .zprofile is sourced on login shells and before .zshrc. As a general rule, it should not change the
# shell environment at all.

# Homebrew env (inlined from `brew shellenv` to avoid a ~1s path_helper subprocess on every login shell)
if [[ -d /opt/homebrew ]]; then
    export HOMEBREW_PREFIX=/opt/homebrew
    export HOMEBREW_CELLAR=/opt/homebrew/Cellar
    export HOMEBREW_REPOSITORY=/opt/homebrew
    fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
    # Unconditional: path_helper (/etc/zprofile) has already placed /opt/homebrew/bin *after* /usr/bin via
    # /etc/paths.d/homebrew, so a "prepend only if absent" guard would leave Apple's git/jq/bash winning.
    # `typeset -aU path` in .zshenv drops the later duplicate.
    path=(/opt/homebrew/bin /opt/homebrew/sbin $path)
    [[ ":${MANPATH-}:" == *":/opt/homebrew/share/man:"* ]] || export MANPATH="/opt/homebrew/share/man${MANPATH:+:$MANPATH}"
    export INFOPATH="/opt/homebrew/share/info${INFOPATH:+:$INFOPATH}"
fi

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
