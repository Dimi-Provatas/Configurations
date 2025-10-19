set fish_greeting

if status is-interactive
    fish_add_path /opt/homebrew/bin/
    fish_vi_key_bindings
    source " fish_vi_key_bindings$HOME/.cargo/env.fish"

    export EDITOR="nvim"
    export GIT_EDITOR="nvim"
    # export PAGER="nvim"
    export MANPAGER="nvim +Man!"
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH:$HOME/.cargo/bin/:$HOME/.local/bin/:$HOME/scripts"
    export TERMINAL="kitty"
    export LC_ALL="en_US.UTF-8"
    export LANG="en_US.UTF-8"
    export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

    alias quit="exit"
    alias :q="exit"

    alias cp="cp -i" # confirm before overwriting something
    alias df='df -h' # human-readable sizes
    alias free='free -m' # show sizes in MB
    alias cat="bat -p"
    alias ls="exa --icons --group-directories-first"
    alias ll="ls -alh"
    alias cl="clear; ll"
    alias ct="clear; tree"
    alias cn="clear; neofetch"

    alias fck="fuck"
    alias neofetch="fastfetch"
    alias update="brew update && brew upgrade && brew autoremove && brew cleanup"

    alias wtr="clear && curl wttr.in"
    alias getip="curl https://ipv4.icanhazip.com"
    alias traceip="getip | xargs traceroute"

    eval $(thefuck --alias)

    clear
    neofetch
end
