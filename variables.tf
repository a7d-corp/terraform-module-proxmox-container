variable "arch" {
  default     = null
  description = "Sets the container OS architecture type. Defaults to `amd64`."
  type        = string
}

variable "bwlimit" {
  default     = null
  description = "A number for setting the override I/O bandwidth limit (in KiB/s)."
  type        = number
}

variable "clone" {
  default     = null
  description = "The lxc vmid to clone."
  type        = number
}

variable "clone_storage" {
  default     = null
  description = "Target storage for full clone."
  type        = string
}

variable "cmode" {
  default     = null
  description = "Configures console mode. `tty` tries to open a connection to one of the available tty devices. `console` tries to attach to `/dev/console` instead. `shell` simply invokes a shell inside the container (no login). Default is `tty`."
  type        = string
}

variable "console" {
  default     = null
  description = "A boolean to attach a console device to the container. Default is true."
  type        = bool
}

variable "cores" {
  default     = null
  description = "Number of cores to allocate. A container can use all available cores by default."
  type        = number
}

variable "cpulimit" {
  default     = null
  description = "A number to limit CPU usage by. Default is 0."
  type        = number
}

variable "cpuunits" {
  default     = null
  description = "A number of the CPU weight that the container possesses. Default is 1024."
  type        = number
}

variable "description" {
  default     = null
  description = "Sets the container description seen in the web interface."
  type        = string
}

variable "features" {
  default     = null
  description = "An object for allowing the container to access advanced features."
  type = object({
    fuse    = optional(bool)
    keyctl  = optional(bool)
    mount   = optional(string)
    nesting = optional(bool)
  })
}

variable "full" {
  default     = null
  description = "When cloning, create a full copy of all disks. This is always done when you clone a normal CT. For CT template it creates a linked clone by default."
  type        = bool
}

variable "hastate" {
  default     = null
  description = "Requested HA state for the resource."
  type        = string
  validation {
    condition = anytrue([
      var.hastate == "disabled",
      var.hastate == "enabled",
      var.hastate == "ignored",
      var.hastate == "started",
      var.hastate == "stopped",
      var.hastate == null
    ])
    error_message = "Must be one of 'disabled', 'enabled', 'ignored', 'started', 'stopped', or null (default)."
  }
}

variable "hagroup" {
  default     = null
  description = "The HA group identifier the resource belongs to."
  type        = string
}

variable "hookscript" {
  default     = null
  description = "A string containing a volume identifier to a script that will be executed during various steps throughout the container's lifetime. The script must be an executable file."
  type        = string
}

variable "hostname" {
  default     = null
  description = "Specifies the host name of the container."
  type        = string
}

variable "ignore_unpack_errors" {
  default     = null
  description = "A boolean that determines if template extraction errors are ignored during container creation."
  type        = bool
}

variable "memory" {
  default     = null
  description = "A number containing the amount of RAM to assign to the container (in MB)."
  type        = number
}

# see provider docs for info on options https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/resources/lxc.md#argument-reference
variable "mountpoints" {
  default     = null
  description = "List of objects for defining volumes to use as container mount points."
  type = list(object({
    mp        = string
    size      = string
    slot      = string
    key       = number
    storage   = string
    acl       = optional(string)
    backup    = optional(string)
    quota     = optional(string)
    replicate = optional(string)
    shared    = optional(string)
  }))
}

variable "nameserver" {
  default     = null
  description = "The DNS server IP address used by the container. If neither nameserver nor searchdomain are specified, the values of the Proxmox host will be used by default."
  type        = string
}

# see provider docs for info on options https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/resources/lxc.md#argument-reference
variable "networks" {
  default     = null
  description = "A list of objects defining network interfaces for the container."
  type = list(object({
    name     = string
    bridge   = optional(string)
    firewall = optional(bool)
    gw       = optional(string)
    gw6      = optional(string)
    hwaddr   = optional(string)
    ip       = optional(string)
    ip6      = optional(string)
    mtu      = optional(string)
    rate     = optional(number)
    tag      = optional(number)
  }))
}

variable "onboot" {
  default     = null
  description = "A boolean that determines if the container will start on boot. Default is false"
  type        = bool
}

variable "ostemplate" {
  default     = null
  description = "The volume identifier that points to the OS template or backup file."
  type        = string
}

variable "ostype" {
  default     = null
  description = "The operating system type, used by LXC to set up and configure the container. Automatically determined if not set."
  type        = string
}

variable "password" {
  default     = null
  description = "Sets the root password inside the container."
  sensitive   = true
  type        = string
}

variable "pool" {
  default     = null
  description = "The name of the Proxmox resource pool to add this container to."
  type        = string
}

variable "protection" {
  default     = null
  description = "A boolean that enables the protection flag on this container. Stops the container and its disk from being removed/updated. Default is false."
  type        = bool
}

variable "restore" {
  default     = null
  description = "A boolean to mark the container creation/update as a restore task."
  type        = bool
}

# see provider docs for info on options https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/resources/lxc.md#argument-reference
variable "rootfs" {
  description = "An object for configuring the root mount point of the container. Can only be specified once."
  type = object({
    size    = string
    storage = string
  })
}

variable "searchdomain" {
  default     = null
  description = "Sets the DNS search domains for the container. If neither nameserver nor searchdomain are specified, the values of the Proxmox host will be used by default."
  type        = string
}

variable "ssh_public_keys" {
  default     = null
  description = "Multi-line string of SSH public keys that will be added to the container. Can be defined using heredoc syntax."
  type        = string
}

variable "start" {
  default     = null
  description = "A boolean that determines if the container is started after creation. Default is false."
  type        = bool
}

variable "swap" {
  default     = null
  description = "A number that sets the amount of swap memory available to the container. Default is 512."
  type        = number
}

variable "tags" {
  default     = null
  description = "Tags of the container. This is only meta information."
  type        = string
}

variable "target_node" {
  description = "Name of the node to assign the instance to."
  type        = string
}

variable "template" {
  default     = null
  description = "A boolean that determines if this container is a template."
  type        = bool
}

variable "tty" {
  default     = null
  description = "A number that specifies the TTYs available to the container. Default is 2."
  type        = number
}

variable "unique" {
  default     = null
  description = "A boolean that determines if a unique random ethernet address is assigned to the container."
  type        = bool
}

variable "unprivileged" {
  default     = null
  description = "A boolean that makes the container run as an unprivileged user. Default is false."
  type        = bool
}

variable "vmid" {
  default     = null
  description = "A number that sets the VMID of the container. If set to 0, the next available VMID is used. Default is 0."
  type        = number
}
