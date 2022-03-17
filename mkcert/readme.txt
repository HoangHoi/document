# Move to Folder
/usr/local/bin

# install ubuntu
sudo apt install libnss3-tools

# Install trusted CA
mkcert -install

# Make certificate
mkcert example.com 

# Look for the rootCA.pem file
mkcert -CAROOT

