import requests, os, sys
from requests.exceptions import HTTPError

while True :

    response = requests.get('https://api.masternetwork.dev/FRPCdemand/'+ sys.argv[1])
    response.raise_for_status()
    # access JSOn content
    jsonResponse = response.json()
    content = jsonResponse["content"]
    file_path = "/var/mydir/frp/frp_0.42.0_linux_amd64/frpc.ini"
    os.remove(file_path)
    f = open(file_path, "w")
    f.write(content)
    f.close()
    os.system("cd /var/mydir/frp/frp_0.42.0_linux_amd64/ && ./frpc -c ./frpc.ini")
    time.sleep(180)

