#/bin/bash
#Bash Final Assignment TUESDAY Morning Class
#Script created by Gagandeep Kaur
#Student ID:200359661
#This script implements the task in the bash final Assignment
#Declare variables and assign any default values.

defaultvalue="yes"
#using the command line for getting requested outputs and narrow down the output field
function usablecmds {
  echo "
  $0 [-h | --help]
  $0 [-dh | --domain and host name]
  $0 [-os | --operating system name]
  $0 [-ip | --ip address]
  $0 [-ov | --operating system version]
  $0 [-c | --CPU information]
  $0 [-r | -- installed memory]
  $0 [-ad | --available disk space on physical device]
  $0 [-lp | --installed printers list]
  "
}
function errors {
  echo "$@" >&2
}
#use the command line option to get outputs easily.
while [ $# -gt 0 ]; do
  case "$1" in
  -h|--help)
  usablecmds
  defaultvalue="no"
  ;;
 -dh)
  hostanddomaininfo="yes"
  defaultvalue="no"
  ;;
 -os)
  operatingsysteminfo="yes"
  defaultvalue="no"
  ;;
  -ip)
  ipaddressinfo="yes"
  defaultvalue="no"
  ;;
  -ov)
  operatingsystemversioninfo="yes"
  defaultvalue="no"
  ;;
  -c)
  CPUinfo="yes"
  defaultvalue="no"
  ;;
  -r)
  installedmemoryinfo="yes"
  defaultvalue="no"
  ;;
  -ad)
  availablediskspaceinfo="yes"
  defaultvalue="no"
  ;;
  -lp)
  installedprinterlistinfo="yes"
  defaultvalue="no"
  ;;
  *)
  errors "
  '$1' wrong entry"
  exit 1
  ;;
esac
shift
done
#variables that have informations
operatingsysteminfo="$(grep domain /etc/os-release |sed -e 's/.*=//' -e 's/"//g')"

domainname="$(grep Domain /etc/os-release |sed -e 's/.*=//' -e 's/"//g')"

operatingsystemversion="$(grep Domain /etc/os-release |sed -e 's/.*=//' -e 's/"//g')"

ipaddress="$(hostname -I)"

CPUinfo="$(cat /proc/cpuinfo | grep 'model name' | uniq)"

RAMinfo="$(free -m | awk '/^Mem:/{print $2}')"

diskinfo="$(df -m /tmp | tail -1 | awk '{print $4}')"

printerinfo="$(lpstat -p | awk '{print $2}')"

# Outputs

#  Host name/Domain Name Details
hostnameinfodone="
##################################
Hostname: $Systemname
##################################
Domain Name: $domainname
##################################
"

# IP Details
ipaddressinfodone="
##################################
IP Address: $ipaddress
##################################
"
# OS Details
osdetailsdone="
##################################
Operating System: $OSname
##################################
"
# OS Version
osversiondone="
##################################
Operating System Version: $OSversion
##################################
"
# CPU Information
cpudetailsdone="
##################################
CPU Information: $CPUdetails
##################################
"
# RAM Details
ramdetailsdone="
##################################
RAM Information: $RAMinfo
##################################
"
# Disc Space Details
discdetailsdone="
##################################
DISC Information: $discspace
##################################
"
# Printer Details
printerdetailsdone="
##################################
Installed Printer Information: $printerinformation
##################################
"

#  Outputs

if [ "$defaultvalue" = "yes" -o "$hostanddomaininfo" = "yes" ]; then
  echo "$hostnameinfodone"
fi
if [ "$defaultvalue" = "yes" -o "$ipaddressinfo" = "yes" ]; then
  echo "$ipaddressinfodone"
fi
if [ "$defaultvalue" = "yes" -o "$operatingsysteminfo" = "yes" ]; then
  echo "$osdetailsdone"
fi
if [ "$defaultvalue" = "yes" -o "$operatingsystemversioninfo" = "yes" ]; then
  echo "$osversiondone"
fi
if [ "$defaultvalue" = "yes" -o "$CPUinfo" = "yes" ]; then
  echo "$cpudetailsdone"
fi
if [ "$defaultvalue" = "yes" -o "$installedmemoryinfo" = "yes" ]; then
  echo "$ramdetailsdone"
fi
if [ "$defaultvalue" = "yes" -o "$availablediskspaceinfo" = "yes" ]; then
  echo "$discdetailsdone"
fi
if [ "$defaultvalue" = "yes" -o "$installedprinterlistinfo" = "yes" ]; then
  echo "$printerdetailsdone"
fi
if [ "$defaultvalue" = "yes" -o "$swboy" = "yes" ]; then
  echo "$softwaredetailsdone"
fi

echo -----END OF THE SCRIPT-----
