FROM quay.io/pypa/musllinux_1_1_s390x

ENV PLAT musllinux_1_1_s390x

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
