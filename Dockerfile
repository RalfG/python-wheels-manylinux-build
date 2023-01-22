FROM quay.io/pypa/musllinux_1_1_i686

ENV PLAT musllinux_1_1_i686

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
