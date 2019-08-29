FROM adoptopenjdk/openjdk8:alpine-jre

ARG ARCHI_VERSION=4.5.1
ENV ARCHI_VERSION_ENV=$ARCHI_VERSION
RUN apk add --no-cache curl gtk+3.0 xvfb unzip sshpass ttf-opensans fontconfig && fc-cache -f \
&& curl -O https://www.archimatetool.com/downloads/$ARCHI_VERSION_ENV/Archi-Linux64-$ARCHI_VERSION_ENV.tgz \
&& curl -O https://www.archimatetool.com/downloads/plugins/org.archicontribs.modelrepository_0.5.2.201907081356.zip \
&& tar -xzf Archi-Linux64-$ARCHI_VERSION_ENV.tgz \
&& mkdir -p ~/.archi4/dropins \
&& unzip org.archicontribs.modelrepository_0.5.2.201907081356.zip -d ~/.archi4/dropins \
&& rm -f Archi-Linux64-$ARCHI_VERSION_ENV.tgz org.archicontribs.modelrepository_0.5.2.201907081356.zip
CMD Xvfb :99 -screen 0 1980x1024x16 -nolisten tcp
