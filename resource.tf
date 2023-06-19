resource "proxmox_lxc" "proxmox_container" {
  # meta config
  description     = var.description
  hostname        = var.hostname
  password        = var.password
  ssh_public_keys = var.ssh_public_keys
  tags            = var.tags
  target_node     = var.target_node
  vmid            = var.vmid

  # hardware config
  arch     = var.arch
  bwlimit  = var.bwlimit
  cmode    = var.cmode
  console  = var.console
  cores    = var.cores
  cpulimit = var.cpulimit
  cpuunits = var.cpuunits
  memory   = var.memory
  swap     = var.swap
  tty      = var.tty

  rootfs {
    size    = var.rootfs_size
    storage = var.rootfs_storage
  }

  dynamic "mountpoint" {
    for_each = var.mountpoints
    content {
      acl       = mountpoint.value.acl
      backup    = mountpoint.value.backup
      key       = mountpoint.value.key
      mp        = mountpoint.value.mp
      quota     = mountpoint.value.quota
      replicate = mountpoint.value.replicate
      size      = mountpoint.value.size
      shared    = mountpoint.value.shared
      slot      = mountpoint.value.slot
      storage   = mountpoint.value.storage
    }
  }

  # network config
  nameserver   = var.nameserver
  searchdomain = var.searchdomain
  unique       = var.unique

  dynamic "network" {
    for_each = var.networks
    content {
      bridge   = network.value.bridge
      firewall = network.value.firewall
      gw       = network.value.gw
      gw6      = network.value.gw6
      hwaddr   = network.value.hwaddr
      ip       = network.value.ip
      ip6      = network.value.ip6
      mtu      = network.value.mtu
      name     = network.value.name
      rate     = network.value.rate
      tag      = network.value.tag
    }
  }

  # PVE config
  features     = var.features
  hastate      = var.hastate
  hagroup      = var.hagroup
  hookscript   = var.hookscript
  onboot       = var.onboot
  ostype       = var.ostype
  pool         = var.pool
  protection   = var.protection
  restore      = var.restore
  start        = var.start
  unprivileged = var.unprivileged

  # image config
  clone                = var.clone
  clone_storage        = var.clone_storage
  full                 = var.full
  ignore_unpack_errors = var.ignore_unpack_errors
  ostemplate           = var.ostemplate
  template             = var.template
}
