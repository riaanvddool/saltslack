SaltSlack
=========

Configure a cron job to notify you via Slack.com when your SaltStack.com minions come up or go down.

Example
-------

```
4 minions came up:
 dave
 stuart
 jerry
 jorge 
```

```
2 minions went down:
 kevin
 bob
```

Requirements
------------

*slacktee* uses [curl](http://curl.haxx.se/) command to communicate with Slack.

```
# Clone slacktee git repository
git clone https://github.com/course-hero/slacktee.git

# Install slacktee.sh
# (install.sh copies slacktee.sh in `/usr/local/bin` and sets executable permission)
bash ./slacktee/install.sh
```

Configure crond
---------------

```
cp saltslack.cron /etc/cron.d/saltslack
cp saltslack.sh /etc/cron.d/saltslack.sh
cp slacktee.conf.example /etc/cron.d/slacktee.conf
```

Slacktee configuration (/etc/cron.d/slacktee.conf)
--------------------------------------------------

1. Get a slack web API auth token at https://api.slack.com/docs/oauth-test-tokens
2. Get an incoming webhook url for your slack channel: https://my.slack.com/services/new/incoming-webhook/

