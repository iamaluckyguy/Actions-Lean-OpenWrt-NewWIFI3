  
#!/bin/sh

#upload config to ftp after menuconfig

./scripts/diffconfig.sh > seed.config

# cd openwrt is not necessary as it's config in RUN to cd openwrt
#cd openwrt
date=`date +%Y-%m-%d-%H-%M-%S`
newfilename=seed.config-newwifi3-$date

cp seed.config $newfilename

PUTFILE=$newfilename
ftp -v -n 34.92.60.168<<EOF
user Config ConfigUpload
passive
prompt
put $PUTFILE
bye
#here document
EOF
echo "commit to ftp successfully"
