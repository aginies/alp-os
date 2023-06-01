
# Goal

**WRAPPER** script to test some **[ALP OS](https://github.com/aginies/alp-os#official-documentation)** workload.
**ALP** is a SUSE lightweight Operating System. Instead of applications 
distributed in traditional software packages, it runs 
containerized and virtualized workloads.

This script doesnt remove the container or stop the workload, its just
a wrapper to quickly launch your workload. It provides some help guidance
in case of issue.

![image](https://github.com/aginies/alp-os/blob/53b0e807fa649cba70abb81b3ca85cd60d8f97ef/alp_OS_SUSE.gif)

# Usage

First arg should be the workload to start.

`start_workload /start_workload [kvm|yast|cockpit|grafana|firewalld|gdm|ansible|kea|bind|ww|help]`

# Workloads available currently

* **ansible**: Provides the ansible toolstack
* **kvm**: Prepare system to deploy Virtual Machine
* **kea**: Kea DHCP4/DHCP6 server
* **bind**: ISC Bind9 DNS Server
* **yast**: Manage you host OS (console)
* **yastqt**: Manage you host OS (GUI)
* **ww**: provides warewulf4
* **gdm**: Gnome Display Manager (local)
* **cockpit**: Manage you host OS (Web)
   * https://HOSTNAME_OR_IP_OF_ALP_HOST:9090
* **grafana**: Monitoring System
   * http://HOSTNAME_OR_IP_OF_ALP_HOST:3000
* **firewalld**: firewall management and daemon
* **neuvector**: Container Security
   * https://HOSTNAME_OR_IP_OF_ALP_HOST:8443

# Install the wrapper script on ALP OS 

## Host OS

You should use [SLE Micro](https://www.suse.com/products/micro/), [MicroOS](https://microos.opensuse.org/) or an [ALP OS](https://download.opensuse.org/repositories/SUSE:/ALP:/PUBLISH/images/) to use this script.
SLES OS is not providing **nmcli** or **cockpit-bridge** by default.

## With podman
```
podman container runlabel install registry.opensuse.org/suse/alp/workloads/tumbleweed_containerfiles/suse/alp/workloads/demo:latest
```

If you have a previous installation just remove the container in cache:
```
podman rmi registry.opensuse.org/suse/alp/workloads/tumbleweed_containerfiles/suse/alp/workloads/demo:latest
```

## Just grab the script

```bash
curl -L -o /usr/local/bin/start_workload https://raw.githubusercontent.com/aginies/alp-os/main/start_workload
chmod 755 /usr/local/bin/start_workload
start_workload
```

# Official path to workloads

https://build.opensuse.org/project/show/SUSE:ALP:Workloads

# Official Documentation

https://documentation.suse.com/alp/all/

# Example

```bash
 # start_workload grafana

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

	Go to http://10.0.1.38:3000
	Go to http://192.168.10.1:3000
	login with admin / admin
```
