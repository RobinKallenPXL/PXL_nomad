# Nomad consul

The aim of this project is to provide a development environment based on [consul](https://www.consul.io) and [nomad](https://www.nomadproject.io) to manage container based microservices.

The following steps should make that clear;

bring up the environment by using [vagrant](https://www.vagrantup.com) which will create centos 7 virtualbox machine or lxc container.

The proved working vagrant providers used on an [ArchLinux](https://www.archlinux.org/) system are
* [vagrant-lxc](https://github.com/fgrehm/vagrant-lxc)
* [vagrant-libvirt](https://github.com/vagrant-libvirt/)
* [virtualbox](https://www.virtualbox.org/)

```bash
    $ vagrant up --provider lxc
    OR
    $ vagrant up --provider libvirt
    OR
    $ vagrant up --provider virtualbox
```

Once it is finished, you should be able to connect to the vagrant environment through SSH and interact with Nomad:

```bash
    $ vagrant ssh
    [vagrant@nomad ~]$
```

# Documentatie Opdracht 1

stap1:
Mappen en scripts aangemaakt voor het opstarten van de docker containers.

stap2:
In de scripts begonnen met het installeren van yum-config-manager voor docker, nomad en consul te installeren.

Na yum, docker installeren voor zowel de server als clients. Vervolgens nomad installeren.

stap3:
Nomad files configureren en op de juiste plaats zetten.

stap4:
Kijken of alles tot dit punt werkt.

stap5:
Consul toevoegen, in onze script files consul installeren. Ook extra map maken voor consul files.

stap6:
Consul config files configureren en op de juiste plaats in onze vm zetten.

stap7:
Kijken of het werkt aan de hand van "vagrant ssh server -- -L 8500:192.168.1.4:8500" op de browser dan gaan naar localhost:8500.
Daar kunnen wij dan zien dat de clustering succesvol is gebeurd.
