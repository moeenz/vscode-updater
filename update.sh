OS=$(lsb_release -si);
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
DIST="";

if [ "$OS" = "Ubuntu" ] || [ "$OS" = "Debian" ]; then
    DIST="deb";
    echo "Debian based";
elif [ "$OS" = "Fedora" ] || [ "$OS" = "Red Hat" ] || [ "$OS" = "Red hat" ]; then
    DIST="rpm";
    echo "Red hat based";
else
    echo "Unfortunately your operating system is not supported in distributed packages.";
    exit;
fi

URLBASE="https://vscode-update.azurewebsites.net/latest/linux-${DIST}-x64/stable";
FILENAME="$DIR/latest.${DIST}";

if test -e "$FILENAME"; then
    rm $FILENAME;
    echo "Removed last downloaded version."
fi

echo "Downloading latest version of vscode is starting...";
wget $URLBASE -o $FILENAME;
printf "Downloading finished.\n\n";

echo "Closing vscode...";
for pid in $(pidof code); do kill -9 $pid; done
echo "vscode instance(s) closed.";

echo "Installing latest version...";
if [ "$DIST" = "deb" ]; then
    sudo dpkg -i $FILENAME;
else
    sudo rpm -i $FILENAME;
fi
echo "Installation finished.";

echo "Starting new version of vscode...";
code &;
exit;
