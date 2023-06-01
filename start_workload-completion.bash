#/usr/bin/env bash
_start_workload_completions()
{
  COMPREPLY=($(compgen -W "kvm yast cockpit grafana firewalld gdm ansible kea bind ww help ip" "${COMP_WORDS[1]}"))
}
complete -F _start_workload_completions start_workload
