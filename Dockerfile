FROM debian:latest
MAINTAINER fzerorubigd <fzerorubigd@gmail.com>

# Install required apps
ADD install.sh /tmp/install.sh
RUN bash /tmp/install.sh

# Create vagrant user
ADD user.sh /tmp/user.sh
RUN bash /tmp/user.sh


# Install extra tools
ADD extra.sh /tmp/extra.sh
RUN bash /tmp/extra.sh


