#!/bin/sh

# create share directory
mkdir /media/share
chmod 0777 /media/share

# create user
adduser -D "$USER_NAME"
echo "$USER_NAME:$USER_PASSWORD" | chpasswd
(echo "$USER_PASSWORD"; sleep 1; echo "$USER_PASSWORD") | smbpasswd -s -a "$USER_NAME"

# create smb.conf
cat > /etc/samba/smb.conf <<EOL
[global]
#to allow symlinks from everywhere
#allow insecure wide links = yes
workgroup = WORKGROUP
dos charset = cp866
unix charset = utf-8
force user = $USER_NAME

[$SHARE_NAME]
# to follow symlinks
follow symlinks = yes  
# to allow symlinks from outside
#wide links = yes       
browseable = yes
writeable = yes
path = /media/share
EOL

echo "Running Samba Server"
smbd \
    --interactive \
    --foreground