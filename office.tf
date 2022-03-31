terraform {
  required_providers {
    junos-ex-interfaces = {
      source  = "cdot65/junos-ex-interfaces"
      version = "0.0.2"
    }
    junos-ex-vlans = {
      source  = "cdot65/junos-ex-vlans"
      version = "0.0.1"
    }
  }
}

provider "junos-ex-interfaces" {
  host     = "office"
  port     = var.juniper_ssh_port
  sshkey   = var.juniper_ssh_key
  username = var.juniper_user_name
  password = var.juniper_user_password
}

module "iface_ge0" {
  // interface ge-0/0/0 description "tf: Raspberry Pi"
  // interface ge-0/0/0 unit 0 family ethernet switching interface-mode access vlan members VLAN_103"
  interface_name        = "ge-0/0/0"
  subinterface_unit     = "0"
  interface_description = "tf: Raspberry Pi"
  interface_mode        = "access"
  interface_vlans       = "VLAN_103"

  // name of our configuration apply groups
  interface_mode_group        = "ge0_mode"
  interface_description_group = "ge0_description"
  interface_vlans_group       = "ge0_vlans"

  // passing information into our provider
  source     = "./interfaces"
  providers  = { junos-ex-interfaces = junos-ex-interfaces }
  depends_on = [junos-ex-interfaces_destroycommit.commit-main]
}

module "iface_ge1" {
  // interface ge-0/0/1 description "tf: Raspberry Pi"
  // interface ge-0/0/1 unit 0 family ethernet switching interface-mode access vlan members VLAN_104"
  interface_name        = "ge-0/0/1"
  subinterface_unit     = "0"
  interface_description = "tf: Raspberry Pi"
  interface_mode        = "access"
  interface_vlans       = "VLAN_104"

  // name of our configuration apply groups
  interface_mode_group        = "ge1_mode"
  interface_description_group = "ge1_description"
  interface_vlans_group       = "ge1_vlans"

  // passing information into our provider
  source     = "./interfaces"
  providers  = { junos-ex-interfaces = junos-ex-interfaces }
  depends_on = [junos-ex-interfaces_destroycommit.commit-main]
}

module "iface_ge2" {
  // interface ge-0/0/2 description "tf: Raspberry Pi"
  // interface ge-0/0/2 unit 0 family ethernet switching interface-mode access vlan members VLAN_104"
  interface_name        = "ge-0/0/2"
  subinterface_unit     = "0"
  interface_description = "tf: Raspberry Pi"
  interface_mode        = "access"
  interface_vlans       = "VLAN_104"

  // name of our configuration apply groups
  interface_mode_group        = "ge2_mode"
  interface_description_group = "ge2_description"
  interface_vlans_group       = "ge2_vlans"

  // passing information into our provider
  source     = "./interfaces"
  providers  = { junos-ex-interfaces = junos-ex-interfaces }
  depends_on = [junos-ex-interfaces_destroycommit.commit-main]
}

module "iface_ge3" {
  // interface ge-0/0/3 description "tf: Raspberry Pi"
  // interface ge-0/0/3 unit 0 family ethernet switching interface-mode access vlan members VLAN_104"
  interface_name        = "ge-0/0/3"
  subinterface_unit     = "0"
  interface_description = "tf: Raspberry Pi"
  interface_mode        = "access"
  interface_vlans       = "VLAN_104"

  // name of our configuration apply groups
  interface_mode_group        = "ge3_mode"
  interface_description_group = "ge3_description"
  interface_vlans_group       = "ge3_vlans"

  // passing information into our provider
  source     = "./interfaces"
  providers  = { junos-ex-interfaces = junos-ex-interfaces }
  depends_on = [junos-ex-interfaces_destroycommit.commit-main]
}

module "iface_ge4" {
  // interface ge-0/0/4 description "tf: Raspberry Pi"
  // interface ge-0/0/4 unit 0 family ethernet switching interface-mode access vlan members VLAN_104"
  interface_name        = "ge-0/0/4"
  subinterface_unit     = "0"
  interface_description = "tf: Raspberry Pi"
  interface_mode        = "access"
  interface_vlans       = "VLAN_104"

  // name of our configuration apply groups
  interface_mode_group        = "ge4_mode"
  interface_description_group = "ge4_description"
  interface_vlans_group       = "ge4_vlans"

  // passing information into our provider
  source     = "./interfaces"
  providers  = { junos-ex-interfaces = junos-ex-interfaces }
  depends_on = [junos-ex-interfaces_destroycommit.commit-main]
}

module "iface_ge5" {
  // interface ge-0/0/5 description "tf: Raspberry Pi"
  // interface ge-0/0/5 unit 0 family ethernet switching interface-mode access vlan members VLAN_104"
  interface_name        = "ge-0/0/5"
  subinterface_unit     = "0"
  interface_description = "tf: Raspberry Pi"
  interface_mode        = "access"
  interface_vlans       = "VLAN_104"

