# Description: This script is used to connect to the VPN, passing a cookie in argument
# The cookie is provided by the web browser when you'll be connected through SSO : SVPNCOOKIE:"yourlongandverysecretcookie"
# Fill in your config file and save it at /etc/openfortivpn/my-config (or wherever you want)
# Openfortivpn is required : https://github.com/adrienverge/openfortivpn

#Variables
config_path="/etc/openfortivpn/my-config"

# Check if the cookie is provided
if [ -z "$1" ]
then
    echo "No cookie provided"
    exit 1
fi

# Check if the cookie is a SVPNCOOKIE
if [[ $1 != SVPNCOOKIE:* ]]
then
    echo "The cookie is not in a SVPNCOOKIE format"
    exit 1
fi

# Remove the SVPNCOOKIE: at the beginning
cookie=$(echo $1 | sed 's/SVPNCOOKIE://g')

# Launch the VPN
openfortivpn -c $config_path --cookie $cookie