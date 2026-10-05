#!/bin/bash
DOMAINS=("abc.it" "cdf.com" ) 
for DOMAIN in "${DOMAINS[@]}"; 
do
    echo "fixing: $DOMAIN" 
LIVE_DIR="/etc/letsencrypt/live/$DOMAIN" 
    ARCHIVE_DIR="/etc/letsencrypt/archive/$DOMAIN" 
if [ -d "$ARCHIVE_DIR"     ]; then
        # find last cert version
        LATEST_CERT=$(ls -v $ARCHIVE_DIR/cert*.pem | tail -n 1 | xargs basename) 
LATEST_PRIVKEY=$(ls -v $ARCHIVE_DIR/privkey*.pem | tail -n 1 | xargs basename) 
LATEST_CHAIN=$(ls -v $ARCHIVE_DIR/chain*.pem | tail -n 1 | xargs basename)
        LATEST_FULLCHAIN=$(ls -v $ARCHIVE_DIR/fullchain*.pem | tail -n 1 | xargs basename)
        # delete old symlinks from live
        rm -f $LIVE_DIR/*.pem
        # create new symlinks
        ln -s "../../archive/$DOMAIN/$LATEST_CERT" "$LIVE_DIR/cert.pem" ln 
        -s "../../archive/$DOMAIN/$LATEST_PRIVKEY" "$LIVE_DIR/privkey.pem" 
        ln -s "../../archive/$DOMAIN/$LATEST_CHAIN" "$LIVE_DIR/chain.pem" 
        ln -s "../../archive/$DOMAIN/$LATEST_FULLCHAIN" "$LIVE_DIR/fullchain.pem"
        
        echo " symlink for $DOMAIN restored(referring to $LATEST_CERT)" 
    else
        echo "Error: dir for $DOMAIN not found!" 
    fi
done