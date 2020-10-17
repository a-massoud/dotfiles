#!/bin/bash
rofi_command="rofi"
confirm_command="$rofi_command -no-fixed-num-lines -dmenu -i -p \"Are you sure?\""

uptime=$(uptime -p | sed 's/up //g')

# Options
lock="lock"
suspend="suspend"
hibernate="hibernate"
shutdown="shutdown"
reboot="reboot"
logout="quit"
dir="$HOME/.config/rofi/power"

# Variable passed to rofi
options="$lock\n$suspend\n$hibernate\n$shutdown\n$reboot\n$logout"
optnum=$(echo -e "$options" | wc -l)

chosen="$(echo -e "$options" | $rofi_command -lines $optnum -i\
    -p "Uptime: $uptime" -dmenu)"
case $chosen in
    $shutdown)
        ans=$(eval "$confirm_command")
        ans=$(echo $ans | awk '{print tolower($0)}')
        if [[ $ans == "yes" ]] || [[ $ans == "y" ]]; then
        systemctl poweroff
        elif [[ $ans == "no" ]] || [[ $ans == "n" ]]; then
        exit
        else
        rofi -e "Available Options  -  yes / y / no / n"
        fi
        ;;
    $reboot)
        ans=$(eval "$confirm_command")
        ans=$(echo $ans | awk '{print tolower($0)}')
        if [[ $ans == "yes" ]] || [[ $ans == "y" ]]; then
        systemctl reboot
        elif [[ $ans == "no" ]] || [[ $ans == "n" ]]; then
        exit
        else
        rofi -e "Available Options  -  yes / y / no / n"
        fi
        ;;
    $lock)
        ~/.lock.sh >&2 /dev/null
        ;;
    $suspend)
        ans=$(eval "$confirm_command")
        ans=$(echo $ans | awk '{print tolower($0)}')
        if [[ $ans == "yes" ]] || [[ $ans == "y" ]]; then
        mpc -q pause >&2 /dev/null
        systemctl suspend
        elif [[ $ans == "no" ]] || [[ $ans == "n" ]]; then
        exit
        else
        rofi -e "Available Options  -  yes / y / no / n"
        fi
        ;;
    $hibernate)
        ans=$(eval "$confirm_command")
        ans=$(echo $ans | awk '{print tolower($0)}')
        if [[ $ans == "yes" ]] || [[ $ans == "y" ]]; then
        mpc -q pause >&2 /dev/null
        systemctl hibernate
        elif [[ $ans == "no" ]] || [[ $ans == "n" ]]; then
        exit
        else
        rofi -e "Available Options  -  yes / y / no / n"
        fi
        ;;
    $logout)
        ans=$(eval "$confirm_command")
        ans=$(echo $ans | awk '{print tolower($0)}')
        if [[ $ans == "yes" ]] || [[ $ans == "y" ]]; then
        bspc quit
        elif [[ $ans == "no" ]] || [[ $ans == "n" ]]; then
        exit
        else
        rofi -e "Available Options  -  yes / y / no / n"
        fi
        ;;
esac
