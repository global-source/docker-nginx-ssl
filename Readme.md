## Ubuntu + Nginx + SSL

---

[![Packagist](https://shields.io/badge/ubuntu-18.04+-blue?logo=ubuntu&style=plastic)](https://github.com/global-source/javascript_form_validator) [![Packagist](https://shields.io/badge/docker-Done-blue?logo=docker&style=plastic)](https://github.com/global-source/javascript_form_validator) [![Packagist](https://shields.io/badge/nginx-Done-blue?logo=nginx&style=plastic)](https://github.com/global-source/javascript_form_validator) [![Packagist](https://shields.io/badge/Let's_Enctype-Done-blue?logo=letsencrypt&style=plastic)](https://github.com/global-source/javascript_form_validator)

### SSL Setup with Lets Encrypt

- This example is for Multi Domain SSL Setup.
- If you are planning for single domain, you can ignore 2nd docker/domain.

#### Step: 1

##### Dependancy for SSL
``` $ apt update ```

``` $ apt install certbot python3-certbot-nginx ```

##### Create Network

`$ docker network create web`

#### Step: 2

##### Build docker image
``` docker build -t my-docker-app . ```

``` docker build -t my-docker-app2 . ```

##### Run Docker images with domain name and use the same in nginx.conf
``` docker run -d --name domain1.com --network web my-docker-app ```

``` docker run -d --name domain2.com --network web my-docker-app2 ```

##### Create LetsEncrypt SSL Certificate

`$ certbot -d domain1.com -d domain2.com`

#### Config the Nginx

- Update the **env.sh** with your data
  `$ bash env.sh`

##### Command to Run Nginx

`$ docker run --name nginx --network web -p 80:80 -p 443:443 -v ./nginx.conf:/etc/nginx/nginx.conf -v /etc/letsencrypt/:/etc/letsencrypt/ nginx`

###### Note:\*

- 1. Update the domain name as per the image name
- 2. Update the (SSL) certificate and key file location
- 3. Mount nginx.conf and letsencrypt as virtual dir
- 4. Test Image: shankarthiyagu/hello-world
