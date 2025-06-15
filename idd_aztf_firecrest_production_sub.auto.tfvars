############################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub  #
############################################################################################
##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\availability_set.auto.tfvars.disabled  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

availability_sets = {

    as-idamtier0-DC-ukw =    {    
        name        =    "as-idamtier0-DC-ukw "        
        resource_group_name        =    "rg-firecrestsub"        
        location        =    "ukwest"        
        platform_fault_domain_count        =    "2"        
        platform_update_domain_count        =    "5"    
        tags       = {        
            Provisioner      = "Terraform"                
            Subscription        =    "idd_firecrest_production_idam_sub"      
        } 
     },
    
    
    as-idamtier1-DNS-ukw=    {    
        name        =    "as-idamtier1-DNS-ukw"        
        resource_group_name        =    "rg-idamtier0"        
        location        =    "ukwest"        
        platform_fault_domain_count        =    "2"        
        platform_update_domain_count        =    "5"    
        tags       = {        
            Provisioner      = "Terraform"              
            Subscription        =    "idd_firecrest_production_sub"     
         }  
    },
    
    
    as-network-PAFW-UKW=    {    
        name        =    "as-network-PAFW-UKW"        
        resource_group_name        =    "rg-paloalto"        
        location        =    "ukwest"        
        platform_fault_domain_count        =    "2"        
        platform_update_domain_count        =    "5"    
        tags       = {        
            Provisioner      = "Terraform"               
            Subscription        =    "idd_firecrest_production_hub_network_sub"      
        }  
    }

}

##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\backup_policy_vm.auto.tfvars.disabled  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

backup_policy_vms = {

    bp-idamtier0vm-uks  =    {    
        name        =    "bp-idamtier0vm-uks"        
        resource_group_name        =    "rg-idadamtier0-backup"       
        recovery_vault_name        =    "rsv-idamtier0-uks" 
              
        backup =   {   
             frequency  =    "Daily"   
             time       =    "23:00"
        },
        retention_monthly   =   {
            count    = 6
            weekdays = ["Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday"]
            weeks    = ["First"]
        },
        
        tags       = {        
            Provisioner      =  "Terraform"                
            Subscription        =    "idd_firecrest_production_idam_sub"      
        } 
    },

    bp-idamtier0vm-ukw  =    {    
            name        =    "bp-idamtier0vm-ukw"        
            resource_group_name        =    "rg-idadamtier0-backup"        
            recovery_vault_name        =    "rsv-idamtier0-ukw"        
            backup =   {   
                frequency  =    "Daily"   
                time       =    "23:00"
            },
            retention_monthly   =   {
                count    = 6
                weekdays = ["Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday"]
                weeks    = ["First"]
            }, 

            tags       = {        
                Provisioner      =  "Terraform"                
                Subscription        =    "idd_firecrest_production_idam_sub"      
            }  
        },
        
    bp-firecrestvm-uks  =    {    
        name        =    "bp-firecrestvm-uks"        
        resource_group_name        =    "rg-firecrestsub-backup"        
        recovery_vault_name        =    "rsv-firecrestsub-VM-uks"        
        backup =   {   
            frequency  =    "Daily"   
            time       =    "23:00"
        },
        retention_monthly   =   {
            count    = 6
            weekdays = ["Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday"]
            weeks    = ["First"]
        },    
        
        tags       = {        
            Provisioner      =  "Terraform"                
            Subscription        =    "idd_firecrest_production_sub"      
        }  
    },
        
    bp-firecrestvm-ukw  =    {    
        name        =    "bp-firecrestvm-ukw"        
        resource_group_name        =    "rg-firecrestsub-backup"        
        recovery_vault_name        =    "rsv-firecrestsub-VM-ukw" 
        backup =   {   
            frequency  =    "Daily"   
            time       =    "23:00"
        },
        retention_monthly   =   {
            count    = 6
            weekdays = ["Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday"]
            weeks    = ["First"]
        },     
        
        tags       = {        
            Provisioner      =  "Terraform"                
            Subscription        =    "idd_firecrest_production_sub"      
        }  
    },
        
    bp-onprem   =    {    
        name        =    "bp-onprem"        
        resource_group_name        =    "rg-onprembackup"        
        recovery_vault_name        =    "rsv-management-onpremmars-uks"        
        backup =   {   
            frequency  =    "Daily"   
            time       =    "23:00"
        },
        retention_monthly   =   {
            count    = 6
            weekdays = ["Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday"]
            weeks    = ["First"]
        }, 
        
        tags       = {        
            Provisioner      =  "Terraform"                
            Subscription        =    "idd_firecrest_production_sub"      
            }  
    }

}
#############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\disk_access.auto.tfvars.disabled  #
#############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

disk_access   =   {

  da-firecrestsub-uks=    {    
    name        =    "da-firecrestsub-uks"        
    resource_group_name        =    "rg-firecrestsub-backup"        
    location        =    "uksouth"       
    tags = { 
      Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    } 
  }
  
  da-firecrestsub-ukw=    {    
    name        =    "da-firecrestsub-ukw"        
    resource_group_name        =    "rg-firecrestsub-backup"        
    location        =    "ukwest"        
    tags = { 
      Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    } 
  }

}
##################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\key_vault.auto.tfvars  #
##################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

key_vaults = {

  kvfcrest-nonprivend-uks = {
    # name           = "akvfirecrest-nonprivend-uks"
    name                = "kvfcrest-nonprivend-uks"
    resource_group_name = "rg-KeyVault-firecrestsub"
    location            = "uksouth"
    tenant_id           = "d3a2d0d3-7cc8-4f52-bbf9-85bd43d94279"
    sku                 = "standard"
    tags = {
      Provisioner = "Terraform"
      Description = "Long name: akvfirecrest-nonprivend-uks"
    }
  }

  kvfcrest-nonprivend-ukw = {
    # name           = "akvfirecrest-nonprivend-ukw"
    name                = "kvfcrest-nonprivend-ukw"
    resource_group_name = "rg-KeyVault-firecrestsub"
    location            = "ukwest"
    tenant_id           = "d3a2d0d3-7cc8-4f52-bbf9-85bd43d94279"
    sku                 = "standard"
    tags = {
      Provisioner = "Terraform"
      Description = "Long name: akvfirecrest-nonprivend-ukw"
    }
  }

  kvfcrest-privend-uks = {
    # name           = "akvfirecrest-privendpoint-uks"
    name                = "kvfcrest-privend-uks"
    resource_group_name = "rg-KeyVault-firecrestsub"
    location            = "uksouth"
    tenant_id           = "d3a2d0d3-7cc8-4f52-bbf9-85bd43d94279"
    sku                 = "standard"
    tags = {
      Provisioner = "Terraform"
      Description = "Long name: akvfirecrest-privendpoint-uks"
    }
  }

  kvfcrest-privend-ukw = {
    # name           = "akvfirecrest-privendpoint-ukw"
    name                = "kvfcrest-privend-ukw"
    resource_group_name = "rg-KeyVault-firecrestsub"
    location            = "ukwest"
    tenant_id           = "d3a2d0d3-7cc8-4f52-bbf9-85bd43d94279"
    sku                 = "standard"
    tags = {
      Provisioner = "Terraform"
      Description = "Long name: akvfirecrest-privendpoint-ukw"
    }
  }

}
##############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\managed_disk.auto.tfvars.disabled  #
##############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##########################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\network_interface.auto.tfvars  #
##########################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

