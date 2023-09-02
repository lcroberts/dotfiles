#/usr/bin/bash

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip &
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Iosevka.zip &

mkdir -p ~/.local/share/fonts/JetBrainsMono
mkdir -p ~/.local/share/fonts/Iosevka

wait
echo "Downloads done"

unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono &
unzip Iosevka.zip -d ~/.local/share/fonts/Iosevka &

wait

rm JetBrainsMono.zip
rm Iosevka.zip

fc-cache -fv
