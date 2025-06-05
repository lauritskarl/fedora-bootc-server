FROM quay.io/fedora/fedora-bootc:latest
ADD etc etc
RUN dnf install -y dnf5-plugins
RUN dnf config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
RUN dnf install -y \
  @smb-server \
  tailscale \
  cockpit \
  cockpit-podman \
  cockpit-storaged \
  cockpit-ws \
  lm_sensors \
  sysstat \
  tuned \
  vim-enhanced \
  bash-completion && \
  dnf clean all
RUN systemctl enable \
  tailscaled \
  lm_sensors \
  sysstat \
  tuned \
  podman.socket \
  podman-auto-update.timer \
  cockpit.socket
RUN bootc container lint
