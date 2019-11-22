FROM kalilinux/kali-linux-docker
LABEL MAINTAINER="traxplayer@gmail.com"
RUN apt-get update && apt-get upgrade -y && apt-get install -y metasploit-framework
RUN apt-get install -y tmux
ENTRYPOINT ["/bin/bash"]
