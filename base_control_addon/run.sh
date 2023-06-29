#!/usr/bin/with-contenv bashio

echo "Start script was triggert!"
echo "+++++++++++++++++++++ Workdir +++++++++++++++++++++"
ls -la
echo "addons/BaseControlConfig dir"
mkdir -p ../addons/BaseControlConfig/
chmod a+w ../addons/BaseControlConfig/

# make config files and symlinks to BaseControl dir
if [[ ! -e ../addons/BaseControlConfig/logger.txt ]]; then
    touch ../addons/BaseControlConfig/logger.txt
fi

if [[ ! -e logger.txt ]]; then
    ln -s ../addons/BaseControlConfig/logger.txt
fi

if [[ ! -e ../addons/BaseControlConfig/secure.json ]]; then
    touch ../addons/BaseControlConfig/secure.json
fi

if [[ ! -e secure.json ]]; then
    ln -s ../addons/BaseControlConfig/secure.json
fi

if [[ ! -e ../addons/BaseControlConfig/project.json ]]; then
    touch ../addons/BaseControlConfig/project.json
fi

if [[ ! -e project.json ]]; then
    ln -s ../addons/BaseControlConfig/project.json
fi


ls -la ../addons/BaseControlConfig

echo "+++++++++++++++++++++ Workdir +++++++++++++++++++++"
ls -la

echo "++++++++++++++++++ Serial ports +++++++++++++++++++"
ls -la /dev/serial/by-path/
ls -la /dev/serial/by-id/

echo "++++++++++++++++++++++ git +++++++++++++++++++++++"
git log --graph -1

python3 __main__.py -e
