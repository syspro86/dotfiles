#!/bin/bash

# edge, chrome 에서 gnome 확장기능 설치하기 위한 브라우저 확장 설치 
# https://wiki.gnome.org/action/show/Projects/GnomeShellIntegration/Installation?action=show&redirect=Projects%2FGnomeShellIntegrationForChrome%2FInstallation
# https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep
# sudo apt-get install chrome-gnome-shell

sudo apt install wget jq

array=( https://extensions.gnome.org/extension/6/applications-menu/
https://extensions.gnome.org/extension/2986/runcat/
https://extensions.gnome.org/extension/2182/noannoyance/
https://extensions.gnome.org/extension/1460/vitals/
https://extensions.gnome.org/extension/744/hide-activities-button/
https://extensions.gnome.org/extension/8/places-status-indicator/ )

for i in "${array[@]}"
do
    EXTENSION_ID=$(curl -s $i | grep -oP 'data-uuid="\K[^"]+')
    VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=$EXTENSION_ID" | jq '.extensions[0] | .shell_version_map | map(.pk) | max')
    wget -O ${EXTENSION_ID}.zip "https://extensions.gnome.org/download-extension/${EXTENSION_ID}.shell-extension.zip?version_tag=$VERSION_TAG"
    gnome-extensions install --force ${EXTENSION_ID}.zip
    if ! gnome-extensions list | grep --quiet ${EXTENSION_ID}; then
        busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${EXTENSION_ID}
    fi
    gnome-extensions enable ${EXTENSION_ID}
    rm ${EXTENSION_ID}.zip
done
