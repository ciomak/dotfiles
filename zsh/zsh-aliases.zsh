alias docker-up="sudo systemctl start docker.service"
alias off="systemctl poweroff"
alias reboot="systemctl reboot"
alias l="ls -la --color=auto"
alias tree="tree -C"

alias dive="podman run -ti --rm -v /run/user/1000/podman/podman.sock:/var/run/docker.sock:z wagoodman/dive"
alias lazypodman='DOCKER_HOST=unix:///run/user/1000/podman/podman.sock lazydocker'
