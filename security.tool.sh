function password {
	size=$1
	if [ -z "$size" ]; then
		size=16
	fi
	pass=$(openssl rand -base64 $size)
	result=${pass/%??/}
	echo $result
}
