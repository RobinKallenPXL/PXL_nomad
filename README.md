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

# Documentatie Opdracht 2

## Opgave

Per 2 (overzicht), met behulp van vagrant de nomad cluster uit de eerste opdracht nu niet met bash maar met ansible of puppet op brengen. Maak hiervoor gebruik van de puppet of ansible provisioner.

Er dienen voor deze opdracht verschillende modules geschreven te worden als ook roles (en profiles) samen met een node manifest of play. Het gebruik van parameters en templates voor de configuraties waar nodig wordt ten zeerste aangeraden!

Verdeel het werk onderling, zodanig ieder zelf code schrijft en dit ook duidelijk wordt uit de git history.

Nomad en consul te werken zoals beoogd in de eerste opdracht! Er zal ook deze keer gekeken worden met behulp van een nomad job file of de cluster werkt zoals vooropgesteld.

## Initiele aanpak

Wij zijn gestart met het overnemen van de ansible mappen structier die werd megegeven.
```
    ansible
    ├──── ansible.cfg
    ├──── group_vars                  # Hier worden variabelen van groepen ingestoken vb.: nomad_server in de groep server (wordt in ons geval niet gebruikt wegens Vagrant).
    │     └── servers.yml
    ├──── host_vars                   # Hier worden variablen van hosts in gestoken vb.: nomad_name = naam_zelf_kiezen.
    │     └── server.yml
    ├──── plays                       # Verzameling van taken die worden uitgevoerd.
    │     ├── playbook.yml
    │     └── server.yml                    
    └──── roles
          └──── software
                └──── crond                 # Een ansible rol (dat in dit vb. geen service instaleert).
                      ├── defaults          # Default variabelen voor een bepaalde rol.     
                      │   └── main.yml
                      ├── handlers          # Bepaalde functie die vanuit een andere task kan opgeroepen worden.
                      │   └── main.yml
                      ├── tasks             # Lijst van instructies die worden uitgevoerd door de machine.
                      │   └── main.yml
                      └── templates         # Configuratie files voor machines die worden aangepast door ansible variabels (defaults / groups_vars / hosts_vars)
                          └── hello.sh.j2      
```

Eerst zijn we begonnen met roles te maken voor nomad, consul en docker, erna hebben we voor nomad en consul de defaults, task en handlers geschreven op basis van het crond voorbeeld. We hebben tegelijk ook onze Vagrant file aangepast zodat we konden beginnen met het testen.
Later hebben we ook de tasks voor docker geschreven.
In de template dir hebben we de consul en nomad config files geschreven.
Wij zijn gestart van onze config files van opdracht 1, na het opzoeken van j2 syntax zijn we gestart met onze server config files en client config files tot één geheel te vormen.
Hebben ervoor gezorgd dat de host_vars die we megeven worden overgeschreven op de juiste plaatsen in de config files zodat we bv. geen hardcoded ip's moeten geven aan onze machines.
Als laatste hebben we alle roles in de playbook geschreven en nog wat tweakings hier en daar, zo eindigen wij met deze mappen structuur.

```
 ansible
   ├── ansible.cfg
   ├── group_vars
   │   └── servers.yml
   ├── host_vars
   │   └── server.yml
   ├── plays
   │   ├── playbook.yml
   │   └── server.yml                          # Voorbeeld, wordt niet gebruikt in de code
   └── roles
       └── software                            
           ├── consul
           │   ├── defaults
           │   │   └── main.yml
           │   ├── handlers
           │   │   └── main.yml
           │   ├── tasks
           │   │   └── main.yml                
           │   └── templates
           │       └── consul.hcl.j2
           ├── crond                           # Hebben we gebruikt als voorbeeld wordt niet gebruikt in deze opdracht
           │   ├── defaults
           │   │   └── main.yml
           │   ├── handlers
           │   │   └── main.yml
           │   ├── tasks
           │   │   └── main.yml
           │   └── templates
           │       └── hello.sh.j2
           ├── docker
           │   └── tasks
           │       └── main.yml
           └── nomad
               ├── defaults
               │   └── main.yml
               ├── handlers
               │   └── main.yml
               ├── tasks
               │   └── main.yml
               └── templates
                   └── nomad.hcl.j2
```





