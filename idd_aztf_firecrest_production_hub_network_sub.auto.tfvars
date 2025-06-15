########################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub  #
########################################################################################################
##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\availability_set.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\disk_access.auto.tfvars.disabled  #
#########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\key_vault.auto.tfvars.disabled  #
#######################################################################################################################################
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
##########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\managed_disk.auto.tfvars.disabled  #
##########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\network_interface.auto.tfvars.disabled  #
###############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\network_security_group.auto.tfvars.disabled  #
####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\network_watcher.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

######################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\network_watcher_flow_log.auto.tfvars.disabled  #
######################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\palo_alto_subnet.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

palo_alto_subnets   =   {

    sub-hub-pafwuks-untrust  =    {    
        name        =    "sub-hub-pafwuks-untrust"        
        resource_group_name        =    "rg-paloalto"        
        virtual_network_name        =    "Vnet-hub-uks"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }
    
    sub-hub-pafwuks-trust   =    {    
        name        =    "sub-hub-pafwuks-trust"        
        resource_group_name        =    "rg-paloalto"        
        virtual_network_name        =    "Vnet-hub-uks"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }
    
    sub-hub-pafwuks-management     =    {    
        name        =    "sub-hub-pafwuks-management"        
        resource_group_name        =    "rg-paloalto"        
        virtual_network_name        =    "Vnet-hub-uks"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }
    
    sub-hub-pafwukw-untrust     =    {    
        name        =    "sub-hub-pafwukw-untrust"        
        resource_group_name        =    "rg-paloalto"        
        virtual_network_name        =    "Vnet-hub-ukw"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }
    
    sub-hub-pafwukw-trust       =    {    
        name        =    "sub-hub-pafwukw-trust"        
        resource_group_name        =    "rg-paloalto"        
        virtual_network_name        =    "Vnet-hub-ukw"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }
    
    sub-hub-pafwukw-management      =    {    
        name        =    "sub-hub-pafwukw-management"        
        resource_group_name        =    "rg-paloalto"        
        virtual_network_name        =    "Vnet-hub-ukw"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }
    
    sub-hubpanorama     =    {    
        name        =    "sub-hubpanorama"        
        resource_group_name        =    "rg-paloalto"        
        virtual_network_name        =    "Vnet-hub-ukw"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }

}
#######################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\palo_alto_virtual_network.auto.tfvars.disabled  #
#######################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}


global_tags = {
  Provisioner = "Terraform"
}

palo_alto_virtual_networks    {

    Vnet-hub-uks=    {    
      name                  =    "Vnet-hub-uks"        
      resource_group_name   =    "rg-paloalto"        
      location              =    "uksouth"        
      address_space         =    ["10.82.0.0/20"]         
      tags = { 
        Provisioner = "Terraform"       
        Subscription        =    "idd_firecrest_production_hub_network_sub" 
      } 
    }
    
    Vnet-hub-ukw=    {    
      name                  =    "Vnet-hub-ukw"        
      resource_group_name   =    "rg-paloalto"        
      location              =    "ukwest"        
      address_space         =   ["10.93.0.0/20"]         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_hub_network_sub" 
      } 
    }

}
##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\private_dns_zone.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###################################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\private_dns_zone_virtual_network_link.auto.tfvars.disabled  #
###################################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\private_endpoint.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\public_ip.auto.tfvars  #
##############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

public_ips  =   {

    pip-hub-vpng-1-s2s-uks=    {    
      name        =    "pip-hub-vpng-1-s2s-uks"        
      resource_group_name        =    "rg-paloalto"        
      location        =    "uksouth"
      allocation_method        =    "Dynamic"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_hub_network_sub" 
      } 
    }

    pip-hub-vpng-1-s2s-ukw=    {    
      name        =    "pip-hub-vpng-1-s2s-ukw"        
      resource_group_name        =    "rg-paloalto"        
      location        =    "ukwest"
      allocation_method        =    "Dynamic"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_hub_network_sub" 
      } 
    }

}
#####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\recovery_services_vault.auto.tfvars.disabled  #
#####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\resource_group.auto.tfvars  #
###################################################################################################################################
global_tags = {
    Provisioner  = "Terraform"
}

