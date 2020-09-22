title="64-bitify by Raspberry Pi News"
prompt="Pick an option:"
options=("Install 64-bit kernal code (do this first!)" "Enable 64-bit kernal" "Disable 64-bit kernal" "Revert config.txt" "Update script")

echo "$title"
echo ""
PS3="$prompt "

echo "This script will make your OS 64-bit while allowing your 32-bit applications to still run in a 32-bit userland. This is alpha code, so MAKE SURE YOU BACKUP BEFOREHAND, or else you could break your install."
echo ""

select opt in "${options[@]}" "Quit to shell"; do 

    case "$REPLY" in
	
    1 ) sudo rpi-update -y && sudo cp /boot/config.txt /boot/config.txt.bak && sudo sed -i '/max_framebuffers=2/a arm_64bit=1' /boot/config.txt && echo "64-bit kernal code is now installed. You can check if you have 64 bit by typing 'uname -a'. If it have aarch64 in the output, then you are on 64-bit mode." && read -p "The system will now restart. When ready, press [Enter] to continue or [Ctrl-C] to cancel..." && sudo reboot;;
    2 ) sudo perl -p -i -e 's/#arm_64bit=1/arm_64bit=1/g' /boot/config.txt && echo "64-bit is now enabled" && read -p "The system will now restart. When ready, press [Enter] to continue or [Ctrl-C] to cancel..." && sudo reboot;;
    3 ) sudo perl -p -i -e 's/arm_64bit=1/#arm_64bit=1/g' /boot/config.txt && echo "64-bit is now disabled" && read -p "The system will now restart. When ready, press [Enter] to continue or [Ctrl-C] to cancel..." && sudo reboot;;
    4 ) sudo mv /boot/config.txt.bak /boot/config.txt && echo "Reverted config.txt to when 64-bit was installed" && read -p "The system will now restart. When ready, press [Enter] to continue or [Ctrl-C] to cancel..." && sudo reboot;;
    5 ) rm 64-bitify.sh && wget https://raw.githubusercontent.com/mobilegmYT/64-bitify/master/64-bitify.sh && chmod +x 64-bitify.sh;; 
	
    $(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;

    esac

done