## Update
```bash
sudo apt update
sudo apt upgrade
```

## Rename User
```bash
sudo usermod -l www -d /home/www -m ubuntu
sudo groupmod -n www ubuntu
sudo chfn -f "www" www
sudo gpasswd -d www sudo
```

## Change pass
```bash
sudo passwd www
```

## Install program
```bash
sudo apt install -y zsh supervisor
```

## Install nginx
```bash
sudo apt install -y nginx
```

```bash
sudo nano /etc/nginx/nginx.conf
```

```
user www;
```

```bash
sudo systemctl restart nginx.service
```

## Install MySQL
```bash
sudo apt install -y mysql-server
sudo systemctl start mysql.service
sudo systemctl enable mysql.service
```

### Disable bin lock
```bash
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```

```
[mysqld]
skip-log-bin
```

```bash
sudo systemctl restart mysql
```

### Create admin user
```bash
sudo mysql
```

```sql
CREATE USER 'admin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'adminpassword';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
CREATE USER 'admin'@'%' IDENTIFIED WITH mysql_native_password BY 'adminpassword';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

## Install php
```bash
sudo add-apt-repository ppa:ondrej/php
sudo apt install php8.2-cli php8.2-fpm php8.2-curl php8.2-mysql php8.2-mbstring php8.2-xml zip unzip php8.2-zip php8.2-gd
```

## Create work dir
```bash
sudo mkdir /www
sudo chown www:www /www
```

## Install zsh
```bash
sudo apt install zsh
su - www
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

## Install nvm, nodejs
```bash
su - www
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Exit and login again.
exit
su - www

# Install node 22.04
nvm install 22

# Install yarn pm2
npm install -g yarn pm2

# Start pm2 on startup
pm2 startup
# Copy command and run as root
```
