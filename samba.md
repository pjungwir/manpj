# Show the CIFS shares available on a remote server:
smbclient -L //freenas -U paul

# Browse a remote CIFS share (sort of like ftp or ssh):
smbclient //freenas/nas -U paul

# Mount a remote CIFS share:
sudo apt-get install cifs-utils smbfs
mount -t cifs //freenas/nas /mnt/freenas -o username=paul,password=foo,iocharset=utf8,rw,sec=ntlm,uid=paul,gid=paul,forceuid=paul,forcegid=paul

# or with a credentials file:
mount -t cifs //freenas/nas /mnt/freenas -o credentials=/home/paul/.smbcredentials,iocharset=utf8,rw,sec=ntlm,uid=paul,gid=paul,forceuid=paul,forcegid=paul



