alias di='doctl'

alias did='doctl compute droplet'


alias anya="ssh -i ~/.ssh/ssh-key-anya root@139.59.142.33"


di_zshi() {
  apt-get update
  apt-get install -y zsh
  chsh -s /bin/zsh
}


