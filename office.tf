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

module "interfaces" {
  // interface ge-0/0/0 description "tf: Raspberry Pi"
  // interface ge-0/0/0 unit 0 family ethernet switching vlan members VLAN_104"
  interface_name        = "ge-0/0/0"
  interface_description = "tf: Raspberry Pi"
  subinterface_unit     = "0"
  interface_vlan        = "VLAN_104"

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
  vlan_description       = "tf: management VLAN"
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
  depends_on    = [module.interfaces]
}

resource "junos-ex-interfaces_destroycommit" "commit-main" {
  resource_name = "destroycommit"
}

resource "junos-ex-vlans_commit" "commit-main" {
  resource_name = "commit"
  depends_on    = [module.vlan_101, module.vlan_102, module.vlan_103, module.vlan_104, module.vlan_105]
}

resource "junos-ex-vlans_destroycommit" "commit-main" {
  resource_name = "destroycommit"
}
