FROM quay.io/pypa/manylinux2014_aarch64

ENV PLAT manylinux2014_aarch64

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
