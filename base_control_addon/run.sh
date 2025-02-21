#!/usr/bin/with-contenv bashio

echo "Start script was triggert!"
mkdir -p ../homeassistant/BaseControlConfig/
chmod a+w ../homeassistant/BaseControlConfig/

mkdir -p json/
chmod a+w json/
#chmod a+w pp.sh

echo "+++++++++++++++++++++ Workdir +++++++++++++++++++++"
ls -la

# make config files and symlinks to BaseControl dir
if [[ ! -e ../homeassistant/BaseControlConfig/logger.txt ]]; then
    touch ../homeassistant/BaseControlConfig/logger.txt
fi

if [[ ! -e logger.txt ]]; then
    ln -s ../homeassistant/BaseControlConfig/logger.txt
fi

if [[ ! -e ../homeassistant/BaseControlConfig/secure.json ]]; then
    echo -e "{\n# add your secret config here\n}" >  ../homeassistant/BaseControlConfig/secure.json
fi

if [[ ! -e json/secure.json ]]; then
    ln -s ../../homeassistant/BaseControlConfig/secure.json json/secure.json
fi

if [[ ! -e ../homeassistant/BaseControlConfig/project.json ]]; then
    echo "{ add your config here }" >  ../homeassistant/BaseControlConfig/project.json
fi

if [[ ! -e json/project.json ]]; then
    ln -s ../../homeassistant/BaseControlConfig/project.json json/project.json
fi

if [[ ! -e ../homeassistant/BaseControlConfig/temporary.json ]]; then
    echo -e "{\n# add your temporary config here\n}" > ../homeassistant/BaseControlConfig/temporary.json
fi

if [[ ! -e json/temporary.json ]]; then
    ln -s ../../homeassistant/BaseControlConfig/temporary.json json/temporary.json
fi

# copy example config to make it easy to configure basecontrol
if [[ -e ../homeassistant/BaseControlConfig/ExampleConfig ]]; then
    rm -rf ../homeassistant/BaseControlConfig/ExampleConfig
fi
cp -r ExampleConfig ../homeassistant/BaseControlConfig

# create a logfile folder where basecontrol members can log
if [[ ! -e ../homeassistant/BaseControlConfig/logfiles ]]; then
    mkdir ../homeassistant/BaseControlConfig/logfiles
fi

ln -s ../homeassistant/BaseControlConfig/logfiles/

# todo start shell email skript

echo "++++++++++++++++++++++ git +++++++++++++++++++++++"
git log --graph -1

echo "+++++++++++++++++++++ Python +++++++++++++++++++++"
python3 -V
# should be /BaseControl/venv/bin/xx
which python3 # /BaseControl/venv/bin/python3
which pip


echo "Now look for your connected devices:"
echo "++++++++ Serial ports /dev/serial/by-path/ ++++++++"
ls -la /dev/serial/by-path/
echo "+++++++++ Serial ports /dev/serial/by-id/ +++++++++"
ls -la /dev/serial/by-id/

echo "BaseControl is configureable via Samba or Studio Code Server Addon. Please check homeassistant/BaseControlConfig directory."

# start BaseControl. Error if configfiles not found. Loglevel info. Printout everything.
python3 __main__.py -e -l 3 -p 3
# start BaseControl with pp.sh which sends a Email if a error occoured
#EXECUTE=__main__.py -e -l=3 -p=3 ./pp.sh

