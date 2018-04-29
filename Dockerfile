FROM resin/rpi-raspbian
MAINTAINER Peter Rehley <peter_rehley@yahoo.com>

RUN apt-get update && \
    apt-get -y -o "DPkg::Options::=--force-confold" -o "DPkg::Options::=--force-confdef" install apt-utils && \
    apt-get -y -o "DPkg::Options::=--force-confold" -o "DPkg::Options::=--force-confdef" dist-upgrade && \
    apt-get install -y \
      -o "DPkg::Options::=--force-confold" \
      -o "DPkg::Options::=--force-confdef" \
      isc-dhcp-server man && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

COPY util/dumb-init_1.2.1_arm32 /usr/bin/dumb-init
COPY util/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
