FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /home

# Make some custom paths
RUN mkdir -p /usr/share/jars

# Install some packages
RUN apt-get update && apt-get -yq install \
    kali-linux-headless \
    gobuster \
    evil-winrm \
    maven

# Install rogue-jndi jar
RUN git clone https://github.com/veracode-research/rogue-jndi.git && \
    mvn -f rogue-jndi/pom.xml package && \
    mv rogue-jndi/target/RogueJndi*.jar /usr/share/jars/RogueJndi.jar && \
    rm -rf rogue-jndi

# Decompress rockyou
RUN 7z -o/usr/share/wordlists/ x /usr/share/wordlists/rockyou.txt.gz && \
    rm /usr/share/wordlists/rockyou.txt.gz