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


# copy example config to make it easy to config basecontrol
#if [[ -e ../addons/BaseControlConfig/json ]]; then
#    rm ../addons/BaseControlConfig/json
#fi
# mkdir ../addons/BaseControlConfig/json
# todo funktioniert nicht
# cp ExampleConfig/ ../addons/BaseControlConfig/json/ExampleConfig



echo "++++++++ Serial ports /dev/serial/by-path/ ++++++++"
ls -la /dev/serial/by-path/
echo "+++++++++ Serial ports /dev/serial/by-id/ +++++++++"
ls -la /dev/serial/by-id/

echo "++++++++++++++++++++++ git +++++++++++++++++++++++"
git log --graph -1

echo "BaseControl is configureable via Samba."

# start BaseControl. Error if configfiles not found. Loglevel info. Printout everything.
python3 __main__.py -e -l 3 -p
