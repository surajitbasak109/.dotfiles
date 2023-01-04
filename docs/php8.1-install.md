# PHP 8.1 Install Steps on Ubuntu
To install php 8.1 on ubuntu we need add third party repository in our system. After that we can update our package repository.

```bash
sudo add-apt-repository ppa:ondrej/php
```

The system will update package repository after running the above command.

Then we can run following command to install php8.1.

```bash
sudo apt install php8.1
```

## Install following php extensions
```bash
sudo apt install php8.1-curl php8.1-simplexml php8.1-bcmath php8.1-zip php8.1-gd php8.1-redis php8.1-mysql php8.1-mbstring
```
