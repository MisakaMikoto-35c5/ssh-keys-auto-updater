#!/bin/bash

# Save this script to ~/.ssh/update-keys.sh
# and add following line to your crontab:
# 1 */12 * * * /bin/bash ~/.ssh/update-keys.sh
# It will update your keys from GitHub every 12 hours to your account.

SSH_DIR=~/.ssh
KEYS_UPDATE_URL=`cat $SSH_DIR/ssh_keys_update_url`
TMP_FILE=/tmp/ssh_keys_auto_update_`whoami`.tmp
PARMANENT_REMOTE_FILE=~/.ssh/github_authorized_keys

MD5SUM=`which md5sum`
NEED_UPDATE=0

touch $TMP_FILE
touch $PARMANENT_REMOTE_FILE

chmod 600 $TMP_FILE
chmod 600 $PARMANENT_REMOTE_FILE
chmod 600 $SSH_DIR/authorized_keys_base
chmod 644 $SSH_DIR/authorized_keys

curl $KEYS_UPDATE_URL > $TMP_FILE

update_keys() {
	chmod 600 $PARMANENT_REMOTE_FILE
	cat $TMP_FILE > $PARMANENT_REMOTE_FILE
	cat $SSH_DIR/authorized_keys_base > $SSH_DIR/authorized_keys
	cat $PARMANENT_REMOTE_FILE >> $SSH_DIR/authorized_keys
}

if [ -n "$MD5SUM" ]; then
	TMP_FILE_MD5=`cat $TMP_FILE | $MD5SUM`
	PARMANENT_FILE_MD5=`cat $PARMANENT_REMOTE_FILE | $MD5SUM`
	if [ "$TMP_FILE_MD5" = "$PARMANENT_FILE_MD5" ]; then
		exit 0
	else
		update_keys
	fi
fi