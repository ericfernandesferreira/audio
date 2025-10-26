Versão Jack2 : 1.9.22
Versão Pipewire : 1.5.81
Versão FFMPEG : 7.1.2
NvidiaSDK : 13.0.19
IntelSDK : 23.2.2
IntelMediaDriver : 25.3.2

Requerimentos:
- intel ou nvidia
- slackware64 current

Esse pacote de áudio é "obrigatório" ser instalado antes de ser compilado os Ambientes Gráficos e também são dependências dos programas Audacious, VLC, Deadbeef, Mplayer, Qtractor entre vários outros.

O jack audio faz parte do pacote junto ao pipewire, você pode utilizá-lo de duas formas, uma utilizando como era antes que é habilitando o jackd ou jack d-bus como servidor no caso o qjackctl fazendo esse manuseio para você e a outra opção agora disponibilizado pelo pipewire que consiste em utilizar o comando pw-jack antes executar o programa necessário.

Como esse pacote vem com o ffmpeg e isso envolve encoders e decoders então eu resolvi dividir entre gpu's para não existir confusão. Infelizmente não tenho uma placa de vídeo da AMD, então se você possuí uma você terá que editar manualmente.

Pacotes que não são instalados automaticamente:
- intel-mediasdk (obsoleto)
- jack2 (jack2 desativado temporariamente)
- lc3plus (utilizando o lc3)
- opencl-clhpp (dependência do intel-mediasdk)
- qjackctl (jack2 desativado temporariamente)

Como instalar:
- você precisa clonar com o comando : git clone https://github.com/ericfernandesferreira/audio.git
E então dentro da pasta criada execute o script de instalação
sh build-audio-nvidia.sh (para placas da nvidia)
sh build-audio-intel.sh (para placas integradas intel)

*** IMPORTANTÍSSIMO
Caso for usar o Wine, é bom compilar os pacotes GSM e OpenAL em 32bits
Caso for compilar todo o pacote de áudio em 32bits, você vai precisar desses pacotes adicionais (todos inclusos no slackware, basta fazer o download da versão 32bits e converter para multilibs)
GConf, libsoup, taglib

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

Jack2 Version : 1.9.22
Pipewire Version : 1.5.81
FFMPEG Version: 7.1.2
NvidiaSDK : 13.0.19
IntelSDK : 23.2.2
IntelMediaDriver : 25.3.2

Requirements:
- intel or nvidia
- slackware64 current

This audio package is required to be installed before compiling environments desktops and also the are dependencies for programs like Audacious, VLC, Deadbeef, Mplayer, Qtractor among others.

Jack Audio is part of the package next to pipewire, you can use it in two ways, one using it as it was before it is enabling Jackd or Jack D-Bus as a server in case qjackctl making this handling for you and the other option now available by Pipewire that consists of using the "pw-jack executable" before running the required program. 

As this package comes with ffmpeg and it involves encoders and decoders so i decided to divide it between gpu's so there is no confusion. Unfortunately i don't have an AMD graphics card, so if you have one you will have to edit it manually.

How to install:
- you need to clone with command : git clone https://github.com/ericfernandesferreira/audio.git
And then inside the created folder run the installation script
sh build-audio-nvidia.sh (for nvidia users)
sh build-audio-intel.sh (for intel users)

*** IMPORTANT
if you will use Wine is good to compile packages like GSM and OpenAL in 32bits
if you will compile all audio package in 32bits you will need some another packages already include in Slackware, just need to be converted to multilibs:
GConf, libsoup, taglib

# To compile on 32bit using Slackware64 do the following:
su -
. /etc/profile.d/32dev.sh

# Then go to compat32 audio folder and compile the order with the command
ARCH=i586 ./packagename.SlackBuild

# After compiled you need to convert to compat32
convertpkg-compat32 -i /tmp/packagename-i586.tgz

# After converted just install
upgradepkg --install-new /tmp/packagename-compat32.tgz
