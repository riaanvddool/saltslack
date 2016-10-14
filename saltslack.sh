#!/bin/bash

# prepare to fetch the minion states
touch /tmp/minions_up
mv /tmp/minions_up /tmp/minions_up.prev

# get a list of minions that are up according to "salt-run manage.up"
salt-run -l error manage.up | cut -c 2- | sort > /tmp/minions_up

# determine what has changed since the previous run
comm -13 /tmp/minions_up.prev /tmp/minions_up > /tmp/minions_up_was_down
comm -23 /tmp/minions_up.prev /tmp/minions_up > /tmp/minions_down_was_up

# post to slack if minions came up
if [ -s /tmp/minions_up_was_down ]
then
  echo "$(cat /tmp/minions_up_was_down | wc -l) minions came up:" | cat - /tmp/minions_up_was_down
fi

# post to slack if minions went down
if [ -s /tmp/minions_down_was_up ]
then
  echo "$(cat /tmp/minions_down_was_up | wc -l) minions went down:" | cat - /tmp/minions_down_was_up
fi