resource_groups = {

    rg-paloalto = {
      name     = "rg-paloalto"
      location = "uksouth"
      tags       = {
          Provisioner      = "Terraform"
      }
    },

    rg-paloalto-disk = {
      name     = "rg-paloalto-disk"
      location = "uksouth"
      tags       = {
          Provisioner      = "Terraform"
      }
    },

    rg-networkhub-keyvault = {
      name     = "rg-networkhub-keyvault"
      location = "uksouth"
      tags       = {
          Provisioner      = "Terraform"
      }
    },

    rg-terraform-state-networksub = {
      name     = "rg-terraform-state-networksub"
      location = "uksouth"
      tags       = {
          Provisioner      = "Terraform"
      }
    }

    
}
#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\role_assignment.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

role_assignments {

    role-reader-networksub=    {    
        scope        =    "Network subscription"        
        role_definition_name        =    "Reader"        
        principal_id        =   "Azure-role-Network-sub-reader"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }

}
###################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\route.auto.tfvars.disabled  #
###################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\route_table.auto.tfvars.disabled  #
#########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

####################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\storage_account.auto.tfvars  #
####################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

storage_accounts = {

    satfstatenetworksub  =    {    
        name                     =    "satfstatenetworksub"        
        resource_group_name      =    "rg-terraform-state-networksub"        
        location                 =    "uksouth"        
        account_tier             =    "Standard"        
        account_replication_type  =    "GRS"    
        tags       = {        
          Provisioner      =  "Terraform"
          Purpose          =   "Terraform state file" 
          Description      =   "Long name: saterraformstatenetworksub"       
          Subscription     =   "idd_firecrest_production_hub_network_sub"      
        }  
    }
    
    sapaloaltouks =    {    
        name                     =    "sapaloaltouks"        
        resource_group_name      =    "rg-paloalto-disk"        
        location                 =    "uksouth"        
        account_tier             =    "Standard"        
        account_replication_type =    "LRS"    
        tags       = {        
          Provisioner       =   "Terraform"        
          Purpose           =   "PA disk storage uks and file share for bootstrap."        
          Subscription      =   "idd_firecrest_production_hub_network_sub"      
        } 
      }
    
    sapaloaltoukw =    {    
        name                     =    "sapaloaltoukw"        
        resource_group_name      =    "rg-paloalto-disk"        
        location                 =    "ukwest"        
        account_tier             =    "Standard"        
        account_replication_type =    "LRS"    
        tags       = {        
          Provisioner       =  "Terraform"        
          Purpose           =  "PA disk storage ukw and file share for bootstrap"        
          Subscription      =  "idd_firecrest_production_hub_network_sub"      }  }
    
    saazbastnsgflogidamtier0  =    {    
        name                        =    "saazbastnsgflogidamtier0"        
        resource_group_name         =    "rg-bastion-idamtier0-netwatcher"
        location                    =    "uksouth"        
        account_tier                =    "Standard"        
        account_replication_type    =    "GRS"    
        tags       = {        
          Provisioner        =  "Terraform"       
           Purpose           =   "NSG flow logs"  
           Description       =   "Long name: saazurebastionnsgflogidamtier0"        
           Subscription      =   "idd_firecrest_production_hub_network_sub"      
        } 
      }
    
    sanetworkhubbootdiagsuks  =    {    
        name                      =    "sanetworkhubbootdiagsuks"        
        resource_group_name       =    "rg-paloalto"        
        location                  =     "uksouth"        
        account_tier              =    "Standard"        
        account_replication_type  =    "LRS"    
        tags       = {        
          Provisioner       =  "Terraform"        
          Purpose           =   "Boot diag"  
          Description       =   "Long name: sanetworkhubbootdiagnosticsuks"        
          Subscription      =   "idd_firecrest_production_hub_network_sub"      
        }  
    }
    
    sanetworkhubbootdiagukw  =    {    
        name                      =    "sanetworkhubbootdiagukw"        
        resource_group_name       =    "rg-paloalto"        
        location                  =    "ukwest"        
        account_tier              =    "Standard"        
        account_replication_type  =    "LRS"    
        tags       = {        
          Provisioner       =  "Terraform"        
          Purpose           =   "Boot diag"
          Description       =   "Long name: sanetworkhubbootdiagnosticsukw"          
          Subscription      =   "idd_firecrest_production_hub_network_sub"      
        }  }
    
    sanethubnsgflowlogsuks  =    {    
        name                      =    "sanethubnsgflowlogsuks"        
        resource_group_name       =    "rg-paloalto"        
        location                  =    "uksouth"
        account_tier              =    "Standard"        
        account_replication_type  =    "LRS"    
        tags       = {        
          Provisioner       =  "Terraform"        
          Purpose           =  "Disk Storage"  
          Description       =   "Long name: sanetworkhubnsgflowlogsuks"      
          Subscription      =   "idd_firecrest_production_hub_network_sub"     
        }  
    }
    
    sanethubnsgflowlogsukw  =    {    
        name                      =    "sanethubnsgflowlogsukw"        
        resource_group_name       =    "rg-paloalto"        
        location                  =    "ukwest"
        account_tier              =    "Standard"        
        account_replication_type  =    "LRS"    
        tags       = {        
          Provisioner        =  "Terraform"        
          Purpose            =   "Disk Storage"    
          Description        =   "Long name: sanetworkhubnsgflowlogsukw"      
          Subscription       =    "idd_firecrest_production_hub_network_sub"      
        }  
    }

}
###############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\storage_container.auto.tfvars.disabled  #
###############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

