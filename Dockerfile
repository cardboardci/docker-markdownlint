FROM cardboardci/ci-core:disco
USER root

COPY provision/pkglist /cardboardci/pkglist
RUN apt-get update \
    && xargs -a /cardboardci/pkglist apt-get install --no-install-recommends -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g markdownlint-cli

USER cardboardci

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer = "CardboardCI" \
    \
    org.label-schema.schema-version = "1.0" \
    \
    org.label-schema.name = "markdownlint" \
    org.label-schema.version = "${version}" \
    org.label-schema.build-date = "${build_date}" \
    org.label-schema.release= = "CardboardCI version:${version} build-date:${build_date}" \
    org.label-schema.vendor = "cardboardci" \
    org.label-schema.architecture = "amd64" \
    \
    org.label-schema.summary = "NodeJS linter" \
    org.label-schema.description = "A Node.js style checker and lint tool for Markdown/CommonMark files" \
    \
    org.label-schema.url = "https://gitlab.com/cardboardci/images/markdownlint" \
    org.label-schema.changelog-url = "https://gitlab.com/cardboardci/images/markdownlint/releases" \
    org.label-schema.authoritative-source-url = "https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/markdownlint" \
    org.label-schema.distribution-scope = "public" \
    org.label-schema.vcs-type = "git" \
    org.label-schema.vcs-url = "https://gitlab.com/cardboardci/images/markdownlint" \
    org.label-schema.vcs-ref = "${vcs_ref}" \