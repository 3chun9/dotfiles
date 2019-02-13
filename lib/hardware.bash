# Filename:    hardware.bash
# Description: Manage IO devices on Linux.
#

if [[ `uname` == 'Linux' ]]; then
    # touchpad :: String -> Maybe Interrupt
    function touchpad {
        TOUCHPAD=`xinput list | grep TouchPad | cut -f 2 | cut -c 4-`

        [ "$#" -ne 1 ] &&
            echo "Error: please input either \`on\` or \`off\`." &&
            return

        if [ $1 == "on" ]; then
            xinput --enable $TOUCHPAD
        elif [ $1 == "off" ]; then
            xinput --disable $TOUCHPAD
        else
            echo "Error: please input either \`on\` or \`off\`."
            return
        fi
    }
fi