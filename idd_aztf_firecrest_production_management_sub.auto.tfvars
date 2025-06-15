#######################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub  #
#######################################################################################################
#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\availability_set.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\bastion_host.auto.tfvars.disabled  #
#########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\disk_access.auto.tfvars.disabled  #
########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\key_vault.auto.tfvars  #
#############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

key_vaults = {

  kvmgmt-nonprivend-uks = {
    # name           = "akvmanagement-nonprivend-uks"
    name                = "kvmgmt-nonprivend-uks"
    resource_group_name = "rg-KeyVault-management"
    location            = "uksouth"
    tenant_id           = "d3a2d0d3-7cc8-4f52-bbf9-85bd43d94279"
    sku                 = "standard"
    tags = {
      Provisioner = "Terraform"
      Description = "Long name: akvmanagement-nonprivend-uks"
    }
  }

}
#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\managed_disk.auto.tfvars.disabled  #
#########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\management_group.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

management_groups   =   {

    IDD-Firecrest-Production=    {    
      display_name        =    "IDD- Firecrest-Production"        
      parent_management_group_id        =    "IDD Firecrest"        
      subscription_ids    =    ["a0b18b57-2e0f-4a7b-af21-51b52ceaaacc"]         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }

    IDD-Platform-Management=    {    
      display_name        =    "IDD-Platform-Management"        
      parent_management_group_id        =    "IDD Firecrest"        
      subscription_ids       =    ["568ffcfb-9bd5-4d36-8b3b-1a8dbf3419c3"]         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }

    IDD-Firecrest-Production=    {    
      display_name        =    "IDD- Firecrest-Production"        
      parent_management_group_id        =    "IDD Firecrest"        
      subscription_ids    =    ["a0b18b57-2e0f-4a7b-af21-51b52ceaaacc"]         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }
    
    IDD-Platform-Management=    {    
      display_name        =    "IDD-Platform-Management"        
      parent_management_group_id        =    "IDD Firecrest"        
      subscription_ids       =    ["568ffcfb-9bd5-4d36-8b3b-1a8dbf3419c3"]         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }

}
##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\network_interface.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\network_security_group.auto.tfvars.disabled  #
###################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\network_watcher.auto.tfvars.disabled  #
############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\network_watcher_flow_log.auto.tfvars.disabled  #
#####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\private_dns_zone.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##################################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\private_dns_zone_virtual_network_link.auto.tfvars.disabled  #
##################################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\private_endpoint.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\public_ip.auto.tfvars.disabled  #
######################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\recovery_services_vault.auto.tfvars.disabled  #
####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\resource_group.auto.tfvars  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

resource_groups = {

  rg-loganalytics = {
    name     = "rg-loganalytics"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-azurecliuks = {
    name     = "rg-azurecliuks"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-management = {
    name     = "rg-management"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-keyvault-management = {
    name     = "rg-keyvault-management"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-management-netwatcher = {
    name     = "rg-management-netwatcher"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  }

}
############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\role_assignment.auto.tfvars.disabled  #
############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

role_assignments  =   {

    role-RecoveryVaultPEaccessmanagement=    {    
      scope        =    "rg-management"        
      role_definition_name        =    "Contributor"        
      principal_id        =    "This is the object ID of the managed identity for the Recovery service vault in management sub Ã¢â‚¬Å“rsv-management-onpremmars-uksÃ¢â‚¬Å“"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }

    role-reader-management=    {    
      scope        =    "Management Subscription"        
      role_definition_name        =    "Reader"        
      principal_id        =    "Azure-role-Management-sub-reader"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }

    role-RecoveryVaultPEaccessmanagement=    {    
      scope        =    "rg-management"        
      role_definition_name        =    "Contributor"        
      principal_id        =    "This is the object ID of the managed identity for the Recovery service vault in management sub Ã¢â‚¬Å“rsv-management-onpremmars-uksÃ¢â‚¬Å“"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }

    role-reader-management=    {    
      scope        =    "Management Subscription"        
      role_definition_name        =    "Reader"        
      principal_id        =    "Azure-role-Management-sub-reader"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }

}

##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\route.auto.tfvars.disabled  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

routes  =      {

    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }
    
    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }
    
    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }
    
    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"       
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }
    
    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }
    
    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }
    
    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }
    
    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }

}
########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\route_table.auto.tfvars.disabled  #
########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

