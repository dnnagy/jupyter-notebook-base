if [[ -n $THEME ]]; then
  jt -t $THEME -fs 95 -altp -tfs 11 -nfs 115 -cellw 88% -T -N
fi
jupyter notebook --ip=0.0.0.0 --no-browser
