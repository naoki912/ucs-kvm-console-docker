FROM archlinuxjp/archlinux-yaourt

ENV SSH_PORT 22

RUN pacman -Syu --noconfirm \
  && pacman -S --noconfirm fakeroot openssh xorg-xauth xorg-xhost \
  && pacman -Scc --noconfirm

RUN useradd -m -s /bin/bash ucs \
  && sed -i -e "s/#X11Forwarding no/X11Forwarding yes/" /etc/ssh/sshd_config \
  && sed -i -e "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config \
  && sed -i -e "s/#PermitRootLogin prohibit-password/PermitRootLogin no/" /etc/ssh/sshd_config \
  && ssh-keygen -A -f /etc/ssh/

USER yaourt

RUN yaourt -S --noconfirm jdk6

USER root

COPY ssh.sh /
COPY run.sh /

CMD ["/bin/bash"]