storage_containers      =   {

    Tfstate-saterraformstatenetworksub=    {    
        name                        =    "Tfstate-saterraformstateproductionsub"        
        storage_account_name        =    "saterraformstatenetworksub"        
        container_access_type       =    "blob"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }

}
###########################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\subnet.auto.tfvars  #
###########################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}


global_tags = {
  Provisioner = "Terraform"
}

subnets     =     {

   sub-hub-gateway-uks  =    {    
         name        =    "sub-hub-gateway-uks"        
         resource_group_name        =    "rg-paloalto"        
         location        =    "uksouth"        
         virtual_network_name        =    "Vnet-hub-uks"        
         address_prefixes        =    ["10.82.128.0/26"]         
         tags = { 
            Provisioner = "Terraform"        
            Subscription        = "idd_firecrest_production_hub_network_sub" 
         } 
   }
   
   sub-hub-gateway-ukw  =    {    
         name        =    "sub-hub-gateway-ukw"        
         resource_group_name        =    "rg-paloalto"        
         location        =    "ukwest"        
         virtual_network_name        =    "Vnet-hub-ukw"        
         address_prefixes        =    ["10.93.128.0/26"]         
         tags = { 
            Provisioner = "Terraform"        
            Subscription        =  "idd_firecrest_production_hub_network_sub" 
         } 
   }

}
##################################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\virtual_machine_data_disk_attachment.auto.tfvars.disabled  #
##################################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

####################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\virtual_network.auto.tfvars  #
####################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

# TBC: Not defined in design doc
virtual_networks = {

  Vnet-hub-uks = {
    name                = "Vnet-hub-uks"
    resource_group_name = "rg-paloalto"
    location            = "uksouth"
    address_space       = ["10.82.128.0/24"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_hub_network_sub"
      Notes        = "TBC: Not defined in design doc"
    }
  },

  Vnet-hub-ukw = {
    name                = "Vnet-hub-ukw"
    resource_group_name = "rg-paloalto"
    location            = "ukwest"
    address_space       = ["10.93.128.0/24"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_hub_network_sub"
      Notes        = "TBC: Not defined in design doc"
    }
  }

}
#########################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\virtual_network_dns_servers.auto.tfvars.disabled  #
#########################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\virtual_network_gateway.auto.tfvars.disabled  #
#####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\virtual_network_peering.auto.tfvars.disabled  #
#####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\windows_virtual_machine.auto.tfvars.disabled  #
#####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

