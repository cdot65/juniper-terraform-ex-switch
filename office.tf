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

module "vlans" {
  // vlans VLAN_103 vlan-id 103 description "tf: devops VLAN"
  vlan_name        = "VLAN_103"
  vlan_description = "tf: devops VLAN"
  vlan_id          = "103"

  // passing information into our provider
  source     = "./vlans"
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
  depends_on    = [module.vlans]
}

resource "junos-ex-vlans_destroycommit" "commit-main" {
  resource_name = "destroycommit"
}
