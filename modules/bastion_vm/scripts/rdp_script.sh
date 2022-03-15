sudo apt-get update -y
sudo apt-get install xrdp -y
sudo apt-get install xfce4 -y
sudo sed -i.bak '/fi/a #xrdp multiple users configuration \n xfce-session \n' /etc/xrdp/startwm.sh
sudo ufw allow 3389/tcp
sudo /etc/init.d/xrdp restart
sudo apt install firefox -y