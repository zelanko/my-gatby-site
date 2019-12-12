FROM node:12-alpine

COPY entry.sh /

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache \
      vips-tools \
      vips-dev \
      fftw-dev \
      gcc \
      g++ \
      make \
      libc6-compat \
      git \
      python \
      # Dependecies of NPM
      util-linux \
      automake \
      glu \
      libxi \
      autoconf \
        --repository https://dl-3.alpinelinux.org/alpine/edge/community/ \
        --repository https://dl-3.alpinelinux.org/alpine/edge/main && \
    npm -g update npm && \
    mkdir -p site && \
    dos2unix /entry.sh && \
    chmod +x /entry.sh

VOLUME /site

WORKDIR /site

EXPOSE 8000

ENTRYPOINT ["/entry.sh"]