########################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub  #
########################################################################################################
##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\availability_set.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

availability_sets   =   {

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
#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\disk_access.auto.tfvars.disabled  #
#########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\key_vault.auto.tfvars.disabled  #
#######################################################################################################################################
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
##########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\managed_disk.auto.tfvars.disabled  #
##########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\network_interface.auto.tfvars.disabled  #
###############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\network_security_group.auto.tfvars.disabled  #
####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\network_watcher.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

######################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\network_watcher_flow_log.auto.tfvars.disabled  #
######################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\palo_alto_subnet.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

palo_alto_subnets   =   {

    sub-hub-pafwuks-untrust  =    {    
        name        =    "sub-hub-pafwuks-untrust"        
        resource_group_name        =    "rg-paloalto"        
        virtual_network_name        =    "Vnet-hub-uks"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }
    
    sub-hub-pafwuks-trust   =    {    
        name        =    "sub-hub-pafwuks-trust"        
        resource_group_name        =    "rg-paloalto"        
        virtual_network_name        =    "Vnet-hub-uks"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }
    
    sub-hub-pafwuks-management     =    {    
        name        =    "sub-hub-pafwuks-management"        
        resource_group_name        =    "rg-paloalto"        
        virtual_network_name        =    "Vnet-hub-uks"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }
    
    sub-hub-pafwukw-untrust     =    {    
        name        =    "sub-hub-pafwukw-untrust"        
        resource_group_name        =    "rg-paloalto"        
        virtual_network_name        =    "Vnet-hub-ukw"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }
    
    sub-hub-pafwukw-trust       =    {    
        name        =    "sub-hub-pafwukw-trust"        
        resource_group_name        =    "rg-paloalto"        
        virtual_network_name        =    "Vnet-hub-ukw"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }
    
    sub-hub-pafwukw-management      =    {    
        name        =    "sub-hub-pafwukw-management"        
        resource_group_name        =    "rg-paloalto"        
        virtual_network_name        =    "Vnet-hub-ukw"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }
    
    sub-hubpanorama     =    {    
        name        =    "sub-hubpanorama"        
        resource_group_name        =    "rg-paloalto"        
        virtual_network_name        =    "Vnet-hub-ukw"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }

}
#######################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\palo_alto_virtual_network.auto.tfvars.disabled  #
#######################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}


global_tags = {
  Provisioner = "Terraform"
}

palo_alto_virtual_networks    {

    Vnet-hub-uks=    {    
      name                  =    "Vnet-hub-uks"        
      resource_group_name   =    "rg-paloalto"        
      location              =    "uksouth"        
      address_space         =    ["10.82.0.0/20"]         
      tags = { 
        Provisioner = "Terraform"       
        Subscription        =    "idd_firecrest_production_hub_network_sub" 
      } 
    }
    
    Vnet-hub-ukw=    {    
      name                  =    "Vnet-hub-ukw"        
      resource_group_name   =    "rg-paloalto"        
      location              =    "ukwest"        
      address_space         =   ["10.93.0.0/20"]         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_hub_network_sub" 
      } 
    }

}
##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\private_dns_zone.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###################################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\private_dns_zone_virtual_network_link.auto.tfvars.disabled  #
###################################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\private_endpoint.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\public_ip.auto.tfvars  #
##############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

public_ips  =   {

    pip-hub-vpng-1-s2s-uks=    {    
      name        =    "pip-hub-vpng-1-s2s-uks"        
      resource_group_name        =    "rg-paloalto"        
      location        =    "uksouth"
      allocation_method        =    "Dynamic"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_hub_network_sub" 
      } 
    }

    pip-hub-vpng-1-s2s-ukw=    {    
      name        =    "pip-hub-vpng-1-s2s-ukw"        
      resource_group_name        =    "rg-paloalto"        
      location        =    "ukwest"
      allocation_method        =    "Dynamic"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_hub_network_sub" 
      } 
    }

}
#####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\recovery_services_vault.auto.tfvars.disabled  #
#####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\resource_group.auto.tfvars  #
###################################################################################################################################
global_tags = {
    Provisioner  = "Terraform"
}

