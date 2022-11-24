FROM quay.io/pypa/manylinux_2_24_s390x

ENV PLAT manylinux_2_24_s390x

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
