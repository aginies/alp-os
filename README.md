
# Goal

This is a **WRAPPER** script to test some **[ALP OS](https://github.com/aginies/alp-os#official-documentation)** workload.
**ALP** is a SUSE lightweight operating system. Instead of applications 
distributed in traditional software packages, it runs 
containerized and virtualized workloads.

This script doesnt remove the container or stop the workload, its just
a wrapper to quickly launch your workload. It provides some help guidance
in case of issue.

![image](https://github.com/aginies/alp-os/blob/53b0e807fa649cba70abb81b3ca85cd60d8f97ef/alp_OS_SUSE.gif)

# Usage

First arg should be the workload to start.

`demo_start_workload [kvm|yast|cockpit|grafana|firewalld|virtm|help]`

# Workloads available currently

* kvm: Prepare system to deploy Virtual Machine
* yast: Manage you host OS (console)
* yastqt: Manage you host OS (GUI)
* virtm: Manage Virtual Machine
* cockpit: Manage you host OS (Web)
   * https://HOSTNAME_OR_IP_OF_ALP_HOST:9090
* grafana: Monitoring System
   * https://HOSTNAME_OR_IP_OF_ALP_HOST:3000
* firewalld

# Install the wrapper script on ALP OS 

## Host OS

You should use [SLE Micro](https://www.suse.com/products/micro/), [MicroOS]([https://microos.opensuse.org/) or an [ALP OS](https://download.opensuse.org/repositories/SUSE:/ALP:/PUBLISH/images/) to use this script.
SLE OS is not providing **nmcli** or **cockpit-bridge** byt default.

## With podman
```
podman container runlabel install registry.opensuse.org/home/aginies/branches/opensuse/templates/images/tumbleweed/containers/suse/alp/workloads/demo:latest
```

If you have a previous installation just remove the container in cache:
```
podman rmi registry.opensuse.org/home/aginies/branches/opensuse/templates/images/tumbleweed/containers/suse/alp/workloads/demo:latest
```

## Just grab the script

```bash
wget https://raw.githubusercontent.com/aginies/alp-os/main/demo_start_workload
chmod 755 demo_start_workload
./demo_start_workload
```

# Official path to workloads

https://build.opensuse.org/project/show/SUSE:ALP:Workloads

# Official Documentation

https://documentation.suse.com/alp/all/

# Example

```bash
 # demo_start_workload grafana

################################
 Grafana Web interface workload
################################

--------------------------------------------
 Press ENTER to continue or Crtl+c to Abort
--------------------------------------------

LABEL INSTALL
/host/usr/local/bin/grafana-container-manage.sh already exist
/host/etc/systemd/system/grafana.service already exist
/host/etc/grafana-container.conf already exist
/host/etc/grafana-functions already exist
using /etc/grafana-container.conf as configuration file
+ case $1 in
+ create_container
+ podman create --name grafana --tls-verify=false --network host registry.opensuse.org/suse/alp/workloads/tumbleweed_containerfiles/suse/alp/workloads/grafana:latest
64b4a30180e38fa769893a2bed64bcfb61a67e06696ccec798738e47deffc387
using /etc/grafana-container.conf as configuration file
+ case $1 in
+ podman start grafana
grafana
+ podman ps --all --format '{{.Names}}'
+ grep grafana
grafana

	Go to https://10.0.1.38:3000
	Go to https://192.168.10.1:3000
	login with admin / admin
```
