FROM scratch

MAINTAINER Vincent Gu <0x6c34@gmail.com>

ADD http://mirrors.kernel.org/archlinux/iso/2016.10.01/archlinux-bootstrap-2016.10.01-x86_64.tar.gz /

COPY /etc/ /etc/

RUN echo -n "pacman refresh keys:" && \
  pacman-key --init && pacman-key --populate archlinux && pacman-key --refresh-keys && \
  echo -n "pacman -Syu:" && pacman -Syu -q --noconfirm --noprogressbar && \
  echo -n "pacman-db-upgrade:" && pacman-db-upgrade && \
  echo -n "pacman -Sy pacman:" && pacman -Su -q --noconfirm --noprogressbar pacman && \
  echo -n "pacman-db-upgrade:" && pacman-db-upgrade && \
  echo -n "pacman -S yaourt:" && pacman -S -q --noconfirm --noprogressbar yaourt && \
  echo -n "pacman-db-upgrade:" && pacman-db-upgrade && \
  echo -n "pacman remove cache:" && rm -rf '/var/cache/pacman/*'