route_tables    =   {

    rt-management-1-ukw =    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }


    rt-management-1-ukw =    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }

}
###################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\storage_account.auto.tfvars  #
###################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

storage_accounts = {

  saazurecliuks = {
    name                     = "saazurecliuks"
    resource_group_name      = "rg-azurecliuks"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "Store temp Azure CLI data"
      Subscription = "idd_firecrest_production_management_sub"
    }
  }

  samanagementnsglogsuks = {
    name                     = "samanagementnsglogsuks"
    resource_group_name      = "rg-management-netwatcher"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "NSG flow logs "
      Subscription = "idd_firecrest_production_management_sub"
    }
  }

}
#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\storage_container.auto.tfvars.disbled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}


global_tags = {
  Provisioner = "Terraform"
}

storage_containers = {
  
      satfstatemanagementsub     =    {    
            name        =    "Tfstate"        
            storage_account_name        =    "satfstatemanagementsub"        
            container_access_type  =    "blob"         
            tags = { 
                  Provisioner = "Terraform"  
                  Description = "Long name: Tfstate-saterraformstatemanagementsub"      
                  Subscription        =    "idd_firecrest_production_management_sub" 
            } 
      }


      satfmanagementsub     =    {    
            name        =    "satfmanagementsub"        
            storage_account_name        =    "satfstatemanagementsub"        
            container_access_type  =    "blob"         
            tags = { 
                  Provisioner = "Terraform"    
                  Description = "Long name: Tfstate-saterraformstatemanagementsub"    
                  Subscription        =    "idd_firecrest_production_management_sub" 
            }
      }

}
##########################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\subnet.auto.tfvars  #
##########################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

subnets = {
  sub-management-1-uks = {
    name                 = "sub-management-1-uks"
    resource_group_name  = "rg-management"
    location             = "uksouth"
    virtual_network_name = "Vnet-management-uksÃ‚"
    address_prefixes     = ["10.82.32.0/24 "]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_management_sub"
    }
  }

  sub-management-1-ukw = {
    name                 = "sub-management-1-ukw"
    resource_group_name  = "rg-management"
    location             = "ukwest"
    virtual_network_name = "Vnet-management-ukwÃ‚"
    address_prefixes     = ["10.93.32.0/24 "]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_management_sub"
    }
  }

}
#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\subnet_palo_alto.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#################################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\virtual_machine_data_disk_attachment.auto.tfvars.disabled  #
#################################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\virtual_network.auto.tfvars  #
###################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

virtual_networks = {

  Vnet-management-uks = {
    name                = "Vnet-management-uks"
    resource_group_name = "rg-management"
    location            = "uksouth"
    address_space       = ["10.82.32.0/20"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_management_sub"
    }
  }

  Vnet-management-ukw = {
    name                = "Vnet-management-ukw"
    resource_group_name = "rg-management"
    location            = "ukwest"
    address_space       = ["10.93.32.0/20"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_management_sub"
    }
  }

}


#######################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\virtual_networks_palo_alto.auto.tfvars.disabled  #
#######################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\virtual_network_dns_servers.auto.tfvars  #
###############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

virtual_network_dns_servers    =   {
  
   Vnet-management-uks=    {    
      name  = "Vnet-management-uks"
      # virtual_network_id        =    "Vnet-management-uks"         
      dns_servers        =    ["10.82.17.5","10.82.17.6"]      
      tags = { 
         Provisioner = "Terraform"        
         Subscription        =    "idd_firecrest_production_management_sub" 
      } 
   }
   
   Vnet-management-ukw=    {    
      name  = "Vnet-management-ukw"
      # virtual_network_id        =    "Vnet-management-ukw"         
      dns_servers        =    ["10.93.17.5","10.93.17.6"]       
      tags = { 
         Provisioner = "Terraform"        
         Subscription        =    "idd_firecrest_production_management_sub" 
      } 
   }

}


####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\virtual_network_gateway.auto.tfvars.disabled  #
####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\virtual_network_peering.auto.tfvars.disabled  #
####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\windows_virtual_machine.auto.tfvars.disabled  #
####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#######################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub  #
#######################################################################################################
#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\availability_set.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\bastion_host.auto.tfvars.disabled  #
#########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\disk_access.auto.tfvars.disabled  #
########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\key_vault.auto.tfvars  #
#############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

