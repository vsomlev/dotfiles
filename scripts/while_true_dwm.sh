while true; do
    # Log stderror to a file 
    /home/uibxn/.Scripts/run_statusbar.sh &
    dwm 2> ~/.dwm.log
done
