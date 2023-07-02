ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk add --no-cache \
             python3 \
             avrdude \
             git


RUN python3 -m ensurepip

RUN git clone https://github.com/3DES/BaseControl.git

# ensure that no cache data are used if version in config.yaml was updated
ARG BUILD_VERSION
ARG build=$BUILD_VERSION

WORKDIR /BaseControl

RUN git pull
RUN git checkout tags/$BUILD_VERSION

RUN python3 -m pip install -r requirements.txt

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
