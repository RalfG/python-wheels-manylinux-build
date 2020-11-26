FROM quay.io/pypa/manylinux1_i686

ENV PLAT manylinux1_i686

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
