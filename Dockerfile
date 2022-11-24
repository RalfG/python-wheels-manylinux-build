FROM quay.io/pypa/manylinux_2_24_aarch64

ENV PLAT manylinux_2_24_aarch64

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
