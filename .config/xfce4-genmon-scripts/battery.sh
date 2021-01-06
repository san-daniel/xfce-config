readonly BATTERY=$(awk '{print $1}' /sys/class/power_supply/BAT*/capacity)
echo  "<txt><span  font_desc = 'Hack Nerd Font   10' fgcolor='#DF8429'>"" ${BATTERY}% ""</span></txt>"




