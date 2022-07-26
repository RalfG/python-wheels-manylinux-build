FROM quay.io/pypa/manylinux_2_24_i686

ENV PLAT manylinux_2_24_i686

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
