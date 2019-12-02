set -e
if [[ -n $THEME ]]; then
	echo "Setting theme $THEME."
	# Set theme
	jt -t $THEME -fs 95 -altp -tfs 11 -nfs 115 -cellw 88% -T -N
else
	echo "No theme specified, resetting jupyter theme."
  	jt -r
fi
cd $WORKDIR
jupyter notebook --ip=0.0.0.0 --no-browser
