FROM openjdk:8-jdk-alpine
RUN set -x & apk update && apk upgrade && apk add --no-cache curl && apk --no-cache add openssl
ARG mlr_version

ADD docker-entrypoint.sh entrypoint.sh
RUN ["chmod", "+x", "entrypoint.sh"]

RUN  curl -k -X GET "https://cida.usgs.gov/artifactory/mlr-maven-centralized/gov/usgs/wma/mlrLegacy/$mlr_version/mlrLegacy-$mlr_version.jar" > app.jar
EXPOSE 8443
ENTRYPOINT [ "/entrypoint.sh" ]
