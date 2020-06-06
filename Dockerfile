FROM kalilinux/kali-linux-docker
LABEL MAINTAINER="traxplayer@gmail.com"
RUN apt-get update && apt-get upgrade -y &&
    apt-get install -y metasploit-framework tmux \
                       kali-tools-passwords \
                       kali-tools-reverse-engineering \
                       kali-tools-exploitation \
                       kali-tools-post-exploitation \
                       kali-tools-forensics \
                       kali-tools-information-gathering \
                       gobuster \
                       mlocate \
                       python-pip \
                       python3-pip
    apt -y autoremove &&
    updatedb            
ENTRYPOINT ["/bin/bash"]