resource_groups = {

    rg-paloalto = {
      name     = "rg-paloalto"
      location = "uksouth"
      tags       = {
          Provisioner      = "Terraform"
      }
    },

    rg-paloalto-disk = {
      name     = "rg-paloalto-disk"
      location = "uksouth"
      tags       = {
          Provisioner      = "Terraform"
      }
    },

    rg-networkhub-keyvault = {
      name     = "rg-networkhub-keyvault"
      location = "uksouth"
      tags       = {
          Provisioner      = "Terraform"
      }
    },

    rg-terraform-state-networksub = {
      name     = "rg-terraform-state-networksub"
      location = "uksouth"
      tags       = {
          Provisioner      = "Terraform"
      }
    }

    
}
#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\role_assignment.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

role_assignments {

    role-reader-networksub=    {    
        scope        =    "Network subscription"        
        role_definition_name        =    "Reader"        
        principal_id        =   "Azure-role-Network-sub-reader"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }

}
###################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\route.auto.tfvars.disabled  #
###################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\route_table.auto.tfvars.disabled  #
#########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

####################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\storage_account.auto.tfvars  #
####################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

storage_accounts = {

    satfstatenetworksub  =    {    
        name                     =    "satfstatenetworksub"        
        resource_group_name      =    "rg-terraform-state-networksub"        
        location                 =    "uksouth"        
        account_tier             =    "Standard"        
        account_replication_type  =    "GRS"    
        tags       = {        
          Provisioner      =  "Terraform"
          Purpose          =   "Terraform state file" 
          Description      =   "Long name: saterraformstatenetworksub"       
          Subscription     =   "idd_firecrest_production_hub_network_sub"      
        }  
    }
    
    sapaloaltouks =    {    
        name                     =    "sapaloaltouks"        
        resource_group_name      =    "rg-paloalto-disk"        
        location                 =    "uksouth"        
        account_tier             =    "Standard"        
        account_replication_type =    "LRS"    
        tags       = {        
          Provisioner       =   "Terraform"        
          Purpose           =   "PA disk storage uks and file share for bootstrap."        
          Subscription      =   "idd_firecrest_production_hub_network_sub"      
        } 
      }
    
    sapaloaltoukw =    {    
        name                     =    "sapaloaltoukw"        
        resource_group_name      =    "rg-paloalto-disk"        
        location                 =    "ukwest"        
        account_tier             =    "Standard"        
        account_replication_type =    "LRS"    
        tags       = {        
          Provisioner       =  "Terraform"        
          Purpose           =  "PA disk storage ukw and file share for bootstrap"        
          Subscription      =  "idd_firecrest_production_hub_network_sub"      }  }
    
    saazbastnsgflogidamtier0  =    {    
        name                        =    "saazbastnsgflogidamtier0"        
        resource_group_name         =    "rg-bastion-idamtier0-netwatcher"
        location                    =    "uksouth"        
        account_tier                =    "Standard"        
        account_replication_type    =    "GRS"    
        tags       = {        
          Provisioner        =  "Terraform"       
           Purpose           =   "NSG flow logs"  
           Description       =   "Long name: saazurebastionnsgflogidamtier0"        
           Subscription      =   "idd_firecrest_production_hub_network_sub"      
        } 
      }
    
    sanetworkhubbootdiagsuks  =    {    
        name                      =    "sanetworkhubbootdiagsuks"        
        resource_group_name       =    "rg-paloalto"        
        location                  =     "uksouth"        
        account_tier              =    "Standard"        
        account_replication_type  =    "LRS"    
        tags       = {        
          Provisioner       =  "Terraform"        
          Purpose           =   "Boot diag"  
          Description       =   "Long name: sanetworkhubbootdiagnosticsuks"        
          Subscription      =   "idd_firecrest_production_hub_network_sub"      
        }  
    }
    
    sanetworkhubbootdiagukw  =    {    
        name                      =    "sanetworkhubbootdiagukw"        
        resource_group_name       =    "rg-paloalto"        
        location                  =    "ukwest"        
        account_tier              =    "Standard"        
        account_replication_type  =    "LRS"    
        tags       = {        
          Provisioner       =  "Terraform"        
          Purpose           =   "Boot diag"
          Description       =   "Long name: sanetworkhubbootdiagnosticsukw"          
          Subscription      =   "idd_firecrest_production_hub_network_sub"      
        }  }
    
    sanethubnsgflowlogsuks  =    {    
        name                      =    "sanethubnsgflowlogsuks"        
        resource_group_name       =    "rg-paloalto"        
        location                  =    "uksouth"
        account_tier              =    "Standard"        
        account_replication_type  =    "LRS"    
        tags       = {        
          Provisioner       =  "Terraform"        
          Purpose           =  "Disk Storage"  
          Description       =   "Long name: sanetworkhubnsgflowlogsuks"      
          Subscription      =   "idd_firecrest_production_hub_network_sub"     
        }  
    }
    
    sanethubnsgflowlogsukw  =    {    
        name                      =    "sanethubnsgflowlogsukw"        
        resource_group_name       =    "rg-paloalto"        
        location                  =    "ukwest"
        account_tier              =    "Standard"        
        account_replication_type  =    "LRS"    
        tags       = {        
          Provisioner        =  "Terraform"        
          Purpose            =   "Disk Storage"    
          Description        =   "Long name: sanetworkhubnsgflowlogsukw"      
          Subscription       =    "idd_firecrest_production_hub_network_sub"      
        }  
    }

}
###############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\storage_container.auto.tfvars.disabled  #
###############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

