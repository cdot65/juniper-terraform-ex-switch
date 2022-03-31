# Juniper Terraform Example: Configure EX switch

[![N|Solid](https://raw.githubusercontent.com/cdot65/juniper-terraform-srx/dev/site/content/assets/images/topology.png)](https://juniper.net/)

## Overview

The goal of this project is to provide an example method to interact with Juniper EX products with Terraform.

This project will build

- create vlan with a name of VLAN_103
- apply a description of `tf: devops VLAN` to our new vlan
- associate a routed interface to this vlan

```
VLAN_103 {
    description "tf: devops VLAN";
    vlan-id 103;
}
```

- create interface `ge-0/0/0`
- apply a description of `tf: Raspberry Pi` to our new interface
- create a sub-interface of `ge-0/0/0` with a unit ID of `0`
- set interface `ge-0/0/0.0` to ethernet-switching family
- configure interfage `ge-0/0/0.0` in access mode
- assign vlan `VLAN_104` to the interface

```
ge-0/0/0 {
    description "tf: Raspberry Pi";
    unit 0 {
        family ethernet-switching {
            interface-mode access;
            vlan {
                members VLAN_104;
            }
        }
    }
}
```

## 📋 Terraform version compatibility

This project was tested with Terraform version v1.1.7

## 🚀 Deploy

```bash
terraform init
terraform plan
terraform apply
```

## Development

Want to contribute? Great!

Submit a PR and let's work on this together :D
