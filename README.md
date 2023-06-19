# terraform-module-proxmox-container

Terraform module to manage LXC containers on Proxmox hosts

## General info

All optional variables will use the default provided by the [upstream provider](https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/resources/lxc.md#argument-reference). 

In the case of the following variables, please see the provider documentation for their respective sub-options:

- `features`
- `mountpoints`
- `networks`
- `rootfs`

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| proxmox | >= 2.9.14 |

## Providers

| Name | Version |
|------|---------|
| proxmox | >= 2.9.14 |

## Resources

| Name | Type |
|------|------|
| [proxmox_lxc.proxmox_container](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/lxc) | resource |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| rootfs_size | Size of the storage used for the root mount point of the container. | `string` | yes |
| rootfs_storage | Location for the storage used for the root mount point of the container. | `string` | yes |
| target_node | Name of the node to assign the instance to. | `string` | yes |
| arch | Sets the container OS architecture type. Defaults to `amd64`. | `string` | no |
| bwlimit | A number for setting the override I/O bandwidth limit (in KiB/s). | `number` | no |
| clone | The lxc vmid to clone. | `number` | no |
| clone_storage | Target storage for full clone. | `string` | no |
| cmode | Configures console mode. `tty` tries to open a connection to one of the available tty devices. `console` tries to attach to `/dev/console` instead. `shell` simply invokes a shell inside the container (no login). Default is `tty`. | `string` | no |
| console | A boolean to attach a console device to the container. Default is true. | `bool` | no |
| cores | Number of cores to allocate. A container can use all available cores by default. | `number` | no |
| cpulimit | A number to limit CPU usage by. Default is 0. | `number` | no |
| cpuunits | A number of the CPU weight that the container possesses. Default is 1024. | `number` | no |
| description | Sets the container description seen in the web interface. | `string` | no |
| features_fuse | A boolean for enabling FUSE mounts. | `bool` | no |
| features_keyctl | A boolean for enabling the `keyctl()` system call. | `bool` | no |
| features_mount | Defines the filesystem types (separated by semicolons) that are allowed to be mounted. | `string` | no |
| features_nesting | A boolean to allow nested virtualization. | `bool` | no |
| full | When cloning, create a full copy of all disks. This is always done when you clone a normal CT. For CT template it creates a linked clone by default. | `bool` | no |
| hagroup | The HA group identifier the resource belongs to. | `string` | no |
| hastate | Requested HA state for the resource. | `string` | no |
| hookscript | A string containing a volume identifier to a script that will be executed during various steps throughout the container's lifetime. The script must be an executable file. | `string` | no |
| hostname | Specifies the host name of the container. | `string` | no |
| ignore_unpack_errors | A boolean that determines if template extraction errors are ignored during container creation. | `bool` | no |
| memory | A number containing the amount of RAM to assign to the container (in MB). | `number` | no |
| mountpoints | List of objects for defining volumes to use as container mount points. | <pre>list(object({<br>    mp        = string<br>    size      = string<br>    slot      = string<br>    key       = number<br>    storage   = string<br>    acl       = optional(string)<br>    backup    = optional(string)<br>    quota     = optional(string)<br>    replicate = optional(string)<br>    shared    = optional(string)<br>  }))</pre> | no |
| nameserver | The DNS server IP address used by the container. If neither nameserver nor searchdomain are specified, the values of the Proxmox host will be used by default. | `string` | no |
| networks | A list of objects defining network interfaces for the container. | <pre>list(object({<br>    name     = string<br>    bridge   = optional(string)<br>    firewall = optional(bool)<br>    gw       = optional(string)<br>    gw6      = optional(string)<br>    hwaddr   = optional(string)<br>    ip       = optional(string)<br>    ip6      = optional(string)<br>    mtu      = optional(string)<br>    rate     = optional(number)<br>    tag      = optional(number)<br>  }))</pre> | no |
| onboot | A boolean that determines if the container will start on boot. Default is false | `bool` | no |
| ostemplate | The volume identifier that points to the OS template or backup file. | `string` | no |
| ostype | The operating system type, used by LXC to set up and configure the container. Automatically determined if not set. | `string` | no |
| password | Sets the root password inside the container. | `string` | no |
| pool | The name of the Proxmox resource pool to add this container to. | `string` | no |
| protection | A boolean that enables the protection flag on this container. Stops the container and its disk from being removed/updated. Default is false. | `bool` | no |
| restore | A boolean to mark the container creation/update as a restore task. | `bool` | no |
| searchdomain | Sets the DNS search domains for the container. If neither nameserver nor searchdomain are specified, the values of the Proxmox host will be used by default. | `string` | no |
| ssh_public_keys | Multi-line string of SSH public keys that will be added to the container. Can be defined using heredoc syntax. | `string` | no |
| start | A boolean that determines if the container is started after creation. Default is false. | `bool` | no |
| swap | A number that sets the amount of swap memory available to the container. Default is 512. | `number` | no |
| tags | Tags of the container. This is only meta information. | `string` | no |
| template | A boolean that determines if this container is a template. | `bool` | no |
| tty | A number that specifies the TTYs available to the container. Default is 2. | `number` | no |
| unique | A boolean that determines if a unique random ethernet address is assigned to the container. | `bool` | no |
| unprivileged | A boolean that makes the container run as an unprivileged user. Default is false. | `bool` | no |
| vmid | A number that sets the VMID of the container. If set to 0, the next available VMID is used. Default is 0. | `number` | no |
<!-- END_TF_DOCS -->
