#!/bin/bash

# This file is part of eRCaGuy_dotfiles: https://github.com/ElectricRCAircraftGuy/eRCaGuy_dotfiles

# Install all scripts!
# - Edit this file manually, as desired, if you only want to install some scripts. 
# - Just comment out what you don't want to install.

# Goal: Have this script automatically install (by creating symlinks in ~/bin) all scripts herein!
# For the sake of making it super easy to find all custom scripts, prepend each symbolic link in ~/bin with 
# the user's initials, like this: "gs_myscript".

# Optional: this will be prepended to every symbolic link created in ~/bin in order to make it super easy to 
# find all of your custom scripts. I recommend you set it to your initials, followed by an underscore. Set it
# to "" to not prepend anything.
PREPEND_STR="gs_" # set to your initials
# PREPEND_STR="" # or use this one to use nothing

# See my own ans here: https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself/60157372#60157372
THIS_PATH="$(realpath $0)"
echo "Path to this install script = \"$THIS_PATH\""
THIS_DIR="$(dirname "$THIS_PATH")"
# echo "THIS_DIR = \"$THIS_DIR\"" # for debugging 

mkdir -p ~/bin
cd "$THIS_DIR"

echo    "-----------------------------------------------------------------------------------------"
echo -e "Beginning installation. Note that if it asks if you'd like to \"overwrite\" or \"replace\"\n"\
"a file, simply pressing Enter will default to \"No\", which is the safe option to take."
echo    "-----------------------------------------------------------------------------------------"


# arduino
# See "arduino/readme--arduino.md"
echo "= Arduino stuff ="
echo "Adding user to \"dialout\" group."
echo "Please log out and log back in for this to take effect."
sudo usermod -a -G dialout $USERNAME
echo "Also, unplug and plug back in any USBasp programmer, if applicable."
sudo cp -i etc/udev/rules.d/99-USBasp.rules /etc/udev/rules.d
sudo udevadm control --reload-rules
sudo udevadm trigger

# Desktop_launchers
echo "= Desktop_launchers stuff ="
echo "Copying \"Desktop_launchers\" files to ~/Desktop_launchers"
cp -ri Desktop_launchers/*.desktop ~/Desktop_launchers
cp -ri Desktop_launchers/*.md ~/Desktop_launchers
echo "Installing \"desktop_file_install\" & \"desktop_file_uninstall\" scripts"
ln -si "$PWD/Desktop_launchers/desktop_file_install.sh" ~/bin/${PREPEND_STR}desktop_file_install
ln -si "$PWD/Desktop_launchers/desktop_file_uninstall.sh" ~/bin/${PREPEND_STR}desktop_file_uninstall

# eclipse
# Do it manually
# Esp. see "eclipse/Eclipse setup instructions on a new Linux (or other OS) computer.pdf"

# etc
# Arduino USBasp stuff already done above.
# See also "etc/udev/rules.d/readme--udev_rules.md"

# NoMachine
# Do it manually
# See: "NoMachine/readme--NoMachine.md"

# rsync
# For sample usage, see my answer here: 
# https://superuser.com/questions/1271882/convert-ntfs-partition-to-ext4-how-to-copy-the-data/1464264#1464264
# and here: https://unix.stackexchange.com/questions/65077/is-it-possible-to-see-cp-speed-and-percent-copied/567828#567828

# segger programmer
# Do it manually
# See my answer here: https://stackoverflow.com/questions/57307738/is-there-anybody-using-keil-mdk-on-linux-through-wine/57313990#57313990

# Templates
echo "= Templates stuff ="
echo "Copying \"Templates\" files to ~/Templates"
cp -ri Templates ~

# tmux
# TODO

# useful_scripts
# TODO

# Sublime Text 3, incl. as a git editor, & copying main settings over
# TODO

# ~/.bashrc & ~/.profile
# TODO

# .gitconfig
# TODO




