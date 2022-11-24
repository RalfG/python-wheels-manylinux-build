FROM quay.io/pypa/musllinux_1_1_aarch64

ENV PLAT musllinux_1_1_aarch64

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
