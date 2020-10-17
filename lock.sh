#!/bin/bash

pkill -SIGUSR1 dunst

i3lock -nk \
       --pass-screen-keys \
       --color=383c4a \
       --insidevercolor=383c4a \
       --insidewrongcolor=383c4a \
       --insidecolor=383c4a \
       --ringcolor=2c2f3a \
       --ringvercolor=2c2f3a \
       --ringwrongcolor=2c2f3a \
       --linecolor=00000000 \
       --keyhlcolor=d3dae3 \
       --bshlcolor=d3dae3 \
       --separatorcolor=00000000 \
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
