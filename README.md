# Keepalived and Nginx High Availability Setup

This project sets up a high-availability (HA) environment using Docker containers. It includes:
- 2 Nginx containers acting as load balancers.
- 3 Apache containers acting as web servers.
- 2 Keepalived containers for high availability.

## Files

- **backup.sh**: Script to run when the instance transitions to BACKUP state.
- **backup2.sh**: Script for the second VIP BACKUP state.
- **Dockerfile**: Dockerfile to build the Keepalived container.
- **keepalived.conf**: Configuration for Keepalived.
- **master.sh**: Script to run when the instance transitions to MASTER state.
- **master2.sh**: Script for the second VIP MASTER state.
- **nginx1.conf**: Configuration for the first Nginx instance.
- **nginx2.conf**: Configuration for the second Nginx instance.
- **updateconf.sh**: Script to update Keepalived configuration based on environment variables.

## Usage

### Building the Docker Image

```sh
docker build -t mykeepalived .

##Running the Docker Container
docker run -d --name keepalived1 --net=host mykeepalived
docker run -d --name keepalived2 --net=host mykeepalived

#Ensure to set the environment variables appropriately for each instance
##Environment Variables
KP_STATE_1: State for the first instance (MASTER/BACKUP)
KP_PRIORITY_1: Priority for the first instance
VRRP_INSTANCE_1: VRRP instance name for the first instance
VIRTUAL_ROUTER_ID_1: Virtual Router ID for the first instance
VIRTUAL_IPADDRESS_1: Virtual IP address for the first instance
KP_STATE_2: State for the second instance (MASTER/BACKUP)
KP_PRIORITY_2: Priority for the second instance
VRRP_INSTANCE_2: VRRP instance name for the second instance
VIRTUAL_ROUTER_ID_2: Virtual Router ID for the second instance
VIRTUAL_IPADDRESS_2: Virtual IP address for the second instance
