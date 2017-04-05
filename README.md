# vagrant-vbox-si-fs
Vagrant setup to install an Oracle single instance database on filesystem.


The provisioning step of this vagrant solution is: [https://github.com/oravirt/ansible-oracle](https://github.com/oravirt/ansible-oracle)

### Getting started

Clone this repository:
`git clone --recursive https://github.com/oravirt/vagrant-vbox-si-fs.git`

`cd vagrant-vbox-si`

Edit the `hosts.yml` file if you want to change the ip, number of cpu's, amount of RAM etc.

If you want to use a different version or Oracle Linux, change the parameter `box: oravirt/ol73` to one of the following:

- `oravirt/ol72`
- `oravirt/ol68`
- `oravirt/ol67`
- `oravirt/ol65`

These boxes are prepared with all Oracle pre-req packages installed

Download the Oracle binaries (see below) and place them in the `swrepo` directory.

And then: `vagrant up`

This will (by default):
- create a VM based on Oracle Linux 7.3
- create a 12.2 container database called 'orclcdb'
- create a pdb called 'orclpdb'
- sys/system passwords are Oracle123

If you just want to create the machine, and not run the provisioning step run this:

`vagrant up --no-provision`

### Modifying the filesystems on the host

The VM configures 2 filesystems (u01/ & /u02). /u01 uses ext4 as the filesystem & /u02 uses xfs by default. If you'd want to change either of these, do the follwing:

* edit the `ansible-oracle/group_vars/vbox-si-fs`
* Under `host_fs_layout` change the `fstype` parameter to ext4/xfs/btrfs.


### Modifying the Oracle installation

If you want to install a different version of Oracle, edit the `ansible-oracle/group_vars/vbox-si-fs` file and change the following:

Under `oracle_databases`, change the parameter `oracle_version_db:` to one of the following:

* `12.2.0.1`
* `12.1.0.2`
* `12.1.0.1`
* `11.2.0.4`
* `11.2.0.3`

If you want to change other parameters they're all under `oracle_databases`.



### Adding more ORACLE_HOMES, or databases to an existing home

If you want to install more than 1 ORACLE_HOME (using different version etc), just uncomment the part that is commented in `ansible-oracle/group_vars/vbox-si-fs`.

It is also possible to add more homes & databases than those already configured.


After you've done the changes, run `vagrant provision` again, and it will install the new home and/or create the database.

### Logging in to the VM

To log on to the VM (ssh), you have the following options:
* run `vagrant ssh` from within the directory, then sudo to oracle/root
* ssh to VM using the ssh binary of your choice, i.e: `ssh 192.168.9.62 -l oracle` (oracle/oracle, root/root). The oracle user also have sudo rights

For each database created there is a `/home/oracle/.profile_<dbname>` created which have all the environment variables set up for this particular database.

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