storage_containers      =   {

    Tfstate-saterraformstatenetworksub=    {    
        name                        =    "Tfstate-saterraformstateproductionsub"        
        storage_account_name        =    "saterraformstatenetworksub"        
        container_access_type       =    "blob"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_hub_network_sub" 
        } 
    }

}
###########################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\subnet.auto.tfvars  #
###########################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}


global_tags = {
  Provisioner = "Terraform"
}

subnets     =     {

   sub-hub-gateway-uks  =    {    
         name        =    "sub-hub-gateway-uks"        
         resource_group_name        =    "rg-paloalto"        
         location        =    "uksouth"        
         virtual_network_name        =    "Vnet-hub-uks"        
         address_prefixes        =    ["10.82.128.0/26"]         
         tags = { 
            Provisioner = "Terraform"        
            Subscription        = "idd_firecrest_production_hub_network_sub" 
         } 
   }
   
   sub-hub-gateway-ukw  =    {    
         name        =    "sub-hub-gateway-ukw"        
         resource_group_name        =    "rg-paloalto"        
         location        =    "ukwest"        
         virtual_network_name        =    "Vnet-hub-ukw"        
         address_prefixes        =    ["10.93.128.0/26"]         
         tags = { 
            Provisioner = "Terraform"        
            Subscription        =  "idd_firecrest_production_hub_network_sub" 
         } 
   }

}
##################################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\virtual_machine_data_disk_attachment.auto.tfvars.disabled  #
##################################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

####################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\virtual_network.auto.tfvars  #
####################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

# TBC: Not defined in design doc
virtual_networks = {

  Vnet-hub-uks = {
    name                = "Vnet-hub-uks"
    resource_group_name = "rg-paloalto"
    location            = "uksouth"
    address_space       = ["10.82.128.0/24"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_hub_network_sub"
      Notes        = "TBC: Not defined in design doc"
    }
  },

  Vnet-hub-ukw = {
    name                = "Vnet-hub-ukw"
    resource_group_name = "rg-paloalto"
    location            = "ukwest"
    address_space       = ["10.93.128.0/24"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_hub_network_sub"
      Notes        = "TBC: Not defined in design doc"
    }
  }

}
#########################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\virtual_network_dns_servers.auto.tfvars.disabled  #
#########################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\virtual_network_gateway.auto.tfvars.disabled  #
#####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\virtual_network_peering.auto.tfvars.disabled  #
#####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#####################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\windows_virtual_machine.auto.tfvars.disabled  #
#####################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

