##OCP Infrastucture Performance Benchmark Container
##Thanks to https://github.com/t0t0/docker-phoronix for the initial work
#Base Image
FROM    alpine

# File Author / Maintainer
MAINTAINER info@arctiq.ca


#Add repositories
RUN echo "ipv6" >> /etc/modules
RUN echo "http://dl-1.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories; \
    echo "http://dl-2.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories; \
    echo "http://dl-3.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories; \
    echo "http://dl-4.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories; \
    echo "http://dl-5.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories

# Install dependencies
RUN apk update && apk add --no-cache make gcc g++ libtool linux-headers perl pcre-dev php php-dom php-zip php-json

# Download  & extract Phoronix package
RUN wget http://www.phoronix-test-suite.com/download.php?file=phoronix-test-suite-6.6.1 -O phoronix-test-suite-6.6.1.tar.gz
RUN tar xzf phoronix-test-suite-6.6.1.tar.gz
RUN rm -f phoronix-test-suite-6.6.1.tar.gz
RUN cd phoronix-test-suite && ./install-sh

# Install tests
## Disk
RUN phoronix-test-suite install pts/iozone
## CPU
#RUN phoronix-test-suite install pts/c-ray
## Memory
#RUN phoronix-test-suite install pts/stream
## Services
#RUN phoronix-test-suite install pts/apache
#RUN phoronix-test-suite install pts/redis


# Copy custom scripts
COPY scripts/ .

# Execute benchmark script
CMD ./run.sh