  // name of our configuration apply groups
  interface_mode_group        = "ge5_mode"
  interface_description_group = "ge5_description"
  interface_vlans_group       = "ge5_vlans"

  // passing information into our provider
  source     = "./interfaces"
  providers  = { junos-ex-interfaces = junos-ex-interfaces }
  depends_on = [junos-ex-interfaces_destroycommit.commit-main]
}

module "iface_ge11" {
  // interface ge-0/0/11 description "tf: uplink to closet"
  // interface ge-0/0/11 unit 0 family ethernet switching interface-mode trunk vlan members all"
  interface_name        = "ge-0/0/11"
  subinterface_unit     = "0"
  interface_description = "tf: Raspberuplink to closet"
  interface_mode        = "trunk"
  interface_vlans       = "all"

  // name of our configuration apply groups
  interface_mode_group        = "ge11_mode"
  interface_description_group = "ge11_description"
  interface_vlans_group       = "ge11_vlans"

  // passing information into our provider
  source     = "./interfaces"
  providers  = { junos-ex-interfaces = junos-ex-interfaces }
  depends_on = [junos-ex-interfaces_destroycommit.commit-main]
}

provider "junos-ex-vlans" {
  host     = "office"
  port     = var.juniper_ssh_port
  sshkey   = var.juniper_ssh_key
  username = var.juniper_user_name
  password = var.juniper_user_password
}

module "vlan_101" {
  // vlans VLAN_101 vlan-id 101 description "tf: devops VLAN"
  vlan_name              = "VLAN_101"
  vlan_description       = "tf: dns VLAN"
  vlan_description_group = "vlan101_description"
  vlan_id                = "101"
  vlan_id_group          = "vlan101_id"

  // passing information into our provider
  source     = "./vlans"
  providers  = { junos-ex-vlans = junos-ex-vlans }
  depends_on = [junos-ex-vlans_destroycommit.commit-main]
}

module "vlan_102" {
  // vlans VLAN_102 vlan-id 102 description "tf: dhcp VLAN"
  vlan_name              = "VLAN_102"
  vlan_description       = "tf: dhcp VLAN"
  vlan_description_group = "vlan102_description"
  vlan_id                = "102"
  vlan_id_group          = "vlan102_id"

  // passing information into our provider
  source     = "./vlans"
  providers  = { junos-ex-vlans = junos-ex-vlans }
  depends_on = [junos-ex-vlans_destroycommit.commit-main]
}

module "vlan_103" {
  // vlans VLAN_103 vlan-id 103 description "tf: devops VLAN"
  vlan_name              = "VLAN_103"
  vlan_description       = "tf: devops VLAN"
  vlan_description_group = "vlan103_description"
  vlan_id                = "103"
  vlan_id_group          = "vlan103_id"

  // passing information into our provider
  source     = "./vlans"
  providers  = { junos-ex-vlans = junos-ex-vlans }
  depends_on = [junos-ex-vlans_destroycommit.commit-main]
}

module "vlan_104" {
  // vlans VLAN_104 vlan-id 104 description "tf: devops VLAN"
  vlan_name              = "VLAN_104"
  vlan_description       = "tf: network services VLAN"
  vlan_description_group = "vlan104_description"
  vlan_id                = "104"
  vlan_id_group          = "vlan104_id"

  // passing information into our provider
  source     = "./vlans"
  providers  = { junos-ex-vlans = junos-ex-vlans }
  depends_on = [junos-ex-vlans_destroycommit.commit-main]
}

module "vlan_105" {
  // vlans VLAN_105 vlan-id 105 l3-interface irb.105 description "tf: management VLAN"
  vlan_name              = "VLAN_105"
  vlan_description       = "tf: network management VLAN"
  vlan_description_group = "vlan105_description"
  vlan_id                = "105"
  vlan_id_group          = "vlan105_id"
  vlan_l3iface           = "irb.105"
  vlan_l3iface_group     = "vlan105_l3_iface"

  // passing information into our provider
  source     = "./vlans_routed"
  providers  = { junos-ex-vlans = junos-ex-vlans }
  depends_on = [junos-ex-vlans_destroycommit.commit-main]
}

resource "junos-ex-interfaces_commit" "commit-main" {
  resource_name = "commit"
  depends_on = [
    module.iface_ge0,
    module.iface_ge1,
    module.iface_ge2,
    module.iface_ge3,
    module.iface_ge4,
    module.iface_ge5,
    module.iface_ge11
  ]
}

resource "junos-ex-interfaces_destroycommit" "commit-main" {
  resource_name = "destroycommit"
}

resource "junos-ex-vlans_commit" "commit-main" {
  resource_name = "commit"
  depends_on = [
    module.vlan_101,
    module.vlan_102,
    module.vlan_103,
    module.vlan_104,
    module.vlan_105
  ]
}

resource "junos-ex-vlans_destroycommit" "commit-main" {
  resource_name = "destroycommit"
}
