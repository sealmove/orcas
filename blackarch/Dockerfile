FROM blackarchlinux/blackarch

WORKDIR /root

# Update index
RUN pacman -Syu --noconfirm

# Make some custom paths
RUN mkdir -p /usr/share/jars

# Install wordlists
RUN pacman -S --noconfirm wordlistctl && \
    wordlistctl fetch wordlists

# Install essential tools
RUN pacman -S --noconfirm \
    which \
    p7zip

# Install dev tools
RUN pacman -S --noconfirm \
    git \
    maven \

# Install packages
RUN pacman -S --noconfirm \
    gobuster \
    evil-winrm \
    jadx

# Install rogue-jndi jar
RUN mkdir -p /usr/share/jars && \
    pacman -S --noconfirm --needed git maven && \
    git clone https://github.com/veracode-research/rogue-jndi.git && \
    mvn -f rogue-jndi/pom.xml package && \
    mv rogue-jndi/target/RogueJndi*.jar /usr/share/jars/RogueJndi.jar && \
    rm -rf rogue-jndi
