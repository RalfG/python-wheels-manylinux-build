FROM quay.io/pypa/manylinux2010_i686

ENV PLAT manylinux2010_i686

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