network_interfaces = {

  INGBAZwDNS0102-nic1 = {
    name                = "INGBAZwDNS0102-nic1"
    resource_group_name = "rg-idam-tier1"
    location            = "ukwest"
    dns_servers         = ["10.93.17.5", " 10.93.17.6"]
    ip_configuration = {
      name                          = "INGBAZwDNS0102-nic1"
      # subnet_id                     = "sub-idamtier1-ukw" # Renamed? TBC
      subnet_id                     = "Subdnstier1-ukw"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.93.64.5"
    }

    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_sub"
      # Subscription = "idd_firecrest_production_idam_sub"
    }
  }

}
########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\network_security_group.auto.tfvars.disabled  #
########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\network_watcher.auto.tfvars.disabled  #
#################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\network_watcher_flow_log.auto.tfvars.disabled  #
##########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\private_dns_zone.auto.tfvars.disabled  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

private_dns_zones   =   {

  privatelink.vaultcore.azure.net =    {    
    name        =    "privatelink.vaultcore.azure.net"        
    resource_group_name        =    "rg-firecrestsub"         
    tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
    } 
  }
  
  privatelink.uks.backup.windowsazure.com =    {    
    name        =    "privatelink.uks.backup.windowsazure.com"        
    resource_group_name        =    "rg-firecrestsub"         
    tags = { 
      Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    } 
  }
  
  privatelink.blob.core.windows.net =    {    
    name        =    "privatelink.blob.core.windows.net"        
    resource_group_name        =    "rg-firecrestsub"         
    tags = { 
      Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    } 
  }
  
  privatelink.queue.core.windows.net  =    {    
    name        =    "privatelink.queue.core.windows.net"        
    resource_group_name        =    "rg-firecrestsub"         
    tags = { 
      Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    } 
  }
  
  azure.ukint.fco  =    {    
    name        =    "azure.ukint.fco"        
    resource_group_name        =    "rg-firecrestsub"         
    tags = { Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    } 
  }
  
  azure.ukint.fco =    {    
    name        =    "azure.ukint.fco"        
    resource_group_name        =    "rg-idam-tier0"         
    tags = { 
      Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    } 
  }

}


#######################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\private_dns_zone_virtual_network_link.auto.tfvars.disabled  #
#######################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

