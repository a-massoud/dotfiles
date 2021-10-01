#!/bin/bash

pkill -SIGUSR1 dunst

i3lock -nk \
       --pass-screen-keys \
       --color=282a36 \
       --insidever-color=282a36 \
       --insidewrong-color=282a36 \
       --inside-color=282a36 \
       --ring-color=44475a \
       --ringver-color=44475a \
       --ringwrong-color=44475a \
       --line-color=00000000 \
       --keyhl-color=6272a4 \
       --bshl-color=6272a4 \
       --separator-color=00000000 \
       --time-color=f8f8f2 \
       --date-color=f8f8f2 \
       --verif-color=f8f8f2 \
       --wrong-color=f8f8f2 \
       --layout-color=f8f8f2 \
       --time-font=NotoSans-Regular \
       --time-size=24 \
       --date-font=NotoSans-Regular \
       --date-size=24 \
       --layout-font=NotoSans-Regular \
       --layout-size=24 \
       --verif-font=NotoSans-Regular \
       --verif-size=24 \
       --wrong-font=NotoSans-Regular \
       --wrong-size=24 \
       --time-str="%T" \
       --date-str="%Y-%m-%0d" \
       --wrong-text="wrong" \
       --radius=100

pkill -SIGUSR2 dunst
