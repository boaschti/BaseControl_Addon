#!/usr/bin/with-contenv bashio

echo "Start script was triggert!"
mkdir -p ../addons/BaseControlConfig/
chmod a+w ../addons/BaseControlConfig/

mkdir -p json/
chmod a+w json/

echo "+++++++++++++++++++++ Workdir +++++++++++++++++++++"
ls -la

# make config files and symlinks to BaseControl dir
if [[ ! -e ../addons/BaseControlConfig/logger.txt ]]; then
    touch ../addons/BaseControlConfig/logger.txt
fi

if [[ ! -e logger.txt ]]; then
    ln -s ../addons/BaseControlConfig/logger.txt
fi

if [[ ! -e ../addons/BaseControlConfig/secure.json ]]; then
    echo -e "{\n# add your secret config here\n}" >  ../addons/BaseControlConfig/secure.json
fi

if [[ ! -e json/secure.json ]]; then
    ln -s ../../addons/BaseControlConfig/secure.json json/secure.json
fi

if [[ ! -e ../addons/BaseControlConfig/project.json ]]; then
    echo "{ add your config here }" >  ../addons/BaseControlConfig/project.json
fi

if [[ ! -e json/project.json ]]; then
    ln -s ../../addons/BaseControlConfig/project.json json/project.json
fi

if [[ ! -e ../addons/BaseControlConfig/temporary.json ]]; then
    echo -e "{\n# add your temporary config here\n}" > ../addons/BaseControlConfig/temporary.json
fi

if [[ ! -e json/temporary.json ]]; then
    ln -s ../../addons/BaseControlConfig/temporary.json json/temporary.json
fi

# copy example config to make it easy to configure basecontrol
if [[ -e ../addons/BaseControlConfig/ExampleConfig ]]; then
    rm -rf ../addons/BaseControlConfig/ExampleConfig
fi
cp -r ExampleConfig ../addons/BaseControlConfig

# create a logfile folder where basecontrol members can log
if [[ ! -e ../addons/BaseControlConfig/logfiles ]]; then
    mkdir ../addons/BaseControlConfig/logfiles
fi

ln -s ../addons/BaseControlConfig/logfiles/

# todo start shell email skript

echo "++++++++++++++++++++++ git +++++++++++++++++++++++"
git log --graph -1

echo "+++++++++++++++++++++ Python +++++++++++++++++++++"
python3 -V

echo "Now look for your connected devices:"
echo "++++++++ Serial ports /dev/serial/by-path/ ++++++++"
ls -la /dev/serial/by-path/
echo "+++++++++ Serial ports /dev/serial/by-id/ +++++++++"
ls -la /dev/serial/by-id/

echo "BaseControl is configureable via Samba. Please check addons/BaseControlConfig directory."

# start BaseControl. Error if configfiles not found. Loglevel info. Printout everything.
python3 __main__.py -e -l 3 -p 3
