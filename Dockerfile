FROM stakater/tomcat7:7.0.55
MAINTAINER Muhammad Hamza Zaib <hamza@aurorasolutions.io>

# Set customizable env vars defaults.
ENV GRAILS_VERSION 3.2.2
ENV JAVA_OPTS -Xms256m -Xmx512m
ENV GRAILS_DEPENDENCY_CACHE_DIR /app/.m2/repository

# Download Install utilities
RUN apk -Uuv add unzip wget

# Install Grails
WORKDIR /usr/lib/jvm
RUN wget https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip
RUN unzip grails-$GRAILS_VERSION.zip
RUN rm -rf grails-$GRAILS_VERSION.zip
RUN ln -s grails-$GRAILS_VERSION grails

# Setup Grails path.
ENV GRAILS_HOME /usr/lib/jvm/grails
ENV PATH $GRAILS_HOME/bin:$PATH

# Clean up APT.
RUN rm /var/cache/apk/*

VOLUME ["/app"]
WORKDIR /app