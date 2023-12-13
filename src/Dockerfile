ARG ARCH=
FROM ${ARCH}alpine:3

# install samba
RUN apk add samba

# copy entrypoint
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV USER_NAME=foo USER_PASSWORD=bar SHARE_NAME=share
EXPOSE 137/udp 138/udp 139/udp 445/tcp
CMD [ "/entrypoint.sh" ]