networprivate_dns_zone_virtual_network_links    =   {

    pdnslink-backupVault-uks  =    {    
      name        =    "pdnslink-backupVault-uks"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "privatelink.uks.backup.windowsazure.com"        
      virtual_network_id        =    "Vnet-Firecrest-uks"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-backupVault-ukw  =    {    
      name        =    "pdnslink-backupVault-ukw"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "privatelink.uks.backup.windowsazure.com"        
      virtual_network_id        =    "Vnet-Firecrest-ukw"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub"
      } 
    }
    
    pdnslink-storage-uks  =    {    
      name        =    "pdnslink-storage-uks"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "privatelink.blob.core.windows.net"        
      virtual_network_id        =    "Vnet-Firecrest-uks"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-storage-ukw  =    {    
      name        =    "pdnslink-storage-ukw"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "privatelink.blob.core.windows.net"        
      virtual_network_id        =    "Vnet-Firecrest-ukw"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-storageQueue-uks =    {    
      name        =    "pdnslink-storageQueue-uks"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =  "privatelink.queue.core.windows.net"        
      virtual_network_id        =    "Vnet-Firecrest-uks"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-storageQueue-ukw =    {    
      name        =    "pdnslink-storageQueue-ukw"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =  "privatelink.queue.core.windows.net"        
      virtual_network_id        =    "Vnet-Firecrest-ukw"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-KeyVault-uks =    {    
      name        =    "pdnslink-KeyVault-uks"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "privatelink.vaultcore.azure.net"        
      virtual_network_id        =    "Vnet-Firecrest-uks"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-KeyVault-ukw =    {    
      name        =    "pdnslink-KeyVault-ukw"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "privatelink.vaultcore.azure.net"        
      virtual_network_id        =    "Vnet-Firecrest-ukw"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-VMregistrationfirecrest-uks  =    {    
      name        =    "pdnslink-VMregistrationfirecrest-uks"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "azure.ukint.fco"        
      virtual_network_id        =    "Vnet-Firecrest-uks"        
      registration_enabled        =    "TRUE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-VMregistrationfirecrest-ukw  =    {    
      name        =    "pdnslink-VMregistrationfirecrest-ukw"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "azure.ukint.fco"        
      virtual_network_id        =    "Vnet-Firecrest-ukw"        
      registration_enabled        =    "TRUE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }

}


##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\private_endpoint.auto.tfvars.disabled  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###########################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\public_ip.auto.tfvars.disabled  #
###########################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\recovery_services_vault.auto.tfvars.disabled  #
#########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

recovery_services_vaults    =   {

    # rsv-idamtier0-VM-uks=    {    name        =    "rsv-idamtier0-VM-uks"        resource_group_name        =    "rg-idadamtier0-backup"        location     =   "uksouth"   sku        =    "standard"   identity        =    "SystemAssigned"    tags       = {        Provisioner      = "Terraform"                Subscription        =    "idd_firecrest_production_idam_sub"      }  }
    # rsv-idamtier0-VM-ukw=    {    name        =    "rsv-idamtier0-VM-ukw"        resource_group_name        =    "rg-idadamtier0-backup"        location     = "ukwest"  sku        =    "standard"   identity        =    "SystemAssigned"    tags       = {        Provisioner      = "Terraform"                Subscription        =    "idd_firecrest_production_idam_sub"      }  }
    
    rsv-idamtier0MARS-VM-uks=    {    
        name        =    "rsv-idamtier0MARS-VM-uks"        
        resource_group_name        =    "rg-idamtier0MARS-backup"        
        location    = "uksouth"
        sku        =    "standard"
        identity        =    "SystemAssigned"    
        tags       = {        
            Provisioner      = "Terraform"                
            Subscription     =    "idd_firecrest_production_sub"      
        }  
    }
    
    rsv-firecrestsub-mars-uks=    {    
        name        =    "rsv-firecrestsub-mars-uks"        
        resource_group_name        =    "rg-firecrestsub-backup"        
        location     = "uksouth"  
        sku        =    "standard"  
        identity        =    "SystemAssigned"    
        tags       = {        
            Provisioner      = "Terraform"                
            Subscription        =    "idd_firecrest_production_sub"      
        }  
    }
    
    rsv-firecrestsub-VM-uks=    {    
        name        =    "rsv-firecrestsub-VM-uks"        
        resource_group_name        =    "rg-firecrestsub-backup"        
        location     =   "uksouth" 
        sku        =    "standard"   
        identity        =    "SystemAssigned"    
        tags       = {        
            Provisioner      = "Terraform"                
            Subscription        =    "idd_firecrest_production_sub"      
        }  
    }
    
    rsv-firecrestsub-VM-ukw=    {    
        name        =    "rsv-firecrestsub-VM-ukw"       
         resource_group_name        =    "rg-firecrestsub-backup"        
         location     =   "ukwest"   
         sku        =    "standard"  
         identity        =    "SystemAssigned"    
         tags       = {        
             Provisioner      = "Terraform"                
             Subscription        =    "idd_firecrest_production_sub"      
        }  
    }
    
    rsv-firecrest-onpremmars-uks=    {    
        name        =    "rsv-firecrest-onpremmars-uks"        
        resource_group_name        =    "rg-firecrestsub-backup"        
        location   =   "uksouth"   
        sku        =    "standard" 
        identity        =    "SystemAssigned"    
        tags       = {        
            Provisioner      = "Terraform"                
            Subscription        =    "idd_firecrest_production_sub"      
        }  
    }

}
#######################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\resource_group.auto.tfvars  #
#######################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

resource_groups = {

  rg-firecrestsub = {
    name     = "rg-firecrestsub"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-terraform-state-firecrestsub = {
    name     = "rg-terraform-state-firecrestsub"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-KeyVault-firecrestsub = {
    name     = "rg-KeyVault-firecrestsub"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-bastion-firecrest = {
    name     = "rg-bastion-firecrest"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

   rg-idam-tier1 = {
    name     = "rg-idam-tier1"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-firecrest-netwatcher = {
    name     = "rg-firecrest-netwatcher"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-bastion-firecrest-netwatcher = {
    name     = "rg-bastion-firecrest-netwatcher"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-firecrestsub-backup = {
    name     = "rg-firecrestsub-backup"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-idamtier0MARS-backup = {
    name     = "rg-idamtier0MARS-backup"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-idamtier0-PE-keyvault = {
    name     = "rg-idamtier0-PE-keyvault"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

}
#################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\role_assignment.auto.tfvars.disabled  #
#################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

role_ assignments   =   {

    role-azure-bastion-firecrest=    {    
      scope        =    "rg-bastion-firecrest"        
      role_definition_name        =    "reader"        
      principal_id        =    "New Azure AD group called Azure-role-Firecrest-Azurebastion-Firecrest"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    role-RecoveryVaultPEaccessFirecrest=    {    
      scope        =    "rg-firecrestsub-backup"        
      role_definition_name        =    "Contributor"        
      principal_id        =    "This is the object ID of the managed identity for the Recovery service vault in Firecrest sub Ã¢â‚¬Å“rsv-firecrestsub-mars-uks" AND Ã¢â‚¬Å“rsv-firecrestsub-mars-ukw""         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    role-reader-firecrestsub=    {    
      scope        =    "Firecrest production sub"        
      role_definition_name        =    "Reader"        
      principal_id        =    "Azure-role-Firecest-sub-reader"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }

} 


#######################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\route.auto.tfvars.disabled  #
#######################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\route_table.auto.tfvars.disabled  #
#############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

########################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\storage_account.auto.tfvars  #
########################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

storage_accounts = {

  safcrestsubbootdiagsuks = {
    name                     = "safcrestsubbootdiagsuks"
    resource_group_name      = "rg-firecrestsub"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Description  = "Long name: safirecrestsubbootdiagnosticsuks"
      Purpose      = "Boot diag"
      Subscription = "idd_firecrest_production_sub"
    }
  }

  safcrestbootdiagsticsukw = {
    name                     = "safcrestbootdiagsticsukw"
    resource_group_name      = "rg-firecrestsub"
    location                 = "ukwest"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Description  = "Long name: safirecrestsubbootdiagnosticsukw"
      Purpose      = "Boot diag"
      Subscription = "idd_firecrest_production_sub"
    }
  }

  satfstatefcrestsub = {
    name                     = "satfstatefcrestsub"
    resource_group_name      = "rg-terraform-state-firecrestsub"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      Provisioner  = "Terraform"
      Description  = "Long name: saterraformstatefirecrestsub"
      Purpose      = "Terraform state file"
      Subscription = "idd_firecrest_production_sub"
    }
  }
  
}
###################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\storage_container.auto.tfvars.disabled  #
###################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

storage_containers = {

  tfstate-satstateprodsub   =    {    
    name        =    "tfstate-satstateprodsub"        
    storage_account_name        =    "satfstatefcrestsub"        
    container_access_type  =    "blob"         
    tags = { 
      Provisioner   = "Terraform"
      Description   = "Long name: tfstate-saterraformstateproductionsub"         
      Subscription  = "idd_firecrest_production_sub" 
    } 
  }

}
###############################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\subnet.auto.tfvars  #
###############################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

subnets = {

  sub-dnstier1-uks    =    {    
    name        =    "sub-dnstier1-uks"        
    # resource_group_name        =    "rg-idamtier0" # Is this correct?
    resource_group_name        =    "rg-firecrestsub"       
    location        =    "uksouth"        
    virtual_network_name        =    "Vnet-Firecrest-uks"        
    address_prefixes        =    ["10.82.64.0/24"]         
    tags = { 
      Provisioner = "Terraform"        
      Subscription     =    "idd_firecrest_production_sub" 
    } 
  }

  Subdnstier1-ukw   =    {    
    name        =    "Subdnstier1-ukw"        
    # resource_group_name        =    "rg-idamtier0-dc" # Is this correct?
    resource_group_name        =    "rg-firecrestsub"       
    location        =    "ukwest"        
    virtual_network_name        =    "Vnet-Firecrest-ukw"        
    address_prefixes        =    ["10.93.64.0/24"]         
    tags = { 
      Provisioner = "Terraform"        
      Subscription     =    "idd_firecrest_production_sub" 
    } 
  }

  AzureBastionSubnet    =    {    
    name        =    "AzureBastionSubnet"        
    # resource_group_name        =    "rg-bastion-firecrest" 
    resource_group_name        =    "rg-firecrestsub"         
    location        =    "uksouth"        
    virtual_network_name        =    "Vnet-Firecrest-bastion-uks"        
    address_prefixes        =    ["10.82.97.0/26"]         
    tags = { 
      Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    }
  }

  ########
  # TBC
  ########
  
  # sub-idamtier1-ukw =    {    
  #   name        =    "sub-idamtier1-ukw"        
  #   # resource_group_name        =    "rg-idam-tier1" # Is this correct? Removed from design doc
  #   resource_group_name        =    "rg-firecrestsub"        
  #   location        =    "uksouth"
  #   virtual_network_name     =    "Vnet-Firecrest-ukw"
  #   address_prefixes        =    ["10.82.144.0/24"]    
  #   tags       = {        
  #     Provisioner      = "Terraform"                
  #     Description        =    "TBC"                
  #     Subscription        =    "idd_firecrest_production_sub"      
  #   }  
  # }


}
######################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\virtual_machine_data_disk_attachment.auto.tfvars.disabled  #
######################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

########################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\virtual_network.auto.tfvars  #
########################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

virtual_networks = {

  Vnet-Firecrest-uks = {
    name                = "Vnet-Firecrest-uks"
    resource_group_name = "rg-firecrestsub"
    location            = "uksouth"
    address_space       = ["10.82.64.0/19"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_sub"
    }
  },

  Vnet-Firecrest-ukw = {
    name                = "Vnet-Firecrest-ukw"
    resource_group_name = "rg-firecrestsub"
    location            = "ukwest"
    address_space       = ["10.93.64.0/19"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_sub"
    }
  },

  Vnet-Firecrest-bastion-uks = {
    name                = "Vnet-Firecrest-bastion-uks"
    resource_group_name = "rg-firecrestsub"
    location            = "uksouth"
    address_space       = ["10.82.97.0/24"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_sub"
    }
  }

}
####################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\virtual_network_dns_servers.auto.tfvars  #
####################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

virtual_network_dns_servers     =   {
  
    Vnet-Firecrest-uks=    {    
      name  = "Vnet-Firecrest-uks"
      # virtual_network_id        =    "Vnet-Firecrest-uks" 
      # virtual_network_id   =    "data.azurerm_virtual_network.Vnet-Firecrest-uks.id"
      dns_servers          =    ["10.82.17.5","10.82.17.6"]         
      tags = { 
        Provisioner = "Terraform"        
        Subscription       =    "idd_firecrest_production_sub" 
      } 
    }
    
    Vnet-Firecrest-ukw=    {    
      name  = "Vnet-Firecrest-ukw"
      # virtual_network_id        =    "Vnet-Firecrest-ukw"
      # virtual_network_id   =    "data.azurerm_virtual_network.Vnet-Firecrest-ukw.id"   
      dns_servers          =    ["10.93.17.5","10.93.17.6"]         
      tags = { 
        Provisioner = "Terraform"        
        Subscription       =    "idd_firecrest_production_sub" 
        } 
    }

}
#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\virtual_network_gateway.auto.tfvars.disabled  #
#########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\virtual_network_peering.auto.tfvars  #
################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

virtual_network_peerings = {

    vpfirecrestuksbastionuks=    {    
        name        =    "vpfirecrestuksbastionuks"        
        resource_group_name        =    "rg-firecrestsub"        
        virtual_network_name        =    "Vnet-Firecrest-uks"        
        # remote_virtual_network_id        =    "Vnet-Firecrest-bastion-uks"  
        remote_virtual_network_name        =   "Vnet-Firecrest-bastion-uks"      
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        use_remote_gateways        =    "false"         
        tags = { 
          Provisioner = "Terraform"        
          Subscription        =    "idd_firecrest_production_sub" 
        } 
      }
    
    vpbastionuksfirecrestuks=    {    
        name        =    "vpbastionuksfirecrestuks"        
        resource_group_name        =    "rg-firecrestsub"        
        virtual_network_name        =    "Vnet-Firecrest-bastion-uks"        
        # remote_virtual_network_id        =    "Vnet-Firecrest-uks" 
        remote_virtual_network_name        =        "Vnet-Firecrest-uks"
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        use_remote_gateways        =    "false"         
        tags = { 
          Provisioner = "Terraform"        
          Subscription        =    "idd_firecrest_production_sub" 
        } 
      }
    
    vpfirecrestuksbastionukw=    {    
        name        =    "vpfirecrestuksbastionukw"        
        resource_group_name        =    "rg-firecrestsub"        
        virtual_network_name        =    "Vnet-Firecrest-ukw"        
        # remote_virtual_network_id        =    "Vnet-Firecrest-bastion-uks"
        remote_virtual_network_name        =       "Vnet-Firecrest-bastion-uks"
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        # use_remote_gateways        =    "true" # Gateway required?  
        use_remote_gateways        =    "false"        
        tags = { 
          Provisioner = "Terraform"        
          Subscription        =    "idd_firecrest_production_sub" 
          Notes               =    "Gateway required?"
        } 
      }
    
    vpfirecrestukwbastionuks=    {    
        name        =    "vpfirecrestukwbastionuks"        
        resource_group_name        =    "rg-firecrestsub"        
        virtual_network_name        =    "Vnet-Firecrest-bastion-uks"        
        # remote_virtual_network_id        =    "Vnet-Firecrest-ukw"  
        remote_virtual_network_name        =      "Vnet-Firecrest-ukw"   
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        # use_remote_gateways        =    "true"  # Gateway required?  
         use_remote_gateways        =    "false"    
        tags = { 
          Provisioner = "Terraform"        
          Subscription        =    "idd_firecrest_production_sub" 
          Notes               =    "Gateway required?"
        } 
    }

}
#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\windows_virtual_machine.auto.tfvars.disabled  #
#########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

############################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub  #
############################################################################################
##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\availability_set.auto.tfvars.disabled  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

availability_sets = {
    
    as-idamtier1-DNS-ukw=    {    
        name        =    "as-idamtier1-DNS-ukw"        
        resource_group_name        =    "rg-idamtier0"        
        location        =    "ukwest"        
        platform_fault_domain_count        =    "2"        
        platform_update_domain_count        =    "5"    
        tags       = {        
            Provisioner      = "Terraform"              
            Subscription        =    "idd_firecrest_production_sub"     
         }  
    }

}

##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\backup_policy_vm.auto.tfvars.disabled  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

backup_policy_vms = {

    bp-idamtier0vm-uks  =    {    
        name        =    "bp-idamtier0vm-uks"        
        resource_group_name        =    "rg-idadamtier0-backup"       
        recovery_vault_name        =    "rsv-idamtier0-uks" 
              
        backup =   {   
             frequency  =    "Daily"   
             time       =    "23:00"
        },
        retention_monthly   =   {
            count    = 6
            weekdays = ["Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday"]
            weeks    = ["First"]
        },
        
        tags       = {        
            Provisioner      =  "Terraform"                
            Subscription        =    "idd_firecrest_production_idam_sub"      
        } 
    },

    bp-idamtier0vm-ukw  =    {    
            name        =    "bp-idamtier0vm-ukw"        
            resource_group_name        =    "rg-idadamtier0-backup"        
            recovery_vault_name        =    "rsv-idamtier0-ukw"        
            backup =   {   
                frequency  =    "Daily"   
                time       =    "23:00"
            },
            retention_monthly   =   {
                count    = 6
                weekdays = ["Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday"]
                weeks    = ["First"]
            }, 

            tags       = {        
                Provisioner      =  "Terraform"                
                Subscription        =    "idd_firecrest_production_idam_sub"      
            }  
        },
        
    bp-firecrestvm-uks  =    {    
        name        =    "bp-firecrestvm-uks"        
        resource_group_name        =    "rg-firecrestsub-backup"        
        recovery_vault_name        =    "rsv-firecrestsub-VM-uks"        
        backup =   {   
            frequency  =    "Daily"   
            time       =    "23:00"
        },
        retention_monthly   =   {
            count    = 6
            weekdays = ["Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday"]
            weeks    = ["First"]
        },    
        
        tags       = {        
            Provisioner      =  "Terraform"                
            Subscription        =    "idd_firecrest_production_sub"      
        }  
    },
        
    bp-firecrestvm-ukw  =    {    
        name        =    "bp-firecrestvm-ukw"        
        resource_group_name        =    "rg-firecrestsub-backup"        
        recovery_vault_name        =    "rsv-firecrestsub-VM-ukw" 
        backup =   {   
            frequency  =    "Daily"   
            time       =    "23:00"
        },
        retention_monthly   =   {
            count    = 6
            weekdays = ["Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday"]
            weeks    = ["First"]
        },     
        
        tags       = {        
            Provisioner      =  "Terraform"                
            Subscription        =    "idd_firecrest_production_sub"      
        }  
    },
        
    bp-onprem   =    {    
        name        =    "bp-onprem"        
        resource_group_name        =    "rg-onprembackup"        
        recovery_vault_name        =    "rsv-management-onpremmars-uks"        
        backup =   {   
            frequency  =    "Daily"   
            time       =    "23:00"
        },
        retention_monthly   =   {
            count    = 6
            weekdays = ["Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday"]
            weeks    = ["First"]
        }, 
        
        tags       = {        
            Provisioner      =  "Terraform"                
            Subscription        =    "idd_firecrest_production_sub"      
            }  
    }

}
#############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\disk_access.auto.tfvars.disabled  #
#############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

disk_access   =   {

  da-firecrestsub-uks=    {    
    name        =    "da-firecrestsub-uks"        
    resource_group_name        =    "rg-firecrestsub-backup"        
    location        =    "uksouth"       
    tags = { 
      Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    } 
  }
  
  da-firecrestsub-ukw=    {    
    name        =    "da-firecrestsub-ukw"        
    resource_group_name        =    "rg-firecrestsub-backup"        
    location        =    "ukwest"        
    tags = { 
      Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    } 
  }

}
##################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\key_vault.auto.tfvars  #
##################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

key_vaults = {

  kvfcrest-nonprivend-uks = {
    # name           = "akvfirecrest-nonprivend-uks"
    name                = "kvfcrest-nonprivend-uks"
    resource_group_name = "rg-KeyVault-firecrestsub"
    location            = "uksouth"
    tenant_id           = "d3a2d0d3-7cc8-4f52-bbf9-85bd43d94279"
    sku                 = "standard"
    tags = {
      Provisioner = "Terraform"
      Description = "Long name: akvfirecrest-nonprivend-uks"
    }
  }

  kvfcrest-nonprivend-ukw = {
    # name           = "akvfirecrest-nonprivend-ukw"
    name                = "kvfcrest-nonprivend-ukw"
    resource_group_name = "rg-KeyVault-firecrestsub"
    location            = "ukwest"
    tenant_id           = "d3a2d0d3-7cc8-4f52-bbf9-85bd43d94279"
    sku                 = "standard"
    tags = {
      Provisioner = "Terraform"
      Description = "Long name: akvfirecrest-nonprivend-ukw"
    }
  }

  kvfcrest-privend-uks = {
    # name           = "akvfirecrest-privendpoint-uks"
    name                = "kvfcrest-privend-uks"
    resource_group_name = "rg-KeyVault-firecrestsub"
    location            = "uksouth"
    tenant_id           = "d3a2d0d3-7cc8-4f52-bbf9-85bd43d94279"
    sku                 = "standard"
    tags = {
      Provisioner = "Terraform"
      Description = "Long name: akvfirecrest-privendpoint-uks"
    }
  }

  kvfcrest-privend-ukw = {
    # name           = "akvfirecrest-privendpoint-ukw"
    name                = "kvfcrest-privend-ukw"
    resource_group_name = "rg-KeyVault-firecrestsub"
    location            = "ukwest"
    tenant_id           = "d3a2d0d3-7cc8-4f52-bbf9-85bd43d94279"
    sku                 = "standard"
    tags = {
      Provisioner = "Terraform"
      Description = "Long name: akvfirecrest-privendpoint-ukw"
    }
  }

}
##############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\managed_disk.auto.tfvars.disabled  #
##############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\network_interface.auto.tfvars.disabled  #
###################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

network_interfaces = {

  INGBAZwDNS0102-nic1 = {
    name                = "INGBAZwDNS0102-nic1"
    resource_group_name = "rg-idam-tier1"
    location            = "ukwest"
    dns_servers         = ["10.93.17.5", " 10.93.17.6"]
    ip_configuration = {
      name                          = "INGBAZwDNS0102-nic1"
      # subnet_id                     = "sub-idamtier1-ukw" # Renamed? TBC
      subnet_id                     = "Subdnstier1-ukw"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.93.64.5"
    }

    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_sub"
      # Subscription = "idd_firecrest_production_idam_sub"
    }
  }

}
########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\network_security_group.auto.tfvars.disabled  #
########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\network_watcher.auto.tfvars.disabled  #
#################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\network_watcher_flow_log.auto.tfvars.disabled  #
##########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\private_dns_zone.auto.tfvars.disabled  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

private_dns_zones   =   {

  privatelink.vaultcore.azure.net =    {    
    name        =    "privatelink.vaultcore.azure.net"        
    resource_group_name        =    "rg-firecrestsub"         
    tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
    } 
  }
  
  privatelink.uks.backup.windowsazure.com =    {    
    name        =    "privatelink.uks.backup.windowsazure.com"        
    resource_group_name        =    "rg-firecrestsub"         
    tags = { 
      Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    } 
  }
  
  privatelink.blob.core.windows.net =    {    
    name        =    "privatelink.blob.core.windows.net"        
    resource_group_name        =    "rg-firecrestsub"         
    tags = { 
      Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    } 
  }
  
  privatelink.queue.core.windows.net  =    {    
    name        =    "privatelink.queue.core.windows.net"        
    resource_group_name        =    "rg-firecrestsub"         
    tags = { 
      Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    } 
  }
  
  azure.ukint.fco  =    {    
    name        =    "azure.ukint.fco"        
    resource_group_name        =    "rg-firecrestsub"         
    tags = { Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    } 
  }
  
  azure.ukint.fco =    {    
    name        =    "azure.ukint.fco"        
    resource_group_name        =    "rg-idam-tier0"         
    tags = { 
      Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    } 
  }

}


#######################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\private_dns_zone_virtual_network_link.auto.tfvars.disabled  #
#######################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

networprivate_dns_zone_virtual_network_links    =   {

    pdnslink-backupVault-uks  =    {    
      name        =    "pdnslink-backupVault-uks"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "privatelink.uks.backup.windowsazure.com"        
      virtual_network_id        =    "Vnet-Firecrest-uks"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-backupVault-ukw  =    {    
      name        =    "pdnslink-backupVault-ukw"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "privatelink.uks.backup.windowsazure.com"        
      virtual_network_id        =    "Vnet-Firecrest-ukw"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub"
      } 
    }
    
    pdnslink-storage-uks  =    {    
      name        =    "pdnslink-storage-uks"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "privatelink.blob.core.windows.net"        
      virtual_network_id        =    "Vnet-Firecrest-uks"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-storage-ukw  =    {    
      name        =    "pdnslink-storage-ukw"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "privatelink.blob.core.windows.net"        
      virtual_network_id        =    "Vnet-Firecrest-ukw"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-storageQueue-uks =    {    
      name        =    "pdnslink-storageQueue-uks"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =  "privatelink.queue.core.windows.net"        
      virtual_network_id        =    "Vnet-Firecrest-uks"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-storageQueue-ukw =    {    
      name        =    "pdnslink-storageQueue-ukw"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =  "privatelink.queue.core.windows.net"        
      virtual_network_id        =    "Vnet-Firecrest-ukw"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-KeyVault-uks =    {    
      name        =    "pdnslink-KeyVault-uks"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "privatelink.vaultcore.azure.net"        
      virtual_network_id        =    "Vnet-Firecrest-uks"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-KeyVault-ukw =    {    
      name        =    "pdnslink-KeyVault-ukw"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "privatelink.vaultcore.azure.net"        
      virtual_network_id        =    "Vnet-Firecrest-ukw"        
      registration_enabled        =    "FALSE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-VMregistrationfirecrest-uks  =    {    
      name        =    "pdnslink-VMregistrationfirecrest-uks"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "azure.ukint.fco"        
      virtual_network_id        =    "Vnet-Firecrest-uks"        
      registration_enabled        =    "TRUE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    pdnslink-VMregistrationfirecrest-ukw  =    {    
      name        =    "pdnslink-VMregistrationfirecrest-ukw"        
      resource_group_name        =    "rg-firecrestsub"        
      private_dns_zone_name        =    "azure.ukint.fco"        
      virtual_network_id        =    "Vnet-Firecrest-ukw"        
      registration_enabled        =    "TRUE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }

}


##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\private_endpoint.auto.tfvars.disabled  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###########################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\public_ip.auto.tfvars.disabled  #
###########################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\recovery_services_vault.auto.tfvars.disabled  #
#########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

recovery_services_vaults    =   {

    # rsv-idamtier0-VM-uks=    {    name        =    "rsv-idamtier0-VM-uks"        resource_group_name        =    "rg-idadamtier0-backup"        location     =   "uksouth"   sku        =    "standard"   identity        =    "SystemAssigned"    tags       = {        Provisioner      = "Terraform"                Subscription        =    "idd_firecrest_production_idam_sub"      }  }
    # rsv-idamtier0-VM-ukw=    {    name        =    "rsv-idamtier0-VM-ukw"        resource_group_name        =    "rg-idadamtier0-backup"        location     = "ukwest"  sku        =    "standard"   identity        =    "SystemAssigned"    tags       = {        Provisioner      = "Terraform"                Subscription        =    "idd_firecrest_production_idam_sub"      }  }
    
    rsv-idamtier0MARS-VM-uks=    {    
        name        =    "rsv-idamtier0MARS-VM-uks"        
        resource_group_name        =    "rg-idamtier0MARS-backup"        
        location    = "uksouth"
        sku        =    "standard"
        identity        =    "SystemAssigned"    
        tags       = {        
            Provisioner      = "Terraform"                
            Subscription     =    "idd_firecrest_production_sub"      
        }  
    }
    
    rsv-firecrestsub-mars-uks=    {    
        name        =    "rsv-firecrestsub-mars-uks"        
        resource_group_name        =    "rg-firecrestsub-backup"        
        location     = "uksouth"  
        sku        =    "standard"  
        identity        =    "SystemAssigned"    
        tags       = {        
            Provisioner      = "Terraform"                
            Subscription        =    "idd_firecrest_production_sub"      
        }  
    }
    
    rsv-firecrestsub-VM-uks=    {    
        name        =    "rsv-firecrestsub-VM-uks"        
        resource_group_name        =    "rg-firecrestsub-backup"        
        location     =   "uksouth" 
        sku        =    "standard"   
        identity        =    "SystemAssigned"    
        tags       = {        
            Provisioner      = "Terraform"                
            Subscription        =    "idd_firecrest_production_sub"      
        }  
    }
    
    rsv-firecrestsub-VM-ukw=    {    
        name        =    "rsv-firecrestsub-VM-ukw"       
         resource_group_name        =    "rg-firecrestsub-backup"        
         location     =   "ukwest"   
         sku        =    "standard"  
         identity        =    "SystemAssigned"    
         tags       = {        
             Provisioner      = "Terraform"                
             Subscription        =    "idd_firecrest_production_sub"      
        }  
    }
    
    rsv-firecrest-onpremmars-uks=    {    
        name        =    "rsv-firecrest-onpremmars-uks"        
        resource_group_name        =    "rg-firecrestsub-backup"        
        location   =   "uksouth"   
        sku        =    "standard" 
        identity        =    "SystemAssigned"    
        tags       = {        
            Provisioner      = "Terraform"                
            Subscription        =    "idd_firecrest_production_sub"      
        }  
    }

}
#######################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\resource_group.auto.tfvars  #
#######################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

resource_groups = {

  rg-firecrestsub = {
    name     = "rg-firecrestsub"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-terraform-state-firecrestsub = {
    name     = "rg-terraform-state-firecrestsub"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-KeyVault-firecrestsub = {
    name     = "rg-KeyVault-firecrestsub"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-bastion-firecrest = {
    name     = "rg-bastion-firecrest"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

   rg-idam-tier1 = {
    name     = "rg-idam-tier1"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-firecrest-netwatcher = {
    name     = "rg-firecrest-netwatcher"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-bastion-firecrest-netwatcher = {
    name     = "rg-bastion-firecrest-netwatcher"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-firecrestsub-backup = {
    name     = "rg-firecrestsub-backup"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-idamtier0MARS-backup = {
    name     = "rg-idamtier0MARS-backup"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

  rg-idamtier0-PE-keyvault = {
    name     = "rg-idamtier0-PE-keyvault"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
    # location = var.global_settings.regions[lookup(var.settings, "region", var.global_settings.default_region)]
    #  tags = merge(
    #    var.tags,
    #    lookup(var.settings, "tags", {})
    #  )
  }

}
#################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\role_assignment.auto.tfvars.disabled  #
#################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

role_ assignments   =   {

    role-azure-bastion-firecrest=    {    
      scope        =    "rg-bastion-firecrest"        
      role_definition_name        =    "reader"        
      principal_id        =    "New Azure AD group called Azure-role-Firecrest-Azurebastion-Firecrest"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    role-RecoveryVaultPEaccessFirecrest=    {    
      scope        =    "rg-firecrestsub-backup"        
      role_definition_name        =    "Contributor"        
      principal_id        =    "This is the object ID of the managed identity for the Recovery service vault in Firecrest sub Ã¢â‚¬Å“rsv-firecrestsub-mars-uks" AND Ã¢â‚¬Å“rsv-firecrestsub-mars-ukw""         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }
    
    role-reader-firecrestsub=    {    
      scope        =    "Firecrest production sub"        
      role_definition_name        =    "Reader"        
      principal_id        =    "Azure-role-Firecest-sub-reader"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_sub" 
      } 
    }

} 


#######################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\route.auto.tfvars.disabled  #
#######################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\route_table.auto.tfvars.disabled  #
#############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

########################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\storage_account.auto.tfvars  #
########################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

storage_accounts = {

  safcrestsubbootdiagsuks = {
    name                     = "safcrestsubbootdiagsuks"
    resource_group_name      = "rg-firecrestsub"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Description  = "Long name: safirecrestsubbootdiagnosticsuks"
      Purpose      = "Boot diag"
      Subscription = "idd_firecrest_production_sub"
    }
  }

  safcrestbootdiagsticsukw = {
    name                     = "safcrestbootdiagsticsukw"
    resource_group_name      = "rg-firecrestsub"
    location                 = "ukwest"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Description  = "Long name: safirecrestsubbootdiagnosticsukw"
      Purpose      = "Boot diag"
      Subscription = "idd_firecrest_production_sub"
    }
  }

  satfstatefcrestsub = {
    name                     = "satfstatefcrestsub"
    resource_group_name      = "rg-terraform-state-firecrestsub"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      Provisioner  = "Terraform"
      Description  = "Long name: saterraformstatefirecrestsub"
      Purpose      = "Terraform state file"
      Subscription = "idd_firecrest_production_sub"
    }
  }
  
}
###################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\storage_container.auto.tfvars.disabled  #
###################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

storage_containers = {

  tfstate-satstateprodsub   =    {    
    name        =    "tfstate-satstateprodsub"        
    storage_account_name        =    "satfstatefcrestsub"        
    container_access_type  =    "blob"         
    tags = { 
      Provisioner   = "Terraform"
      Description   = "Long name: tfstate-saterraformstateproductionsub"         
      Subscription  = "idd_firecrest_production_sub" 
    } 
  }

}
###############################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\subnet.auto.tfvars  #
###############################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

subnets = {

  sub-dnstier1-uks    =    {    
    name        =    "sub-dnstier1-uks"        
    # resource_group_name        =    "rg-idamtier0" # Is this correct?
    resource_group_name        =    "rg-firecrestsub"       
    location        =    "uksouth"        
    virtual_network_name        =    "Vnet-Firecrest-uks"        
    address_prefixes        =    ["10.82.64.0/24"]         
    tags = { 
      Provisioner = "Terraform"        
      Subscription     =    "idd_firecrest_production_sub" 
    } 
  }

  Subdnstier1-ukw   =    {    
    name        =    "Subdnstier1-ukw"        
    # resource_group_name        =    "rg-idamtier0-dc" # Is this correct?
    resource_group_name        =    "rg-firecrestsub"       
    location        =    "ukwest"        
    virtual_network_name        =    "Vnet-Firecrest-ukw"        
    address_prefixes        =    ["10.93.64.0/24"]         
    tags = { 
      Provisioner = "Terraform"        
      Subscription     =    "idd_firecrest_production_sub" 
    } 
  }

  AzureBastionSubnet    =    {    
    name        =    "AzureBastionSubnet"        
    # resource_group_name        =    "rg-bastion-firecrest" 
    resource_group_name        =    "rg-firecrestsub"         
    location        =    "uksouth"        
    virtual_network_name        =    "Vnet-Firecrest-bastion-uks"        
    address_prefixes        =    ["10.82.97.0/26"]         
    tags = { 
      Provisioner = "Terraform"        
      Subscription        =    "idd_firecrest_production_sub" 
    }
  }

  ########
  # TBC
  ########
  
  # sub-idamtier1-ukw =    {    
  #   name        =    "sub-idamtier1-ukw"        
  #   # resource_group_name        =    "rg-idam-tier1" # Is this correct? Removed from design doc
  #   resource_group_name        =    "rg-firecrestsub"        
  #   location        =    "uksouth"
  #   virtual_network_name     =    "Vnet-Firecrest-ukw"
  #   address_prefixes        =    ["10.82.144.0/24"]    
  #   tags       = {        
  #     Provisioner      = "Terraform"                
  #     Description        =    "TBC"                
  #     Subscription        =    "idd_firecrest_production_sub"      
  #   }  
  # }


}
######################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\virtual_machine_data_disk_attachment.auto.tfvars.disabled  #
######################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

########################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\virtual_network.auto.tfvars  #
########################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

virtual_networks = {

  Vnet-Firecrest-uks = {
    name                = "Vnet-Firecrest-uks"
    resource_group_name = "rg-firecrestsub"
    location            = "uksouth"
    address_space       = ["10.82.64.0/19"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_sub"
    }
  },

  Vnet-Firecrest-ukw = {
    name                = "Vnet-Firecrest-ukw"
    resource_group_name = "rg-firecrestsub"
    location            = "ukwest"
    address_space       = ["10.93.64.0/19"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_sub"
    }
  },

  Vnet-Firecrest-bastion-uks = {
    name                = "Vnet-Firecrest-bastion-uks"
    resource_group_name = "rg-firecrestsub"
    location            = "uksouth"
    address_space       = ["10.82.97.0/24"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_sub"
    }
  }

}
####################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\virtual_network_dns_servers.auto.tfvars  #
####################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

virtual_network_dns_servers     =   {
  
    Vnet-Firecrest-uks=    {    
      name  = "Vnet-Firecrest-uks"
      # virtual_network_id        =    "Vnet-Firecrest-uks" 
      # virtual_network_id   =    "data.azurerm_virtual_network.Vnet-Firecrest-uks.id"
      dns_servers          =    ["10.82.17.5","10.82.17.6"]         
      tags = { 
        Provisioner = "Terraform"        
        Subscription       =    "idd_firecrest_production_sub" 
      } 
    }
    
    Vnet-Firecrest-ukw=    {    
      name  = "Vnet-Firecrest-ukw"
      # virtual_network_id        =    "Vnet-Firecrest-ukw"
      # virtual_network_id   =    "data.azurerm_virtual_network.Vnet-Firecrest-ukw.id"   
      dns_servers          =    ["10.93.17.5","10.93.17.6"]         
      tags = { 
        Provisioner = "Terraform"        
        Subscription       =    "idd_firecrest_production_sub" 
        } 
    }

}
#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\virtual_network_gateway.auto.tfvars.disabled  #
#########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\virtual_network_peering.auto.tfvars  #
################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

virtual_network_peerings = {

    vpfirecrestuksbastionuks=    {    
        name        =    "vpfirecrestuksbastionuks"        
        resource_group_name        =    "rg-firecrestsub"        
        virtual_network_name        =    "Vnet-Firecrest-uks"        
        # remote_virtual_network_id        =    "Vnet-Firecrest-bastion-uks"  
        remote_virtual_network_name        =   "Vnet-Firecrest-bastion-uks"      
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        use_remote_gateways        =    "false"         
        tags = { 
          Provisioner = "Terraform"        
          Subscription        =    "idd_firecrest_production_sub" 
        } 
      }
    
    vpbastionuksfirecrestuks=    {    
        name        =    "vpbastionuksfirecrestuks"        
        resource_group_name        =    "rg-firecrestsub"        
        virtual_network_name        =    "Vnet-Firecrest-bastion-uks"        
        # remote_virtual_network_id        =    "Vnet-Firecrest-uks" 
        remote_virtual_network_name        =        "Vnet-Firecrest-uks"
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        use_remote_gateways        =    "false"         
        tags = { 
          Provisioner = "Terraform"        
          Subscription        =    "idd_firecrest_production_sub" 
        } 
      }
    
    vpfirecrestuksbastionukw=    {    
        name        =    "vpfirecrestuksbastionukw"        
        resource_group_name        =    "rg-firecrestsub"        
        virtual_network_name        =    "Vnet-Firecrest-ukw"        
        # remote_virtual_network_id        =    "Vnet-Firecrest-bastion-uks"
        remote_virtual_network_name        =       "Vnet-Firecrest-bastion-uks"
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        # use_remote_gateways        =    "true" # Gateway required?  
        use_remote_gateways        =    "false"        
        tags = { 
          Provisioner = "Terraform"        
          Subscription        =    "idd_firecrest_production_sub" 
          Notes               =    "Gateway required?"
        } 
      }
    
    vpfirecrestukwbastionuks=    {    
        name        =    "vpfirecrestukwbastionuks"        
        resource_group_name        =    "rg-firecrestsub"        
        virtual_network_name        =    "Vnet-Firecrest-bastion-uks"        
        # remote_virtual_network_id        =    "Vnet-Firecrest-ukw"  
        remote_virtual_network_name        =      "Vnet-Firecrest-ukw"   
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        # use_remote_gateways        =    "true"  # Gateway required?  
         use_remote_gateways        =    "false"    
        tags = { 
          Provisioner = "Terraform"        
          Subscription        =    "idd_firecrest_production_sub" 
          Notes               =    "Gateway required?"
        } 
    }

}
#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub\windows_virtual_machine.auto.tfvars.disabled  #
#########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

