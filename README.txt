Pulseaudio incluso no Slackware
Versão Jack2 : 1.9.10
Versão do FFMPEG : 2.8.6

Esse pacote de áudio é obrigatório ser instalado antes de ser compilado os Ambientes Gráficos e também são dependências do programa Audacious, VLC, Deadbeef, Mplayer, Qtractor entre outros.

Requerimentos:
- slackware64 current
- multilibs

Como instalar:
- você precisa baixar o .zip ou clonar o git e então executar o script
sh build-audio.sh (para compilar com pulseaudio)
sh build-audio-jack.sh (para compilar em jack audio)

Observação:
- o build não compila pulseaudio e jack juntos, ou é um ou é outro.

*** SOMENTE PARA PULSEAUDIO
Como instalar os multilibs:
- dentro da pasta /compat32 contém os pacotes necessários para compilação em compat32 ou seja mutilibs, eles são necessários para o Wine e Skype, caso você não use nenhum desses dois programas, não é necessário a instalação deles.

*** IMPORTANTÍSSIMO
você precisa adicionar o samba em multilibs, ele não vem no pacote oficial porém é necessário para o pulseaudio ser compilado em 32bits então basta baixar a versão i486 no slackware-current e converter para compat32

# Para compilar em 32bits usando o Slackware64 faça o seguinte:
su -
. /etc/profile.d/32dev.sh

# Então acesse a pasta do audio compat32 e compile na ordem com o comando
ARCH=i486 ./nomedopacote.SlackBuild

# Após compilado você precisa converter para compat32
convertpkg-compat32 -i /tmp/nomedopacote-i486.tgz

# Após convertido basta instalar
upgradepkg --install-new /tmp/nomedopacote-compat32.tgz

---------------------------------------------------------------

Pulseaudio already include
Jack Version : 1.9.10
FFMPEG Version: 2.8.6

This audio package is required to be installed before compiling environments desktops and also the are dependencies for programs like Audacious, VLC, Deadbeef, Mplayer, Qtractor among others.

Requirements:
- slackware64 current
- multilibs

How to install:
- you need to download the .zip or clone git and then run the script
sh build-audio.sh (for compile pulseaudio)
sh build-audio-jack.sh (for compile jack audio)

Note:
- the builder does not build pulseaudio and jack together, or is or is another.

*** ONLY FOR PULSEAUDIO
Installing the multilibs:
- Inside the folder compat32/ contains the packages needed for compilation in 32bits, they are necessary for the Wine and Skype if you do not use either of those programs, their installation is not necessary.

*** IMPORTANT
you need to add the samba in multilibs, it does not come in the official package but is necessary for pulseaudio be compiled in 32bits then just download the i486 version on slackware-current and convert to compat32

# To compile on 32bit using Slackware64 do the following:
su -
. /etc/profile.d/32dev.sh

# Then go to compat32 audio folder and compile the order with the command
ARCH=i486 ./packagename.SlackBuild

# After compiled you need to convert to compat32
convertpkg-compat32 -i /tmp/packagename-i486.tgz

# After converted just install
upgradepkg --install-new /tmp/packagename-compat32.tgz
