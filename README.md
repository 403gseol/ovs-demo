# A Short Demo

## Pre-requisites
- Vagrant
- Plugin vagrant-hosts (Execute vagrant plugin install vagrant-hosts)

## Steps
- Start the vagrant machines (m1 & m2)
```
vagrant up
```

- Open two SSH sessions each into the two machines
```
vagrant ssh <m1|m2>
```

- In m1 machine
```
$ cangen vcan0                      # (in shell 1)
$ sudo /vagrant/m1.sh               # (in shell 2)
$ python3 /vagrant/canToZenoh.py    # (in shell 2)
```

- In m2 machine
```
$ candump vcan0                     # (in shell 1)
$ sudo /vagrant/m2.sh               # (in shell 2)
$ python3 /vagrant/zenohToCan.py    # (in shell 2)
```
