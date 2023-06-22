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

# ensure that no cache data are used
ARG build=1

RUN ls -la /usr/share/

WORKDIR /BaseControl

RUN git pull

RUN python3 -m pip install -r requirements.txt

ENTRYPOINT [ "python3", "__main__.py" ]