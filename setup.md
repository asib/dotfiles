Setup
=====

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

**Upload pubkey**
*(from client pc)*
```
$ mkdir ~/.ssh
$ chmod 700 !$
$ cd !$
$ ssh-keygen -t rsa -C "email@example.com"
$ scp -p id_rsa.pub remoteuser@remotehost:
```

*(from host pc)*
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
