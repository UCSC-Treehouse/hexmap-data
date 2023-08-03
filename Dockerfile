FROM ucschexmap/compute@sha256:05bcd6135022ebe6f851730a25a2c46fba89deebdaa6cd14d58797abd48efff5

# Set up hexmap user
RUN groupadd -g 2000 hexdocker 
RUN useradd hexmap -u 1478 -g 2000 -m -s /bin/bash
# Remove legacy app dir
RUN rm -r /usr/src/app
# Make the parent directory for the jobQueue sqlite DB, owned by hexmap
RUN mkdir /usr/src/computeDb
RUN chown hexmap:hexdocker /usr/src/computeDb

# Set up the environment variables
USER hexmap
ENV HEXCALC=/usr/src/app
ENV PYTHONPATH=\
$HEXCALC/calc:\
$HEXCALC/www:\
$HEXCALC/www/util:\
$HEXCALC/www/adapters:\
$HEXCALC/www/cellDb:\
$HEXCALC/www/job:\
$HEXCALC/www/project:\
$HEXCALC/www/upload

WORKDIR /usr/src/app
# TODO: Replace this COPY with a call to download a pinned version of the code from GitHub into /app
COPY --chown=hexmap:hexdocker . /usr/src/app
CMD ["/bin/bash"]
