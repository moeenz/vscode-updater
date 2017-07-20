# Visual Studio Code Updater
This is a simple script to automate downloading, installing and restarting vscode.

## Usage
```
    chmod +x update.sh
    ./update.sh
```

For easier future usages simply put this in your .bashrc or .bash_profile file:
```
    alias update-vscode="bash /path/to/vscode-updater/update.sh"
```
Now you can run ```update-vscode``` easily from anywhere in terminal.

# Note
This script will kill all vscode processes before installing latest version, so you're responsible for saving your work before running this script.
