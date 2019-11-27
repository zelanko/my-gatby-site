FROM node:12-alpine

RUN apk update && \
    apk upgrade && \
    apk add vips-tools vips-dev fftw-dev gcc g++ make libc6-compat git python util-linux \
        # Dependecies of NPM
        glu libxi autoconf \
        --repository https://dl-3.alpinelinux.org/alpine/edge/community/ \
        --repository https://dl-3.alpinelinux.org/alpine/edge/main && \
    rm -rf /var/cache/apk/* && \
    npm install --global  --no-optional \
        gatsby \
        react@^16.11.0 \
        react-dom@^16.11.0 \
        typescript && \
    npm -g update npm && \
    mkdir -p site

COPY entry.sh /

RUN dos2unix /entry.sh && chmod +x /entry.sh

VOLUME /site

WORKDIR /site

EXPOSE 8000

ENTRYPOINT ["/entry.sh"]
