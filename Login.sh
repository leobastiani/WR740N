gateway=`cat gateway.txt`

curl 'http://'$gateway'/userRpm/LoginRpm.htm?Save=Save' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: pt-BR,pt;q=0.8' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Referer: http://'$gateway'/' -H 'Cookie: Authorization=Basic%20YWRtaW46MjEyMzJmMjk3YTU3YTVhNzQzODk0YTBlNGE4MDFmYzM%3D' -H 'Connection: keep-alive' -o login.txt

if ! grep userRpm login.txt; then
	bash Login.sh
fi