key_vaults = {

  kvmgmt-nonprivend-uks = {
    # name           = "akvmanagement-nonprivend-uks"
    name                = "kvmgmt-nonprivend-uks"
    resource_group_name = "rg-KeyVault-management"
    location            = "uksouth"
    tenant_id           = "d3a2d0d3-7cc8-4f52-bbf9-85bd43d94279"
    sku                 = "standard"
    tags = {
      Provisioner = "Terraform"
      Description = "Long name: akvmanagement-nonprivend-uks"
    }
  }

}
#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\managed_disk.auto.tfvars.disabled  #
#########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\management_group.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

management_groups   =   {

    IDD-Firecrest-Production=    {    
      display_name        =    "IDD- Firecrest-Production"        
      parent_management_group_id        =    "IDD Firecrest"        
      subscription_ids    =    ["a0b18b57-2e0f-4a7b-af21-51b52ceaaacc"]         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }

    IDD-Platform-Management=    {    
      display_name        =    "IDD-Platform-Management"        
      parent_management_group_id        =    "IDD Firecrest"        
      subscription_ids       =    ["568ffcfb-9bd5-4d36-8b3b-1a8dbf3419c3"]         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }

    IDD-Firecrest-Production=    {    
      display_name        =    "IDD- Firecrest-Production"        
      parent_management_group_id        =    "IDD Firecrest"        
      subscription_ids    =    ["a0b18b57-2e0f-4a7b-af21-51b52ceaaacc"]         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }
    
    IDD-Platform-Management=    {    
      display_name        =    "IDD-Platform-Management"        
      parent_management_group_id        =    "IDD Firecrest"        
      subscription_ids       =    ["568ffcfb-9bd5-4d36-8b3b-1a8dbf3419c3"]         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }

}
##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\network_interface.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\network_security_group.auto.tfvars.disabled  #
###################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\network_watcher.auto.tfvars.disabled  #
############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\network_watcher_flow_log.auto.tfvars.disabled  #
#####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\private_dns_zone.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##################################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\private_dns_zone_virtual_network_link.auto.tfvars.disabled  #
##################################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\private_endpoint.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\public_ip.auto.tfvars.disabled  #
######################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\recovery_services_vault.auto.tfvars.disabled  #
####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\resource_group.auto.tfvars  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

resource_groups = {

  rg-loganalytics = {
    name     = "rg-loganalytics"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-azurecliuks = {
    name     = "rg-azurecliuks"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-management = {
    name     = "rg-management"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-keyvault-management = {
    name     = "rg-keyvault-management"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-management-netwatcher = {
    name     = "rg-management-netwatcher"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  }

}
############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\role_assignment.auto.tfvars.disabled  #
############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

role_assignments  =   {

    role-RecoveryVaultPEaccessmanagement=    {    
      scope        =    "rg-management"        
      role_definition_name        =    "Contributor"        
      principal_id        =    "This is the object ID of the managed identity for the Recovery service vault in management sub Ã¢â‚¬Å“rsv-management-onpremmars-uksÃ¢â‚¬Å“"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }

    role-reader-management=    {    
      scope        =    "Management Subscription"        
      role_definition_name        =    "Reader"        
      principal_id        =    "Azure-role-Management-sub-reader"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }

    role-RecoveryVaultPEaccessmanagement=    {    
      scope        =    "rg-management"        
      role_definition_name        =    "Contributor"        
      principal_id        =    "This is the object ID of the managed identity for the Recovery service vault in management sub Ã¢â‚¬Å“rsv-management-onpremmars-uksÃ¢â‚¬Å“"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }

    role-reader-management=    {    
      scope        =    "Management Subscription"        
      role_definition_name        =    "Reader"        
      principal_id        =    "Azure-role-Management-sub-reader"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_management_sub" 
      } 
    }

}

##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\route.auto.tfvars.disabled  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

routes  =      {

    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }
    
    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }
    
    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }
    
    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"       
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }
    
    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }
    
    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }
    
    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }
    
    rt-management-1-ukw=    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }

}
########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\route_table.auto.tfvars.disabled  #
########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

