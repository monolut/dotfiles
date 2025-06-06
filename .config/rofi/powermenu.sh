#sudo visudo -f /etc/sudoers.d/powermenu
#which systemctl
#which shutdown
#which reboot
#which suspend
#your_username ALL=(ALL) NOPASSWD: /usr/bin/systemctl poweroff, /usr/bin/systemctl reboot, /usr/bin/systemctl suspend, /usr/sbin/shutdown
#!/bin/bash

options="  Shutdown
󰑓  Reboot
󰒲  Suspend
󰍃  Logout
󰴆  30 MIN
󱘋  60 MIN
  Cancel"

choice=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu:" -lines 6)

case "$choice" in
    "  Shutdown")
        sudo systemctl poweroff
        2803
        ;;
    "󰑓  Reboot")
        sudo systemctl reboot
        2803
        ;;
    "󰒲  Suspend")
        sudo systemctl suspend
        2803
        ;;
    "󰍃  Logout")
        qdbus org.kde.ksmserver /KSMServer logout 0 0 0
        ;;
    "󰴆  30 MIN")
        sudo shutdown -h +30
        ;;
    "󱘋  60 MIN")
        sudo shutdown -h +60
        ;;
    "  Cancel")
        sudo shutdown -c
        ;;
    *)
        exit 1
        ;;
esac
