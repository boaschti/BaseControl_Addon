ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk add --no-cache \
             python3 \
             avrdude \
             git


RUN git clone https://github.com/3DES/BaseControl.git

WORKDIR /BaseControl

# ensure that no cache data are used
RUN git pull

RUN python3 -m ensurepip
RUN python3 -m pip install -r requirements.txt

ENTRYPOINT [ "python3", "__main__.py" ]