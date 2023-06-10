if status is-interactive
    # Commands to run in interactive sessions can go here
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/filip/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/filip/Downloads/google-cloud-sdk/path.fish.inc'; end

fish_vi_key_bindings
alias vim="nvim"
alias ls="exa -1a --icons"
alias lst="exa --long --tree --icons --no-user --no-time --no-permissions --level=3 -I node_modules/"
alias lg="lazygit"
funcsave -q vim

fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin
# neofetch
