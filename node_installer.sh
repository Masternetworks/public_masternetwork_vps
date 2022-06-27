git clone https://github.com/Masternetworks/masternetwork_client.git
cd masternetwork_client
while true
do
GP=$(git pull)

if [[ $GP = "Already up to date." ]]; then
    
    sudo ./86_linux -apikey MYKEYFROMmasternetwork.api -ram 8000 -vcpus 2 -storage 85 -nodename Sunlight &
    MyPID=$!                  
    sleep 2m 30s
else
kill $MyPID 
sudo ./86_linux -apikey MYKEYFROMmasternetwork.api -ram 8000 -vcpus 2 -storage 85 -nodename Sunlight &
MyPID=$!
echo "UPDATED DONE"
fi
done 

