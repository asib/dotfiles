Setup
=====

Change root pass
----------------
```
# passwd
```

Create user
-----------
```
# apt-get install adduser
# adduser jfent
```

**Now get sudo**
```
# apt-get install sudo
# visudo
```

**Add the following line below** `root    ALL=(ALL:ALL) ALL`
```
jfent   ALL=(ALL:ALL) ALL
```

**Switch to new user**
```
# su - jfent
```

Update and Upgrade and Reboot
-----------------------------
**Watch out on XEN, do `$ sudo cp /boot/grub/menu.lst ~/` then execute the following, but before reboot do `$ sudo cp ~/menu.lst /boot/grub/menu.lst` and correct the kernel version**
```
$ sudo apt-get update ; sudo apt-get upgrade
$ sudo reboot
```

Download & Setup ViM
--------------------
```
$ sudo apt-get install vim
```

(now copy .vimrc from github.com/asib/dotfiles and follow instructions to setup)

Change sshd_config
------------------
```
$ sudo vi /etc/ssh/sshd_config
```

**Ensure:**

```
AllowUsers jfent
Port 2272
```

**Restart ssh**
```
$ sudo service ssh restart
```

**Upload pubkey (from client pc)**
```
$ mkdir ~/.ssh
$ chmod 700 !$
$ cd !$
$ ssh-keygen -t rsa -C "email@example.com"
$ scp -p id_rsa.pub remoteuser@remotehost:
```

**(from host pc)**
```
$ mkdir ~/.ssh
$ chmod 700 !$
$ cat id_rsa.pub >> ~/.ssh/authorized_keys
$ chmod 600 ~/.ssh
$ sudo vi /etc/ssh/sshd_config
```

**Ensure:**

```
RSAAuthentication yes
PubkeyAuthentication yes
PermitRootLogin no
PasswordAuthentication no
UsePAM no
```

**Restart ssh**
```
$ sudo service ssh restart
```

Setup iptables
--------------
```
$ sudo apt-get install iptables-persistent
```

**Go to [this address](http://www.slackware.com/~alien/efg/index.php) and generate then copy an iptables script**
```
$ nano firewall.rules
```
**Be sure to modify the line with the comment `# sshd` so that the dest port is 2272 (as set earlier in sshd_config**

**Paste and save**
```
$ chmod +x firewall.rules
$ ./firewall.rules
$ sudo apt-get install fail2ban
$ sudo iptables-save > /etc/iptables/rules.v4
```

Install/Setup Golang
--------------------
```
$ wget "https://storage.googleapis.com/golang/GO_PACKAGE.tar.gz"
$ sudo tar -C /usr/local -xzf GO_PACKAGE.tar.gz
$ mkdir ~/go
$ vi ~/.bashrc
```
**Ensure:**
```
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
```

Install/Setup Haskell
---------------------
```
$ sudo apt-get install haskell-platform
$ vi ~/.ghc/ghci.conf
```
**Add the line**
```
:set prompt "λ: "
```

Install tmux
------------
```
$ sudo apt-get install tmux
```
