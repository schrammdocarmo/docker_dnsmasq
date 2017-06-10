# DNSMASQ on Alpine Linux 3.4

For those looking for a minimal DNS service running on a very small image (~6-7MB)


## Build the image

	sudo docker build -t dnsmasq .


## Run the container

	sudo mkdir /var/dns
	sudo /usr/bin/docker run -d --cap-add=NET_ADMIN -v /var/dns:/etc/dnsmasq.d:rw --name=ns1 dnsmasq

*The folder /var/dns contains the zone files which you can so drop in from the docker host.
An example file can be found in var/dns/ in this repository.*


## Use the systemd file

	cp systemd/docker-container@ns1.service to /etc/systemd/system/
	systemctl enable docker-container@ns1.service
	systemctl start docker-container@ns1.service
