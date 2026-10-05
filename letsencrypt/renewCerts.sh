#!/bin/bash

sudo service apache2 stop; 
sudo certbot renew; 
sudo service apache2 start;
sudo service postfix restart;
sudo service dovecot restart;
sudo service opendkim restart;
sudo service opendmarc restart;