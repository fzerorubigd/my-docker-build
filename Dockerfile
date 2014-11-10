FROM debian:latest
MAINTAINER fzerorubigd <fzerorubigd@gmail.com>

# Install required apps
ADD install.sh /tmp/install.sh
RUN bash /tmp/install.sh

# Create vagrant user
ADD user.sh /tmp/user.sh
RUN bash /tmp/user.sh

# First add golang for some tools and gron
ADD go1.3.3.linux-amd64.tar.gz /usr/local/

ADD tmp/bin/tmass /usr/local/bin/

# Install extra tools
ADD extra.sh /tmp/extra.sh
RUN bash /tmp/extra.sh
