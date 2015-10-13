Versão do Pulseaudio : 7.0
Versão do FFMPEG : 2.8

Esse pacote de áudio é obrigatório ser instalado antes de ser compilado os Ambientes Gráficos.
E também são dependências do programa Audacious e de vários outros.

Requerimentos:
- slackware64 current
- multilibs + samba

Como instalar:
- você precisa baixar o .zip ou clonar o git e então executar o script
sh build-audio.sh

Como instalar os multilibs:
- dentro da pasta /compat32 contém os pacotes necessários para compilação em compat32 ou seja mutilibs, eles são necessários para o Wine e Skype, caso você não use nenhum desses dois programas, não é necessário a instalação deles.

# Para compilar em 32bits usando o Slackware64 faça o seguinte:
su -
. /etc/profile.d/32dev.sh

# Então acesse a pasta do audio compat32 e compile na ordem com o comando
ARCH=i486 ./nomedopacote.SlackBuild

# Após compilado você precisa converter para compat32
convertpkg-compat32 -i /tmp/nomedopacote-i486.tgz

# Após convertido basta instalar
upgradepkg --install-new /tmp/nomedopacote-compat32.tgz
