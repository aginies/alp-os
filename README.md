
# Goal
This is a DEMO script to TEST some ALP OS workload.

First arg should be the workload to start.
This script doesnt remove the container or stop the workload.

# Usage

./demo_start_workload [kvm|yast|cockpit|grafana|firewalld|help]

# Workloads available currently

* kvm: KVM container workload
* yast: Yast ncurses
* cockpit: Cockpit Web Management
   * https://HOSTNAME_OR_IP_OF_ALP_HOST:9090
* grafana: Grafana Web interface
   * https://HOSTNAME_OR_IP_OF_ALP_HOST:3000
* firewalld

# Official path to workloads 

https://build.opensuse.org/project/show/SUSE:ALP:Workloads

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
cp: cannot stat '/container/grafana.service': No such file or directory
/host/etc/grafana-container.conf already exist
/host/etc/grafana-functions already exist
using /etc/grafana-container.conf as configuration file
+ case $1 in
+ create_container
+ podman create --name grafana --tls-verify=false --network host registry.opensuse.org/suse/alp/workloads/tumbleweed_containerfiles/suse/alp/workloads/grafana:latest
217e916967594612f371a517e93d815a1dcc9bf3132aab110a85da380f9e5eec
using /etc/grafana-container.conf as configuration file
+ case $1 in
+ podman start grafana
grafana
+ podman ps
CONTAINER ID  IMAGE                                                                                                    COMMAND               CREATED                 STATUS                     PORTS       NAMES
217e91696759  registry.opensuse.org/suse/alp/workloads/tumbleweed_containerfiles/suse/alp/workloads/grafana:latest                           Less than a second ago  Up Less than a second ago              grafana

	Go to https://HOSTNAME_OR_IP_OF_ALP_HOST:3000
	login with admin / admin
```
