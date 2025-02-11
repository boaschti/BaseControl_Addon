ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for the BaseControl add-on evtl py3-pip
RUN \
  apk add --no-cache \
             python3 \
             avrdude \
             git


RUN git clone https://github.com/3DES/BaseControl.git

# ensure that no cache data are used if version in config.yaml was updated
ARG BUILD_VERSION
ARG build=$BUILD_VERSION

WORKDIR /BaseControl

RUN git pull
RUN git checkout tags/$BUILD_VERSION

# create venv
RUN python -m venv /BaseControl/venv
# Enable venv
ENV PATH="/BaseControl/venv/bin:$PATH"


RUN which python3 # /BaseControl/venv/bin/python3
RUN python3 -m pip install -r requirements.txt
# falls nicht
# RUN which pip # /BaseControl/venv/bin/pip
# RUN pip install -r requirements.txt


# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
