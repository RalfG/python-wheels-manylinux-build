FROM quay.io/pypa/manylinux2014_i686

ENV PLAT manylinux2014_i686

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
