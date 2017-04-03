# vagrant-vbox-si-fs
Vagrant setup to install an Oracle single instance database on filesystem.

Clone the repository by:
`git clone --recursive https://github.com/oravirt/vagrant-vbox-si-fs.git`

`cd vagrant-vbox-si`

Edit the `hosts.yml` file if you want to change the ip, number of cpu's etc.

If you want to use a different version or Oracle Linux, change the parameter `box: oravirt/ol73` to one of the following:

- `oravirt/ol72`
- `oravirt/ol68`
- `oravirt/ol67`
- `oravirt/ol65`

Download the Oracle binaries (see below) and place them in the `swrepo` directory.

And then: `vagrant up`

This will (by default):
- create a VM based on Oracle Linux 7.3
- create a 12.2 container database called 'orclcdb'
- create a pdb called 'orclpdb'
- sys/system passwords are Oracle123

If you just want to create the machine, and not run the provisioning step run this:

`vagrant up --no-provision`

### Modifying the Oracle installation

If you want to install a different version of Oracle, edit the `ansible-oracle/group_vars/vbox-si-fs` file and change the following:

Under `oracle_databases`, change the parameter `oracle_version_db:` to one of the following:

* `12.2.0.1`
* `12.1.0.2`
* `12.1.0.1`
* `11.2.0.4`
* `11.2.0.3`

### These are the Oracle binaries that should be used.

For 12.2.0.1:
```
    linuxx64_12201_database.zip
 ```

For 12.1.0.2
```
    linuxamd64_12102_database_1of2.zip
    linuxamd64_12102_database_2of2.zip
 ```

For 12.1.0.1:
```
    linuxamd64_12c_database_1of2.zip
    linuxamd64_12c_database_2of2.zip
 ```

For 11.2.0.4:
```
    p13390677_112040_Linux-x86-64_1of7.zip
    p13390677_112040_Linux-x86-64_2of7.zip
 ```

 For 11.2.0.3:
 ```
    p10404530_112030_Linux-x86-64_1of7.zip
    p10404530_112030_Linux-x86-64_2of7.zip
 ```
