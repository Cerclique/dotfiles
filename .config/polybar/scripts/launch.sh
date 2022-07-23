#!/usr/bin/env bash

killall -9 polybar

echo "---" | tee -a /tmp/polybar_top.log /tmp/polybar_bot.log

polybar bar_top 2>&1 | tee -a /tmp/polybar_top.log & disown
polybar bar_bot 2>&1 | tee -a /tmp/polybar_bot.log & disown
