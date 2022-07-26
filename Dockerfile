FROM quay.io/pypa/musllinux_1_1_ppc64le

ENV PLAT musllinux_1_1_ppc64le

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
