#!/bin/bash

export DOMAIN1=Yourdomain.com
export DOMAIN2=Yourdomain2.com

cat nginx.conf | sed -i.bak "s/sub1.example.in/${DOMAIN1}/g" nginx.conf
cat nginx.conf | sed -i.bak "s/sub2.example.in/${DOMAIN2}/g" nginx.conf