
# Goal

This is a **WRAPPER** script to test some **[ALP OS](https://github.com/aginies/alp-os#official-documentation)** workload.
**ALP** is a SUSE lightweight operating system. Instead of applications 
distributed in traditional software packages, it runs 
containerized and virtualized workloads.

This script doesnt remove the container or stop the workload, its just
a wrapper to quickly launch your workload. It provides some help guidance
in case of issue.

![image](https://github.com/aginies/alp-os/blob/5faca93cc34f3cd9041d2c5f03604c3502c9eff5/alp_OS_SUSE.gif)

# Usage

First arg should be the workload to start.

`demo_start_workload [kvm|yast|cockpit|grafana|firewalld|virtm|help]`

# Workloads available currently

* kvm: KVM container workload
* yast: launch Yast ncurses
* yastqt: launch Yast qt
* virtm: launch virt-manager (needs KVM ready)
* cockpit: Cockpit Web Management
   * https://HOSTNAME_OR_IP_OF_ALP_HOST:9090
* grafana: Grafana Web interface
   * https://HOSTNAME_OR_IP_OF_ALP_HOST:3000
* firewalld

# Install the wrapper script on ALP OS 

```
podman container runlabel install registry.opensuse.org/home/aginies/branches/opensuse/templates/images/tumbleweed/containers/suse/alp/workloads/demo:latest
```

If you have a previous installation just remove the container in cache:
```
podman rmi registry.opensuse.org/home/aginies/branches/opensuse/templates/images/tumbleweed/containers/suse/alp/workloads/demo:latest
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
