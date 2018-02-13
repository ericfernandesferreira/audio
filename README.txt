Pulseaudio incluso no Slackware
Versão Jack2 : 1.9.12
Versão do FFMPEG : 3.4.1

Esse pacote de áudio é obrigatório ser instalado antes de ser compilado os Ambientes Gráficos e também são dependências do programa Audacious, VLC, Deadbeef, Mplayer, Qtractor entre outros.

Requerimentos:
- slackware64 14.2
- multilibs

Como instalar:
- você precisa baixar o .zip ou clonar o git e então executar o script
sh build-audio.sh (para compilar com pulseaudio)
sh build-audio-nvidia.sh (para compilar com pulseaudio + nvenc)
sh build-audio-jack.sh (para compilar em jack audio)
sh build-audio-jack-nvidia.sh (para compilar em jack audio + nvenc)

*** IMPORTANTÍSSIMO
Caso for usar o Wine, é bom compilar os pacotes GSM e OpenAL em 32bits

# Para compilar em 32bits usando o Slackware64 faça o seguinte:
su -
. /etc/profile.d/32dev.sh

# Então acesse a pasta do audio compat32 e compile na ordem com o comando
ARCH=i586 ./nomedopacote.SlackBuild

# Após compilado você precisa converter para compat32
convertpkg-compat32 -i /tmp/nomedopacote-i586.tgz

# Após convertido basta instalar
upgradepkg --install-new /tmp/nomedopacote-compat32.tgz

---------------------------------------------------------------

Pulseaudio already include
Jack Version : 1.9.12
FFMPEG Version: 3.4.1

This audio package is required to be installed before compiling environments desktops and also the are dependencies for programs like Audacious, VLC, Deadbeef, Mplayer, Qtractor among others.

Requirements:
- slackware64 14.2
- multilibs

How to install:
- you need to download the .zip or clone git and then run the script
sh build-audio.sh (for compile pulseaudio)
sh build-audio-nvidia.sh (for compile pulseaudio + nvenc)
sh build-audio-jack.sh (for compile jack audio)
sh build-audio-jack-nvidia.sh (for compile jack audio + nvenc)

*** IMPORTANT
if you will use Wine is good to compile packages like GSM and OpenAL in 32bits

# To compile on 32bit using Slackware64 do the following:
su -
. /etc/profile.d/32dev.sh

# Then go to compat32 audio folder and compile the order with the command
ARCH=i586 ./packagename.SlackBuild

# After compiled you need to convert to compat32
convertpkg-compat32 -i /tmp/packagename-i586.tgz

# After converted just install
upgradepkg --install-new /tmp/packagename-compat32.tgz
