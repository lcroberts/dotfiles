alias hibernate="systemctl hibernate"
alias firefox="flatpak run org.mozilla.firefox"
alias protontricks="flatpak run com.github.Matoking.protontricks"
alias protontricks-launch="flatpak run --command=protontricks-launch com.github.Matoking.protontricks"
function frun() {
    flatpak run (flatpak list --app | cut -f2 | fzf)
}

