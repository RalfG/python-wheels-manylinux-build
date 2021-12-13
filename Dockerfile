FROM quay.io/pypa/manylinux_2_24_s390x

ENV PLAT manylinux2010_x86_64

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