route_tables    =   {

    rt-management-1-ukw =    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }


    rt-management-1-ukw =    {    
        name        =    "rt-management-1-ukw"        
        resource_group_name        =    "rg-management"        
        location        =    "ukwest"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_management_sub" 
        } 
    }

}
###################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\storage_account.auto.tfvars  #
###################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

storage_accounts = {

  saazurecliuks = {
    name                     = "saazurecliuks"
    resource_group_name      = "rg-azurecliuks"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "Store temp Azure CLI data"
      Subscription = "idd_firecrest_production_management_sub"
    }
  }

  samanagementnsglogsuks = {
    name                     = "samanagementnsglogsuks"
    resource_group_name      = "rg-management-netwatcher"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "NSG flow logs "
      Subscription = "idd_firecrest_production_management_sub"
    }
  }

}
#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\storage_container.auto.tfvars.disbled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}


global_tags = {
  Provisioner = "Terraform"
}

storage_containers = {
  
      satfstatemanagementsub     =    {    
            name        =    "Tfstate"        
            storage_account_name        =    "satfstatemanagementsub"        
            container_access_type  =    "blob"         
            tags = { 
                  Provisioner = "Terraform"  
                  Description = "Long name: Tfstate-saterraformstatemanagementsub"      
                  Subscription        =    "idd_firecrest_production_management_sub" 
            } 
      }


      satfmanagementsub     =    {    
            name        =    "satfmanagementsub"        
            storage_account_name        =    "satfstatemanagementsub"        
            container_access_type  =    "blob"         
            tags = { 
                  Provisioner = "Terraform"    
                  Description = "Long name: Tfstate-saterraformstatemanagementsub"    
                  Subscription        =    "idd_firecrest_production_management_sub" 
            }
      }

}
##########################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\subnet.auto.tfvars  #
##########################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

subnets = {
  sub-management-1-uks = {
    name                 = "sub-management-1-uks"
    resource_group_name  = "rg-management"
    location             = "uksouth"
    virtual_network_name = "Vnet-management-uksÃ‚"
    address_prefixes     = ["10.82.32.0/24 "]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_management_sub"
    }
  }

  sub-management-1-ukw = {
    name                 = "sub-management-1-ukw"
    resource_group_name  = "rg-management"
    location             = "ukwest"
    virtual_network_name = "Vnet-management-ukwÃ‚"
    address_prefixes     = ["10.93.32.0/24 "]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_management_sub"
    }
  }

}
#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\subnet_palo_alto.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#################################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\virtual_machine_data_disk_attachment.auto.tfvars.disabled  #
#################################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\virtual_network.auto.tfvars  #
###################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

virtual_networks = {

  Vnet-management-uks = {
    name                = "Vnet-management-uks"
    resource_group_name = "rg-management"
    location            = "uksouth"
    address_space       = ["10.82.32.0/20"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_management_sub"
    }
  }

  Vnet-management-ukw = {
    name                = "Vnet-management-ukw"
    resource_group_name = "rg-management"
    location            = "ukwest"
    address_space       = ["10.93.32.0/20"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_management_sub"
    }
  }

}


#######################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\virtual_networks_palo_alto.auto.tfvars.disabled  #
#######################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\virtual_network_dns_servers.auto.tfvars  #
###############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

virtual_network_dns_servers    =   {
  
   Vnet-management-uks=    {    
      name  = "Vnet-management-uks"
      # virtual_network_id        =    "Vnet-management-uks"         
      dns_servers        =    ["10.82.17.5","10.82.17.6"]      
      tags = { 
         Provisioner = "Terraform"        
         Subscription        =    "idd_firecrest_production_management_sub" 
      } 
   }
   
   Vnet-management-ukw=    {    
      name  = "Vnet-management-ukw"
      # virtual_network_id        =    "Vnet-management-ukw"         
      dns_servers        =    ["10.93.17.5","10.93.17.6"]       
      tags = { 
         Provisioner = "Terraform"        
         Subscription        =    "idd_firecrest_production_management_sub" 
      } 
   }

}


####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\virtual_network_gateway.auto.tfvars.disabled  #
####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\virtual_network_peering.auto.tfvars.disabled  #
####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\windows_virtual_machine.auto.tfvars.disabled  #
####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

