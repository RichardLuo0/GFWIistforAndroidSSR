file_name=gfwlist.acl
times=1
timeout=3
proxy_port=12333
row=1
echo "请确定已经打开全局代理"
export http_proxy="http://127.0.0.1:$proxy_port"
export https_proxy="http://127.0.0.1:$proxy_port"
rows=$(grep ^\^ $file_name | wc -l)
grep ^\^ $file_name | while read line
do
	url=$(echo $line | sed "s/^.\{7\}//" | sed "s/\$$//")
	echo "$row/$rows"
	ping_result=$(ping -c $times -W $timeout $url | sed -n "/ms$/p")
	if echo $ping_result | grep ", 0% packet"
	then
		ping_time=$(echo $ping_result | sed "s/.*\/\(.*\)\/.*/\1/")
		echo "$url $ping_time ms" >> NoNeedToProxy.txt
	else
		echo "$url need proxy"
		result_code=`curl -I -m $timeout -o /dev/null -s -w %{http_code} -L $url`
		if [ $result_code -ne 200 ]
		then
			echo "$url $result_code" >> fail.txt
		fi
	fi
	((row++))
done
