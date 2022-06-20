#git clone https://github.com/Masternetworks/masternetwork_client.git
cd masternetwork_client
while true
do
GP=$(git pull)

if [[ $GP = "Already up to date." ]]; then
    
    sudo ./x86_linux &
    MyPID=$!                  
    sleep 2m 30s
else
kill $MyPID 
sudo ./x86_linux &
MyPID=$!
echo "UPDATED DONE"
fi
done 

