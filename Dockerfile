FROM quay.io/pypa/musllinux_1_1_x86_64

ENV PLAT musllinux_1_1_x86_64

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
