#!/bin/bash

pkill -SIGUSR1 dunst

i3lock -nk \
       --pass-screen-keys \
       --color=282a36 \
       --insidevercolor=282a36 \
       --insidewrongcolor=282a36 \
       --insidecolor=282a36 \
       --ringcolor=44475a \
       --ringvercolor=44475a \
       --ringwrongcolor=44475a \
       --linecolor=00000000 \
       --keyhlcolor=6272a4 \
       --bshlcolor=6272a4 \
       --separatorcolor=00000000 \
       --timecolor=f8f8f2 \
       --datecolor=f8f8f2 \
       --verifcolor=f8f8f2 \
       --wrongcolor=f8f8f2 \
       --layoutcolor=f8f8f2 \
       --time-font=NotoSans-Regular \
       --timesize=24 \
       --date-font=NotoSans-Regular \
       --datesize=24 \
       --layout-font=NotoSans-Regular \
       --layoutsize=24 \
       --verif-font=NotoSans-Regular \
       --verifsize=24 \
       --wrong-font=NotoSans-Regular \
       --wrongsize=24 \
       --timestr="%T" \
       --datestr="%Y-%m-%0d" \
       --wrongtext="wrong" \
       --radius=100

pkill -SIGUSR2 dunst
