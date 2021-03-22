
FROM openjdk:8-jre-alpine

ENV OPENREFINE_VERSION 3.4.1
ENV OPENREFINE_FILE openrefine-linux-${OPENREFINE_VERSION}.tar.gz
ENV OPENREFINE_URL https://github.com/OpenRefine/OpenRefine/releases/download/${OPENREFINE_VERSION}/${OPENREFINE_FILE}

WORKDIR /app

RUN set -xe \
    && apk add --no-cache bash curl tar \
    && curl -sSL ${OPENREFINE_URL} | tar xz --strip 1

# fix grep `-P` option
COPY files/refine /app/refine

# UI fix for `../images/...` path to respect base URL
COPY files/data-table-view.js /app/webapp/modules/core/scripts/views/data-table/data-table-view.js
COPY files/common.less        /app/webapp/modules/core/styles/common.less


VOLUME /data
WORKDIR /data

EXPOSE 3333

ENTRYPOINT ["/app/refine"]
CMD ["-i", "0.0.0.0", "-d", "/data"]
