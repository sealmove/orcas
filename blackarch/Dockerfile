FROM blackarchlinux/blackarch

WORKDIR /root

# Update index
RUN pacman -Syu --noconfirm

# Fetch wordlists
RUN pacman -S --noconfirm --needed seclists

# Dev
RUN pacman -S --noconfirm --needed \
    git \
    maven \
    python-pip

# Install rogue-jndi jar
RUN mkdir -p /usr/share/artifacts/jars && \
    pacman -S --noconfirm --needed git maven && \
    git clone https://github.com/veracode-research/rogue-jndi.git && \
    mvn -f rogue-jndi/pom.xml package && \
    mv rogue-jndi/target/RogueJndi*.jar /usr/share/artifacts/jars/RogueJndi.jar && \
    rm -rf rogue-jndi

# Make some custom paths
RUN mkdir -p /usr/share/artifacts/jars && \
    mkdir -p /usr/share/artifacts/linux && \
    mkdir -p /usr/share/artifacts/windows && \
    mkdir -p /usr/share/artifacts/scripts

# GUI libraries
RUN pacman -S --noconfirm --needed \
    xorg-xauth \
    libxtst \
    libxft \
    ttf-dejavu

# Essential
RUN pacman -S --noconfirm --needed \
    which \
    tree \
    p7zip \
    dnsutils \
    binutils \
    netcat \
    net-snmp \
    wget \
    vim \
    fakeroot

# Malicious
RUN pacman -S --noconfirm --needed \
    gobuster \
    wfuzz \
    nikto \
    evil-winrm \
    dnsmasq \
    wpscan \
    metasploit \
    r2ghidra

# Android
RUN pacman -S --noconfirm --needed \
    android-apktool \
    jadx

# Python
RUN pip install pwntools

# Volatility
pip install https://github.com/volatilityfoundation/volatility3/releases/download/v2.0.1/volatility3-2.0.1-py3-none-any.whl

# LinPEAS
RUN wget -P /usr/share/artifacts/scripts https://github.com/carlospolop/PEASS-ng/releases/download/20220424/linpeas.sh && \
    wget -P /usr/share/artifacts/linux https://github.com/carlospolop/PEASS-ng/releases/download/20220424/linpeas_linux_amd64

RUN wget -P /usr/share/artifacts/linux https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64