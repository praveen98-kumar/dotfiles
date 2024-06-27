if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting ""
    set -gx TERM xterm-256color
    set -gx LC_ALL en_IN.UTF-8
    set -gx LANG en_IN.UTF-8

    set -gx PATH /usr/local/bin $PATH
    set -gx PATH $HOME/.local/bin $PATH

    # Android Home
    set -g ANDROID_HOME $HOME/Android/Sdk
    set -gx PATH $ANDROID_HOME/emulator $PATH
    set -gx PATH $ANDROID_HOME/platform-tools $PATH

    # FNM Home
    set -g FNMPATH $HOME/.local/share/fnm
    set -gx PATH $FNMPATH $PATH
    fnm env --use-on-cd | source

    set -gx EDITOR helix 

    alias ls "exa --icons --group-directories-first"
    alias la "ls -a"
    alias ll "ls -l --header"
    alias hx "helix"
    alias lg "lazygit"
    alias c "clear"

    starship init fish | source

    zoxide init fish | source

end

function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/pkk/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
