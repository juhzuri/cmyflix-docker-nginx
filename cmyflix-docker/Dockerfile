FROM alpine as build
RUN \
  apk --no-cache upgrade && \
  apk --no-cache add \
    bash \
    cjson-dev \
    curl-dev \
    gcc \
    git \
    libbsd-dev \
    make \
    musl-dev && \
  git clone https://github.com/farfalleflickan/cmyflix.git && \
  cd cmyflix && \
  make
FROM alpine
COPY --from=build /cmyflix /tmp/cmyflix
RUN \
  cd /tmp/cmyflix && \
  apk --no-cache upgrade && \
  apk --no-cache add \
    cjson \
    ffmpeg \
    imagemagick \
    imagemagick-libs \
    libbsd \
    libcurl && \
# Skipping installing `make` and usage of `make install` due to upstream's makefile compiling when `make install` is run.
  cp ./bin/cmyflix /usr/local/bin/ && \
  mkdir -p /etc/cmyflix/Movies /etc/cmyflix/output /etc/cmyflix/TV && \
  cp -r ./extras/* /etc/cmyflix && \
  rm -rf /tmp/*
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
ENV CONF_FILE=/etc/cmyflix/cmyflix.cfg
ENTRYPOINT ["/docker-entrypoint.sh"]
