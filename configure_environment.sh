PAT=$1;
mkdir azagent;
cd azagent;
curl -fkSL -o vstsagent.tar.gz https://vstsagentpackage.azureedge.net/agent/3.232.1/vsts-agent-linux-x64-3.232.1.tar.gz;
tar -zxvf vstsagent.tar.gz;
if [ -x "$(command -v systemctl)" ];
then ./config.sh --environment --environmentname "CI-CD Servers" --acceptteeeula --agent $HOSTNAME --url https://dev.azure.com/TCRK/ --work _work --projectname 'Homelab - Infrastructure' --auth PAT --token $PAT --runasservice;
sudo ./svc.sh install; 
sudo ./svc.sh start;
else ./config.sh --environment --environmentname "CI-CD Servers" --acceptteeeula --agent $HOSTNAME --url https://dev.azure.com/TCRK/ --work _work --projectname 'Homelab - Infrastructure' --auth PAT --token $PAT;
./run.sh; 
fi