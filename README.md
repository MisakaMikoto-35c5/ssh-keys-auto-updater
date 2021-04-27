# ssh-keys-auto-updater

## Installation

Step 1: Download install script and run it.

```
wget -O /tmp/install.sh https://github.com/MisakaMikoto-35c5/ssh-keys-auto-updater/raw/master/install.sh
bash /tmp/install.sh
```

Step 2: Change public keys update url

```
echo https://www.example.com/your_ssh_public.keys > ~/.ssh/ssh_keys_update_url
chomd 600 ~/.ssh/ssh_keys_update_url
```

Step 3: Run script

```
~/.ssh/update-keys.sh
cat ~/.ssh/authorized_keys
```

Step 4: Add following line script to crontab

```
1 */12 * * * /bin/bash ~/.ssh/update-keys.sh
```

Recommend: Install md5sum

```
sudo apt install md5sum
```