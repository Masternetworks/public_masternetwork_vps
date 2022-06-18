import requests, os, sys
from requests.exceptions import HTTPError

try:
    response = requests.get('https://api.masternetwork.dev/FRPCdemand/'+ sys.argv[1])
    response.raise_for_status()
    # access JSOn content
    jsonResponse = response.json()
    content = jsonResponse["content"]

    file_path = "/var/mydir/frp/frp_0.42.0_linux_amd64/frpc.ini"
    with open(file_path, "r") as txt_file:
        current_content =  txt_file.readlines()
    if content != current_content :
        print("different")
        print(content)
    if content != current_content :
        os.remove(file_path)
        f = open(file_path, "w")
        f.write(content)
        f.close()
        os.system("cd /var/mydir/frp/frp_0.42.0_linux_amd64/ && ./frpc reload -c ./var/mydir/frp/frp_0.42.0_linux_amd64/frpc.ini")
    else :
        quit()

except HTTPError as http_err:
    print(f'HTTP error occurred: {http_err}')
except Exception as err:
    print(f'Other error occurred: {err}')
