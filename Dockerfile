# -------------------------------------------------------
#
# docker-altitude
#
# Builds a basic docker imagethatcan run an Altitudeserver (http://altitudegame.com/).
#
# Authors: Gjermund Jensvoll
# Code based on docker-minecraft by Isaac Bythewood (https://github.com/overshard/docker-minecraft)
# -------------------------------------------------------

# Base system is the LTS version of Ubuntu.
FROM ubuntu:14.04

# Make sure we don't get notifications we can't answer during building.
ENV    DEBIAN_FRONTEND noninteractive

# Download and install everything from the repos.
RUN    apt-get --yes update; apt-get --yes upgrade
RUN    apt-get --yes install openjdk-6-jre lib32gcc1 expect curl

# Load scripts.
ADD    ./scripts/start /start

# Fix permissions
RUN    chmod +x /start

# Expose ports
EXPOSE 27275/udp
EXPOSE 27276/udp

# /data contains static files and database
VOLUME ["/data"]

# /start runs it.
CMD    ["/start"]
