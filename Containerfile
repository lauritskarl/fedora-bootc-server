FROM quay.io/fedora/fedora-bootc:latest
ADD etc etc
RUN dnf install -y cockpit cockpit-podman cockpit-storaged cockpit-ws git lm_sensors sysstat tuned vim-enhanced bash-completion && dnf clean all
RUN systemctl enable lm_sensors sysstat tuned fstrim.timer podman.socket podman-auto-update.timer cockpit.socket
