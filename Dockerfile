FROM ubuntu:focal
ARG TAGS
WORKDIR /root
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y software-properties-common && apt-add-repository -y ppa:ansible/ansible && apt-add-repository -y ppa:neovim-ppa/unstable && apt update && apt install -y curl git ansible build-essential neovim
COPY . ./.dotfiles
COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN chmod +x /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
