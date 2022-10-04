
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
copy /container/grafana-container-manage.sh in /host/usr/local/bin/
'/container/grafana-container-manage.sh' -> '/host/usr/local/bin/grafana-container-manage.sh'
'/container/grafana.service' -> '/host/etc/systemd/system/grafana.service'
copy /container/grafana-container.conf in /host/etc/
'/container/grafana-container.conf' -> '/host/etc/grafana-container.conf'
copy /container/grafana-functions in /host/etc/
'/container/grafana-functions' -> '/host/etc/grafana-functions'
using /etc/grafana-container.conf as configuration file
+ case $1 in
+ create_container
+ podman create --name grafana --tls-verify=false --network host registry.opensuse.org/suse/alp/workloads/tumbleweed_containerfiles/suse/alp/workloads/grafana:latest
dc5025fd78b4887edb2026b826aee01c056df03a9a00fbdde74b855b70bc66ea
using /etc/grafana-container.conf as configuration file
+ case $1 in
+ podman start grafana
grafana
+ podman ps 
+ grep grafana
CONTAINER ID  IMAGE                                                                                                    COMMAND               CREATED                 STATUS                     PORTS       NAMES
217e91696759  registry.opensuse.org/suse/alp/workloads/tumbleweed_containerfiles/suse/alp/workloads/grafana:latest                           Less than a second ago  Up Less than a second ago              grafana

	Go to https://HOSTNAME_OR_IP_OF_ALP_HOST:3000
	login with admin / admin
```


