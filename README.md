# tf-ob-custom-plugin
sample repo - using a custom plugin (gh repo)

## Intro
This manual is dedicated to run vagrant box with terraform code which use custom provider. 

Tested on Mac OS X.

## Requirements
- Oracle Virtualbox recent version installed
[VirtualBox installation manual](https://www.virtualbox.org/manual/ch01.html#intro-installing)

- Hashicorp vagrant recent version installed
[Vagrant installation manual](https://learn.hashicorp.com/tutorials/vagrant/getting-started-install)

- git installed
[Git installation manual](https://git-scm.com/download/mac)

## Preparation 
- Clone git repository. 

```bash
git clone https://github.com/antonakv/tf-ob-custom-plugin.git
```

Expected command output looks like this:

```bash
Cloning into 'tf-ob-custom-plugin'...
remote: Enumerating objects: 12, done.
remote: Counting objects: 100% (12/12), done.
remote: Compressing objects: 100% (12/12), done.
remote: Total 12 (delta 1), reused 3 (delta 0), pack-reused 0
Receiving objects: 100% (12/12), done.
Resolving deltas: 100% (1/1), done.
```

- Change folder to tf-ob-custom-plugin

```bash
cd tf-ob-custom-plugin
```

## Provisioning

- In the same folder you were before run 

```bash
vagrant up
```

Expected output:

```bash
$ vagrant up     
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'aakulov/bionic64'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'aakulov/bionic64' version '21.05.27' is up to date...
==> default: Setting the name of the VM: tf-ob-custom-plugin_default_1622472687441_64318
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: hostonly
==> default: Forwarding ports...
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: 
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default: 
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
==> default: Setting hostname...
==> default: Configuring and enabling network interfaces...
==> default: Mounting shared folders...
    default: /vagrant => /Users/aakulov/Documents/Development/Hashicorp/tf-ob-custom-plugin
==> default: Running provisioner: shell...
    default: Running: /var/folders/_d/p7jhkm3n29d8q5mr_7k18yb00000gp/T/vagrant-shell20210531-57791-1x2ge7l.sh
    default: Get:1 http://mirrors.ubuntu.com/mirrors.txt Mirrorlist [974 B]
    default: Get:5 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
    default: Hit:2 http://ftp.nluug.nl/os/Linux/distr/ubuntu bionic InRelease
    default: Get:3 http://mirror.eu.kamatera.com/ubuntu bionic-updates InRelease [88.7 kB]
    default: Get:4 https://mirror.nl.leaseweb.net/ubuntu bionic-backports InRelease [74.6 kB]
    default: Get:6 http://mirror.eu.kamatera.com/ubuntu bionic-updates/main amd64 Packages [2,070 kB]
    default: Get:7 http://security.ubuntu.com/ubuntu bionic-security/main i386 Packages [984 kB]
    default: Get:8 http://mirror.eu.kamatera.com/ubuntu bionic-updates/main i386 Packages [1,288 kB]
    default: Get:9 http://mirror.eu.kamatera.com/ubuntu bionic-updates/universe i386 Packages [1,567 kB]
    default: Get:10 http://security.ubuntu.com/ubuntu bionic-security/main amd64 Packages [1,727 kB]
    default: Get:11 http://mirror.eu.kamatera.com/ubuntu bionic-updates/universe amd64 Packages [1,735 kB]
    default: Get:12 http://security.ubuntu.com/ubuntu bionic-security/universe i386 Packages [982 kB]
    default: Get:13 http://security.ubuntu.com/ubuntu bionic-security/universe amd64 Packages [1,127 kB]
    default: Fetched 11.7 MB in 9s (1,348 kB/s)

    [ Removed some lines]

    default: Processing triggers for dbus (1.12.2-1ubuntu1.2) ...
    default: Processing triggers for mime-support (3.60ubuntu1) ...
    default: Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
    default: Processing triggers for libc-bin (2.27-3ubuntu1.4) ...
    default: 2021-05-31T14:52:17Z INFO Waiting for automatic snapd restart...
    default: go 1.16.3 from Michael Hudson-Doyle (mwhudson) installed
    default: export GOROOT=/snap/go/current
    default: export PATH=$PATH:/snap/bin:$GOROOT/bin
    default: export GOPATH=~/go
```

## Implementation

- Connect to VM. In the same folder you were before run 

```bash
vagrant ssh
```

Sample result

```bash
$ vagrant ssh
Welcome to Ubuntu 18.04.5 LTS (GNU/Linux 4.15.0-143-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
New release '20.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

vagrant@ptfe:~$
```

- Clone plugin repository. Run:

```
git clone https://github.com/petems/terraform-provider-extip
```

Simple result:

```bash
$ git clone https://github.com/petems/terraform-provider-extip
Cloning into 'terraform-provider-extip'...
remote: Enumerating objects: 5188, done.
remote: Counting objects: 100% (1494/1494), done.
remote: Compressing objects: 100% (1204/1204), done.
remote: Total 5188 (delta 306), reused 1054 (delta 209), pack-reused 3694
Receiving objects: 100% (5188/5188), 8.26 MiB | 4.72 MiB/s, done.
Resolving deltas: 100% (1428/1428), done.
```

- Change directory to terraform-provider-extip. Run:

```bash
cd terraform-provider-extip
```

- Build provider. Run:

```bash
sudo make build
```

Simple result:

```bash
$ sudo make build
==> Checking that code complies with gofmt requirements...
go install
```

- Create plugin directory. In the same terminal run:

```bash
mkdir -p /vagrant/.terraform.d/plugins/localproviders/petems/extip/0.1.2/linux_amd64
```

Sample result

```bash
$ mkdir -p /vagrant/.terraform.d/plugins/localproviders/petems/extip/0.1.2/linux_amd64
$
```

- Copy plugin to the required path. Run:

```bash
cp $GOPATH/bin/terraform-provider-extip /vagrant/.terraform.d/plugins/localproviders/petems/extip/0.1.2/linux_amd64
```

- Change current directory to /vagrant. Run:

```bash
cd /vagrant
```

-  In the same folder run 

```bash
terraform init
```

Sample result

```bash
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of localproviders/petems/extip...
- Finding latest version of hashicorp/null...
- Installing localproviders/petems/extip v0.1.2...
- Installed localproviders/petems/extip v0.1.2 (self-signed, key ID 1E81AE5659BD2F20)
- Installing hashicorp/null v3.1.0...
- Installed hashicorp/null v3.1.0 (signed by HashiCorp)

Partner and community providers are signed by their developers.
If you d like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

- Then apply terraform code

```bash
terraform apply
```

Sample result

```bash
$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.mynull[0] will be created
  + resource "null_resource" "mynull" {
      + id = (known after apply)
    }

  # null_resource.mynull[1] will be created
  + resource "null_resource" "mynull" {
      + id = (known after apply)
    }

  # null_resource.mynull[2] will be created
  + resource "null_resource" "mynull" {
      + id = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + external_ip = "1.1.1.1"

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

null_resource.mynull[0]: Creating...
null_resource.mynull[2]: Creating...
null_resource.mynull[1]: Creating...
null_resource.mynull[2]: Provisioning with 'local-exec'...
null_resource.mynull[2] (local-exec): Executing: ["/bin/sh" "-c" "echo 2"]
null_resource.mynull[1]: Provisioning with 'local-exec'...
null_resource.mynull[1] (local-exec): Executing: ["/bin/sh" "-c" "echo 1"]
null_resource.mynull[0]: Provisioning with 'local-exec'...
null_resource.mynull[0] (local-exec): Executing: ["/bin/sh" "-c" "echo 0"]
null_resource.mynull[2] (local-exec): 2
null_resource.mynull[1] (local-exec): 1
null_resource.mynull[2]: Creation complete after 0s [id=2194196604146572112]
null_resource.mynull[1]: Creation complete after 0s [id=4461089051309457949]
null_resource.mynull[0] (local-exec): 0
null_resource.mynull[0]: Creation complete after 0s [id=1886287541815308043]
```