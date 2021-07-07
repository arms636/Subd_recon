# Subd_recon
This tool is created as a part of learning shell scripting, now I am making various changes to make it a better tool which can be used to collect various information of a website.

# Current features
- can collect subdomains of a website
- can test alive subdomains
- can sort out these subdomains
- can check for clickjacking vulnerability

# Requirements
Follow the installtion steps
- Go Language  - https://tzusec.com/how-to-install-golang-in-kali-linux/

- Assetfinder
```
go get -u github.com/tomnomnom/assetfinder
```

# Installation
```
$ git clone https://github.com/arms636/Subd_recon.git
$ cd Subd_recon
$ chmod 755 subd_recon.sh
$ ./subd_recon.sh
```
# To Chech Clickjacking vulnerability
```
$ cd Subd_recon
$ chmod 755 clickjacking.sh
$ ./clickjacking.sh
```
