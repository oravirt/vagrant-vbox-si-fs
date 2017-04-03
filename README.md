# vagrant-vbox-si-fs
Vagrant setup to install an Oracle single instance database on filesystem.

Clone the repository by:
`git clone --recursive https://github.com/oravirt/vagrant-vbox-si-fs.git`

`cd vagrant-vbox-si`

Edit the hosts.yml file if you want to change the ip, number of cpu's etc.

Download the Oracle binaries and place them in the swrepo directory.

`vagrant up`

This will:
- create a 12.1 container database called 'orcl'
- create a pdb called orclpdb
- sys/system passwords are Oracle123


