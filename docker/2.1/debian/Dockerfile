#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "updateDockerfile.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
#vim: set ft=dockerfile:
# Semantic Versioning
# https://semver.org/#semantic-versioning-200

FROM plone/plone:4.3.18-python27

LABEL Name="Identidade Digital para o Governo Brasileiro Federal para Plone" \
      maintainer="ForContent <suporte@forcontent.com.br>" \
      version="2.1"

ENV PYTHONUNBUFFERED=1 \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TZ=America/Sao_Paulo \
    BUILD_DEPS="python-setuptools \
                python-dev \
                build-essential \
                python-cffi \
                libssl-dev \
                libxml2-dev \
                libxslt1-dev \
                libbz2-dev \
                libjpeg62-turbo-dev \
                libyaml-dev" \
    RUN_DEPS="curl \
              tzdata \
              net-tools"

COPY site.cfg /plone/instance/

# Para Pillow
RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends --no-install-suggests ${BUILD_DEPS} ${RUN_DEPS} \
  && pip install cffi \
  && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
  && ln -s /usr/include/locale.h /usr/include/xlocale.h \
  && echo "$TZ" > /etc/timezone \
  && bin/buildout -c site.cfg -t 300 \
  && apt-get purge -y --auto-remove ${BUILD_DEPS} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm -rf /usr/share/doc \
  && rm -rf /usr/share/man \
  && rm -rf /plone/buildout-cache/downloads/* \
  && find /plone \( -type f -a -name '*.pyc' -o -name '*.pyo' \) -exec rm -rf '{}' + \
  && find /data  -not -user plone -exec chown plone:plone {} \+ \
  && find /plone -not -user plone -exec chown plone:plone {} \+ \

USER plone
