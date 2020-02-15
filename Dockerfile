FROM quay.io/pypa/manylinux2014_ppc64le

ENV PLAT manylinux2014_ppc64le

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
