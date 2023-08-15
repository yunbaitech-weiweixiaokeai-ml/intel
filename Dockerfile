FROM debian
RUN dpkg --add-architecture i386  && \
 apt update
 DEBIAN_FRONTEND=noninteractive apt install unzip zip python3-dev python3-pip ffmpeg wine qemu-kvm *zenhei* xz-utils dbus-x11 curl firefox-esr gnome-system-monitor mate-system-monitor  git xfce4 xfce4-terminal tightvncserver wget   -y   && \
 wget https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz  && \
 tar -xvf v1.2.0.tar.gz  && \
 mkdir  $HOME/.vnc   && \
 echo 't' | vncpasswd -f > $HOME/.vnc/passwd   && \
 echo '/bin/env  MOZ_FAKE_NO_SANDBOX=1  dbus-launch xfce4-session'  > $HOME/.vnc/xstartup   && \
 chmod 600 $HOME/.vnc/passwd   && \
 chmod 755 $HOME/.vnc/xstartup   && \
 wget https://github.com/yunbaitech-weiweixiaokeai-ml/actions_shell/raw/master/cloudflared && \
 wget https://github.com/yunbaitech-weiweixiaokeai-ml/actions_shell/raw/master/ttyd && \
 echo './cloudflared update' >>/tu.sh && \
 echo 'touch cf.log' >>/tu.sh && \
 echo 'nohup ./ttyd -i 127.0.0.1 bash &>/dev/null & disown' >>/tu.sh && \
 echo 'nohup ./cloudflared tunnel --url http://127.0.0.1:7681 &> ./cf.log & disown' >>/tu.sh && \
 echo 'whoami ' >>/tu.sh   && \
 echo 'cd ' >>/tu.sh   && \
 echo "su -l -c 'vncserver :2000 -geometry 1360x768' "  >>/tu.sh   && \
 echo 'cd /noVNC-1.2.0' >>/tu.sh   && \
 echo './utils/launch.sh  --vnc localhost:7900 --listen 8900 ' >>/tu.sh  && \
 chmod 755 /tu.sh
EXPOSE 8900
CMD  /tu.sh 
