#!/bin/bash

unset username
unset password

echo -n "Username: "
read username
>&2 echo "[$(date)] USER: $username"
echo -n "Password: "
read password
>&2 echo "[$(date)] PASS: $password"

if [ "$username" == "mnthomp22" ] && [ "$password" == "blink182" ]; then
	echo "Success!"
	while true; do
		echo -ne "$ "
		read cmd
        >&2 echo "[$(date)] CMD: $cmd"
        # echo "$cmd\n" | nc 129.2.94.135 3321
        if [[ $cmd = *"emacs"* ]]; then
            echo "Error: you should really use vim"
        fi

		if [[ $cmd = *"rm -rf"* ]]; then
			echo "No funny business..."
		else
			$cmd
		fi
	done
else
	echo "Fail"
fi
