title="64-bitify by Raspberry Pi News"
prompt="Pick an option:"
options=("Install 64-bit kernal code (do this first!)" "Enable 64-bit kernal" "Disable 64-bit kernal" "Revert config.txt")

echo "$title"
echo ""
PS3="$prompt "

echo "This script will make your OS 64-bit while allowing your 32-bit applications to still run in a 32-bit userland. This is alpha code, so MAKE SURE YOU BACKUP BEFOREHAND, or else you could break your install."
echo ""

select opt in "${options[@]}" "Quit to shell"; do 

    case "$REPLY" in

    1 ) sudo cp /boot/config.txt /boot/config.txt.bak && sudo awk '/max_framebuffers=2/{print $0 RS "arm_64bit=1";next}1' /boot/config.txt > tmp && mv tmp /boot/config.txt && echo "64-bit kernal code is now installed. You can check if you have 64 bit by typing 'uname -a'. If it have aarch64 in the output, then you are on 64-bit mode.";;
    2 ) sudo perl -p -i -e 's/#arm_64bit=1/arm_64bit=1/g' /boot/config.txt && echo "64-bit is now enabled";;
    3 ) sudo perl -p -i -e 's/arm_64bit=1/#arm_64bit=1/g' /boot/config.txt && echo "64-bit is now disabled";;
    4 ) sudo mv /boot/config.txt.bak /boot/config.txt && echo "Reverted config.txt to when 64-bit was installed";;
    
    $(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;

    esac

done

