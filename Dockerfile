FROM node:12-alpine

RUN apk update && \
    apk upgrade --no-cache
RUN apk add --no-cache vips-tools vips-dev fftw-dev gcc g++ make libc6-compat git python \
        # Dependecies of NPM
        util-linux automake glu libxi autoconf \
        --repository https://dl-3.alpinelinux.org/alpine/edge/community/ \
        --repository https://dl-3.alpinelinux.org/alpine/edge/main
RUN apk add --no-cache openssh openrc
RUN rc-update add sshd
RUN rc-status
RUN /etc/init.d/sshd start
RUN rm -rf /var/cache/apk/*
RUN npm install --global  --no-optional \
        gatsby \
        react@^16.11.0 \
        react-dom@^16.11.0 \
        typescript && \
    npm -g update npm && \
    mkdir -p site

COPY entry.sh /

RUN dos2unix /entry.sh && chmod +x /entry.sh

# VOLUME /site

WORKDIR /site

EXPOSE 8000 22

ENTRYPOINT ["/entry.sh"]
