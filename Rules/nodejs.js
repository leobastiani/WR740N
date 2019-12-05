function curl(start_port, end_port, protocol) {
    console.log (`curl "http://192.168.0.1/userRpm/QoSRuleListRpm.htm?enable=true&start_ip_addr=192.168.0.2&end_ip_addr=192.168.0.254&start_port=${start_port}&end_port=${end_port}&protocol=${protocol == 'TCP' ? '1' : '2'}&min_up_band_width=0&max_up_band_width=1000&min_down_band_width=0&max_down_band_width=2000&Save=Salvar&curEditId=0&Page=1" -H 'Connection: keep-alive' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'Authorization: Basic YWRtaW46YWRtaW4=' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'Referer: http://192.168.0.1/userRpm/QoSRuleCfgRpm.htm?Add=Add&Page=1' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.9' -H 'Cookie: sessionToken=2002855936; Authorization=' --insecure`)
}

function fill(arr, protocol) {
    arr = [[0, 0], ...arr, [65536]];
    for(var i=0; i<arr.length - 1; i++) {
        let atual = arr[i]
        let prox = arr[i+1];
        curl(atual[1]+1, prox[0]-1, protocol)
    }
}

curl(1, 2098, 'TCP')
curl(2100, 5221, 'TCP')
curl(5224, 8087, 'TCP')
curl(8089, 8392, 'TCP')
curl(8401, 65535, 'TCP')

curl(1, 4999, 'UDP')
curl(5501, 8087, 'UDP')
curl(8089, 65535, 'UDP')
