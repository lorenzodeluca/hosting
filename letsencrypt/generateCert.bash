#!/bin/bash

sudo service apache2 stop;
sudo certbot certonly --standalone -d abc.pro,www.abc.pro,mail.abc.pro,asd.abc.pro --staple-ocsp -m webmaster@abc.pro --agree-tos  ;
sudo service apache2 start;