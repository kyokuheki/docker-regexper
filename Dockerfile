FROM node
LABEL maintainer Kenzo Okuda <kyokuheki@gmail.com>
ENV VERSION="20200905"

RUN set -x \
 && mkdir /regexper-static \
 && curl -sSL https://gitlab.com/javallone/regexper-static/-/archive/release-${VERSION}/regexper-static-release-${VERSION}.tar.gz | tar zxvf - -C /regexper-static --strip-components 1 \
 && cd /regexper-static \
 && yarn install

EXPOSE 8080
ENTRYPOINT []
CMD yarn start --host 0.0.0.0 --port 8080 --mode production

HEALTHCHECK --start-period=60s --interval=60s --timeout=5s \
 CMD curl -f http://localhost/ || exit 1
