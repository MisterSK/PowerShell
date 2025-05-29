#################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub  #
#################################################################################################
#######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\availability_set.auto.tfvars.disabled  #
#######################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\bastion_host.auto.tfvars.disabled  #
###################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

bastion_hosts   =   {

    ab-IDAMtier0=    {    
      name        =    "ab-IDAMtier0"        
      resource_group_name        =    "rg-bastion-idamtier0"        
      location        =    "uksouth"        
      sku        =   "basic"         
      ip_configuration = {
        name        =    "idamtier0"        
        public_ip_address_id        =    "pip-bastion-idam-uks"        
        subnet_id        =    ["10.82.96.0/24"] 
      } 
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
      }

}
##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\disk_access.auto.tfvars.disabled  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\key_vault.auto.tfvars.disabled  #
################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

key_vaults = {

  kvidam-t0-nonprivend-uks = {
    # name           = "akvidamtier0-nonprivend-uks"
    name           = "kvidam-t0-nonprivend-uks"
    resource_group_name = "rg-KeyVault-idamtier0"
    location       = "uksouth"
    tenant_id      = "d3a2d0d3-7cc8-4f52-bbf9-85bd43d94279"
    sku            = "standard"
    tags = {
      Provisioner = "Terraform"
      Description = "Long name: akvidamtier0-nonprivend-uks"
    }
  }

  kvidam-t0-nonprivend-ukw = {
    # name           = "akvidamtier0-nonprivend-ukw"
    name           = "kvidam-t0-nonprivend-ukw"
    resource_group_name = "rg-KeyVault-idamtier0"
    location       = "ukwest"
    tenant_id      = "d3a2d0d3-7cc8-4f52-bbf9-85bd43d94279"
    sku            = "standard"
    tags = {
      Provisioner = "Terraform"
      Description = "Long name: akvidamtier0-nonprivend-ukw"
    }
  }

}
###################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\managed_disk.auto.tfvars.disabled  #
###################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

managed_disks   =   {

    md-DCGBAZSUKI0101-data=    {    
      name        =    "md- DCGBAZSUKI0101-data"        
      resource_group_name        =    "rg-idamtier0-dc"        
      location        =    "uksouth"       
      storage_account_type        =    "StandardSSD_LRS"        
      create_option        =    "Empty"       
      disk_size_gb        =    "64"        
      network_access_policy        =    "AllowPrivate"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    md-DCGBAZSUKI0102-data=    {    
      name        =    "md- DCGBAZSUKI0102-data"       
      resource_group_name        =    "rg-idamtier0-dc"        
      location        =    "uksouth"       
      storage_account_type        =    "StandardSSD_LRS"        
      create_option        =    "Empty"        
      disk_size_gb        =    "64"        
      network_access_policy        =    "AllowPrivate"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    md-INGBAZSDNS0101-data=    {    
      name        =    "md-INGBAZSDNS0101-data"        
      resource_group_name        =    "rg-idam-tier1"        
      location        =    "uksouth"        
      storage_account_type        =    "StandardSSD_LRS"        
      create_option        =    "Empty"        
      disk_size_gb        =    "32"        
      network_access_policy        =    "AllowPrivate"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    md-DCGBAZWUKI0103-data=    {    
      name        =    "md-DCGBAZWUKI0103-data"        
      resource_group_name        =    "rg-idamtier0-dc"        
      location        =    "ukwest"        
      storage_account_type        =    "StandardSSD_LRS"        
      create_option        =    "Empty"        
      disk_size_gb        =    "32"        
      network_access_policy        =    "AllowPrivate"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    md-DCGBAZWUKI0104-data=    {    
      name        =    "md-DCGBAZWUKI0104-data"        
      resource_group_name        =    "rg-idamtier0-dc"        
      location        =    "ukwest"        
      storage_account_type        =    "StandardSSD_LRS"        
      create_option        =    "Empty"        
      disk_size_gb        =    "32"        
      network_access_policy        =    "AllowPrivate"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    md-INGBAZWDNS0102-data=    {    
      name        =    "md-INGBAZWDNS0102-data"        
      resource_group_name        =    "rg-idam-tier1"        
      location        =    "ukwest"        
      storage_account_type        =    "StandardSSD_LRS"        
      create_option        =    "Empty"        
      disk_size_gb        =    "32"        
      network_access_policy        =    "AllowPrivate"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }

}
#######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\management_group.auto.tfvars.disabled  #
#######################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

management_groups   =      {

    IDD-Firecrest-IDAM=    {    
        display_name        =    "IDD-Firecrest-IDAM"        
        parent_management_group_id        =    "IDD Firecrest"        
        subscription_ids        =    ["6886821b-920f-47d8-8219-3c505be70e34"]         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }

}
########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\network_interface.auto.tfvars.disabled  #
########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

network_interfaces = {

  DCGBAZSUKI0101-nic1 = {
    name                = "DCGBAZSUKI0101-nic1"
    resource_group_name = "rg-idamtier0-dc"
    location            = "uksouth"
    dns_servers         = ["10.82.17.5", " 10.82.17.6"]
    ip_configuration = {
      name                          = "DCGBAZSUKI0101-nic1"
      subnet_id                     = "sub-idamtier0-dc-uks"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.82.17.5"
    }

    tags = {
      Provisioner  = "Terraform"
      # Subscription = "idd_firecrest_production_sub"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  DCGBAZSUKI0102-nic1 = {
    name                = "DCGBAZSUKI0102-nic1"
    resource_group_name = "rg-idamtier0-dc"
    location            = "uksouth"
    dns_servers         = ["10.82.17.5", " 10.82.17.6"]
    ip_configuration = {
      name                          = "DCGBAZSUKI0102-nic1"
      subnet_id                     = "sub-idamtier0-dc-uks"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.82.17.6"
    }

    tags = {
      Provisioner  = "Terraform"
      # Subscription = "idd_firecrest_production_sub"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  INGBAZSDNS0101-nic1 = {
    name                = "INGBAZSDNS0101-nic1"
    resource_group_name = "rg-idam-tier1"
    location            = "uksouth"
    dns_servers         = ["10.82.17.5", " 10.82.17.6"]
    ip_configuration = {
      name                          = "INGBAZSDNS0101-nic1"
      subnet_id                     = "sub-idamtier1-uks"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.82.64.5"
    }

    tags = {
      Provisioner  = "Terraform"
      # Subscription = "idd_firecrest_production_sub"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

}
#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\network_security_group.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\network_watcher.auto.tfvars.disabled  #
######################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\network_watcher_flow_log.auto.tfvars.disabled  #
###############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\private_dns_zone.auto.tfvars.disabled  #
#######################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

############################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\private_dns_zone_virtual_network_link.auto.tfvars.disabled  #
############################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

private_dns_zone_virtual_network_links  =   {

    pdnslink-VMregistrationIDAMTier0-uks=    {    
      name        =    "pdnslink-VMregistrationIDAMTier0-uks"        
      resource_group_name        =    "rg-idam-tier0"        
      private_dns_zone_name        =    "azure.ukint.fco"        
      virtual_network_id        =    "Vnet-IDAMtier0-uks"        
      registration_enabled        =    "TRUE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    pdnslink-VMregistrationIDAMTier0-ukw=    {    
      name        =    "pdnslink-VMregistrationIDAMTier0-ukw"        
      resource_group_name        =    "rg-idam-tier0"        
      private_dns_zone_name        =    "azure.ukint.fco"        
      virtual_network_id        =    "Vnet-IDAMtier0-ukw"        
      registration_enabled        =    "TRUE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
  
}
#######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\private_endpoint.auto.tfvars.disabled  #
#######################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#######################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\public_ip.auto.tfvars  #
#######################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}
##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\recovery_services_vault.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\resource_group.auto.tfvars  #
############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

resource_groups = {

  rg-idam-tier0 = {
    name     = "rg-idam-tier0"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-idamtier0-dc = {
    name     = "rg-idamtier0-dc"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-azurebackup-idamtier0 = {
    name     = "rg-azurebackup-idamtier0"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-idam-tier0-nsglogs-uks = {
    name     = "rg-idam-tier0-nsglogs-uks"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-terraform-state-idamsub = {
    name     = "rg-terraform-state-idamsub"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-idam-tier0-nsglogs-ukw = {
    name     = "rg-idam-tier0-nsglogs-ukw"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-keyvault-idamtier0 = {
    name     = "rg-keyvault-idamtier0"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-bastion-idamtier0 = {
    name     = "rg-bastion-idamtier0"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-idamtier0-routingtable = {
    name     = "rg-idamtier0-routingtable"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-bastion-idamtier0-netwatcher = {
    name     = "rg-bastion-idamtier0-netwatcher"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-bastion-idamtier0 = {
    name     = "rg-bastion-idamtier0"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-idam-tier0-netwatcher = {
    name     = "rg-idam-tier0-netwatcher"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  }

}
######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\role_assignment.auto.tfvars.disabled  #
######################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

role_assignments  =   {

    role-azure-bastion-idamtier0-VM=    {    
      scope        =    "rg-idamtier0-dc"        
      role_definition_name        =    "reader"        
      principal_id        =    "New Azure AD group called AZrole-Firecrest-Azurebastion idamtier0"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    role-azure-bastion-idamtier0=    {    
      scope        =    "rg-bastion-idamtier0"        
      role_definition_name        =    "reader"        
      principal_id        =    "New Azure AD group called AZrole-Firecrest-Azurebastion-idamtier0"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    role-azure-bastion-firecrest-VM=    {    
      scope        =    "rg-idam-tier1"        
      role_definition_name        =    "reader"        
      principal_id        =    "New Azure AD group called Azure-role-Firecrest-Azurebastion-Firecrest"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    role-reader-idamtier0=    {    
      scope        =    "Idam tier0 subscription"        
      role_definition_name        =    "Reader"        
      principal_id        =    "Azure-role-IDAMTier0-sub-reader"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }

}
############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\route.auto.tfvars.disabled  #
############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\route_table.auto.tfvars.disabled  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}


route_tables  =   {

    rt-management-1-uks=    {    
      name        =    "rt-management-1-uks"        
      resource_group_name        =    "rg-management"        
      location        =    "uksouth"         
      tags = 
        { Provisioner = 'Terraform'        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    rt-dnsteir1-ukw=    {    
      name        =    "rt-dnsteir1-ukw"        
      resource_group_name        =    "rg-idam-tier1-routingtable"        
      location        =    "ukwest"         
      tags = { 
        Provisioner = 'Terraform'        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    rt-dnsteir1-uks=    {    
      name        =    "rt-dnsteir1-uks"        
      resource_group_name        =    "rg-idam-tier1-routingtable"        
      location        =    "uksouth"         
      tags = { 
        Provisioner = 'Terraform'        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    rt-DC-idamtier0-ukw=    {    
      name        =    "rt-DC-idamtier0-ukw"        
      resource_group_name        =    "rg-idamtier0-routingtable"        
      location        =    "ukwest"     
      tags = { 
        Provisioner = 'Terraform'        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }

}
#############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\storage_account.auto.tfvars  #
#############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

storage_accounts = {

  saidamtier0nsglogsuks = {
    name                     = "saidamtier0nsglogsuks"
    resource_group_name      = "rg-idam-tier0-netwatcher"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "NSG flow logs "
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  saidamtier0nsglogsukw = {
    name                     = "saidamtier0nsglogsukw"
    resource_group_name      = "rg-idam-tier0-netwatcher"
    location                 = "ukwest"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "NSG flow logs"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  satfstateidamtier0sub = {
    name                     = "satfstateidamtier0sub"
    resource_group_name      = "rg-terraform-state-idamtier0"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "Terraform state file"
      Description  = "Long name: saterraformstateidamtier0sub"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  saidamtier0dcuks = {
    name                     = "saidamtier0dcuks"
    resource_group_name      = "rg-idamtier0-dc"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "DC VM storage"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  saidamtier0dcukw = {
    name                     = "saidamtier0dcukw"
    resource_group_name      = "rg-idamtier0-dc"
    location                 = "ukwest"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "DC VM storage"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  satfstatemanagementsub = {
    name                     = "satfstatemanagementsub"
    resource_group_name      = "rg-terraform-state-managementsub"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "Terraform state file"
      Description  = "Long name: saterraformstatemanagementsub"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  saidamtier0vmbootdiaguks = {
    name                     = "saidamtier0vmbootdiaguks"
    resource_group_name      = "rg-idam-tier0"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "Boot diag"
      Description  = "Long name: saidamtier0vmbootdiagnosticsuks"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  saidamtier0vmbootdiagukw = {
    name                     = "saidamtier0vmbootdiagukw"
    resource_group_name      = "rg-idam-tier0"
    location                 = "ukwest"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "Boot diag"
      Description  = "saidamtier0vmbootdiagnosticsukw"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  saidamtier1dnsuks = {
    name                     = "saidamtier1dnsuks"
    resource_group_name      = "rg-firecrestsub-disk"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "Disk storage"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  saidamtier1dnsukw = {
    name                     = "saidamtier1dnsukw"
    resource_group_name      = "rg-firecrestsub-disk"
    location                 = "ukwest"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "Disk Storage"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

}


saidamtier0vmbootdiagukw   =    {    
  name        =    "saidamtier0vmbootdiagukw"        
  resource_group_name        =    "rg-idam-tier0"        
  location        =    "ukwest"        
  account_tier        =    "Standard"        
  account_replication_type        =    "LRS"    
  tags       = {        
    Provisioner     =  "Terraform"        
    Purpose         =   "Boot diag"     
    Description     =   "Long name: saidamtier0vmbootdiagnosticsukw" 
    Subscription    =   "idd_firecrest_production_idam_sub"      
  }  
}



####################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\subnet.auto.tfvars  #
####################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

subnets     =   {

    sub-idamtier0-dc-uks=    {    
        name        =    "sub-idamtier0-dc-uks"        
        resource_group_name        =    "rg-idam-tier0"        
        location        =    "uksouth"        
        virtual_network_name        =    "Vnet-IDAMtier0-uks"        
        address_prefixes        =    ["10.82.17.0/24 "]         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }

    sub-idamtier0-dc-ukw=    {    
        name        =    "sub-idamtier0-dc-ukw"        
        resource_group_name        =    "rg-idam-tier0"        
        location        =    "ukwest"        
        virtual_network_name        =    "Vnet-IDAMTier0-ukw"        
        address_prefixes        =    ["10.93.17.0/24"]         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }


    AzureBastionSubnet=    {    
        name        =    "AzureBastionSubnet"        
        resource_group_name        =    "rg-bastion-idamtier0"        
        location        =    "uksouth"        
        virtual_network_name        =    "Vnet-IDAMTier0-bastion-uks"        
        address_prefixes        =    ["10.82.96.0/26"]         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }

}
###########################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\virtual_machine_data_disk_attachment.auto.tfvars.disabled  #
###########################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\virtual_network.auto.tfvars  #
#############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

virtual_networks = {

  Vnet-IDAMtier0-uks = {
    name                = "Vnet-IDAMtier0-uks "
    resource_group_name = "rg-idam-tier0"
    location            = "uksouth"
    address_space       = ["10.82.16.0/20"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  Vnet-IDAMTier0-ukw = {
    name                = "Vnet-IDAMTier0-ukw"
    resource_group_name = "rg-idam-tier0"
    location            = "ukwest"
    address_space       = ["10.93.16.0/20"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  Vnet-IDAMTier0-bastion-uks = {
    name                = "Vnet-IDAMTier0-bastion-uks"
    resource_group_name = "rg-idam-tier0"
    location            = "uksouth"
    address_space       = ["10.82.96.0/24"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

}
#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\virtual_network_dns_servers.auto.tfvars  #
#########################################################################################################################################


virtual_network_dns_servers = {

    Vnet-IDAMtier0-uks  =    {  
        name        =    "Vnet-IDAMtier0-uks"  
        # virtual_network_id        =    "Vnet-IDAMtier0-uks"        
        dns_servers        =    ["10.82.17.5"," 10.82.17.6"]         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }
    
    Vnet-IDAMTier0-ukw  =    {   
        name        =    "Vnet-IDAMTier0-ukw"  
        # virtual_network_id        =    "Vnet-IDAMTier0-ukw"        
        dns_servers        =    ["10.93.17.5","10.93.17.6"]         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }

}
##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\virtual_network_gateway.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#####################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\virtual_network_peering.auto.tfvars  #
#####################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

virtual_network_peerings = {

    vpbastionidamuks=    {    
        name        =    "vpbastionidamuks"        
        resource_group_name        =    "rg-idam-tier0"        
        virtual_network_name        =    "Vnet-IDAMTier0-bastion-uks" 
        # remote_virtual_network_id        =    "Vnet-IDAMtier0-uks"       
        remote_virtual_network_name        =    "Vnet-IDAMtier0-uks"        
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        use_remote_gateways        =    "false"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_aztf_firecrest_production_idam_sub" 
        } 
    }
    
    Vpidamtier0uksbastionuks=    {    
        name        =    "Vpidamtier0uksbastionuks"        
        resource_group_name        =    "rg-idam-tier0"        
        virtual_network_name        =    "Vnet-IDAMtier0-uks"  
        # remote_virtual_network_id        =    "Vnet-IDAMTier0-bastion-uks"      
        remote_virtual_network_name        =    "Vnet-IDAMTier0-bastion-uks"        
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        use_remote_gateways        =    "false"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }
    
    vpbastionuksidamtier0ukw =    {    
        name        =    "vpbastionuksidamtier0ukw "        
        resource_group_name        =    "rg-idam-tier0"        
        virtual_network_name        =    "Vnet-IDAMTier0-bastion-uks"  
        # remote_virtual_network_id        =    "Vnet-IDAMtier0-ukw"      
        remote_virtual_network_name        =    "Vnet-IDAMtier0-ukw"        
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        use_remote_gateways        =    "false"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }
    
    Vpidamtier0bastionuks=    {    
        name        =    "Vpidamtier0bastionuks"        
        resource_group_name        =    "rg-idam-tier0"        
        virtual_network_name        =    "Vnet-IDAMtier0-ukw"  
        # remote_virtual_network_id        =    "Vnet-IDAMTier0-bastion-uks"      
        remote_virtual_network_name        =    "Vnet-IDAMTier0-bastion-uks"        
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        use_remote_gateways        =    "false"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }

}
##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\windows_virtual_machine.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub  #
#################################################################################################
#######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\availability_set.auto.tfvars.disabled  #
#######################################################################################################################################
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
###################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\bastion_host.auto.tfvars.disabled  #
###################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

bastion_hosts   =   {

    ab-IDAMtier0=    {    
      name        =    "ab-IDAMtier0"        
      resource_group_name        =    "rg-bastion-idamtier0"        
      location        =    "uksouth"        
      sku        =   "basic"         
      ip_configuration = {
        name        =    "idamtier0"        
        public_ip_address_id        =    "pip-bastion-idam-uks"        
        subnet_id        =    ["10.82.96.0/24"] 
      } 
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
      }

}
##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\disk_access.auto.tfvars.disabled  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\key_vault.auto.tfvars.disabled  #
################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

key_vaults = {

  kvidam-t0-nonprivend-uks = {
    # name           = "akvidamtier0-nonprivend-uks"
    name           = "kvidam-t0-nonprivend-uks"
    resource_group_name = "rg-KeyVault-idamtier0"
    location       = "uksouth"
    tenant_id      = "d3a2d0d3-7cc8-4f52-bbf9-85bd43d94279"
    sku            = "standard"
    tags = {
      Provisioner = "Terraform"
      Description = "Long name: akvidamtier0-nonprivend-uks"
    }
  }

  kvidam-t0-nonprivend-ukw = {
    # name           = "akvidamtier0-nonprivend-ukw"
    name           = "kvidam-t0-nonprivend-ukw"
    resource_group_name = "rg-KeyVault-idamtier0"
    location       = "ukwest"
    tenant_id      = "d3a2d0d3-7cc8-4f52-bbf9-85bd43d94279"
    sku            = "standard"
    tags = {
      Provisioner = "Terraform"
      Description = "Long name: akvidamtier0-nonprivend-ukw"
    }
  }

}
###################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\managed_disk.auto.tfvars.disabled  #
###################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

managed_disks   =   {

    md-DCGBAZSUKI0101-data=    {    
      name        =    "md- DCGBAZSUKI0101-data"        
      resource_group_name        =    "rg-idamtier0-dc"        
      location        =    "uksouth"       
      storage_account_type        =    "StandardSSD_LRS"        
      create_option        =    "Empty"       
      disk_size_gb        =    "64"        
      network_access_policy        =    "AllowPrivate"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    md-DCGBAZSUKI0102-data=    {    
      name        =    "md- DCGBAZSUKI0102-data"       
      resource_group_name        =    "rg-idamtier0-dc"        
      location        =    "uksouth"       
      storage_account_type        =    "StandardSSD_LRS"        
      create_option        =    "Empty"        
      disk_size_gb        =    "64"        
      network_access_policy        =    "AllowPrivate"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    md-INGBAZSDNS0101-data=    {    
      name        =    "md-INGBAZSDNS0101-data"        
      resource_group_name        =    "rg-idam-tier1"        
      location        =    "uksouth"        
      storage_account_type        =    "StandardSSD_LRS"        
      create_option        =    "Empty"        
      disk_size_gb        =    "32"        
      network_access_policy        =    "AllowPrivate"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    md-DCGBAZWUKI0103-data=    {    
      name        =    "md-DCGBAZWUKI0103-data"        
      resource_group_name        =    "rg-idamtier0-dc"        
      location        =    "ukwest"        
      storage_account_type        =    "StandardSSD_LRS"        
      create_option        =    "Empty"        
      disk_size_gb        =    "32"        
      network_access_policy        =    "AllowPrivate"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    md-DCGBAZWUKI0104-data=    {    
      name        =    "md-DCGBAZWUKI0104-data"        
      resource_group_name        =    "rg-idamtier0-dc"        
      location        =    "ukwest"        
      storage_account_type        =    "StandardSSD_LRS"        
      create_option        =    "Empty"        
      disk_size_gb        =    "32"        
      network_access_policy        =    "AllowPrivate"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    md-INGBAZWDNS0102-data=    {    
      name        =    "md-INGBAZWDNS0102-data"        
      resource_group_name        =    "rg-idam-tier1"        
      location        =    "ukwest"        
      storage_account_type        =    "StandardSSD_LRS"        
      create_option        =    "Empty"        
      disk_size_gb        =    "32"        
      network_access_policy        =    "AllowPrivate"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }

}
#######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\management_group.auto.tfvars.disabled  #
#######################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

management_groups   =      {

    IDD-Firecrest-IDAM=    {    
        display_name        =    "IDD-Firecrest-IDAM"        
        parent_management_group_id        =    "IDD Firecrest"        
        subscription_ids        =    ["6886821b-920f-47d8-8219-3c505be70e34"]         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }

}
########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\network_interface.auto.tfvars.disabled  #
########################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

network_interfaces = {

  DCGBAZSUKI0101-nic1 = {
    name                = "DCGBAZSUKI0101-nic1"
    resource_group_name = "rg-idamtier0-dc"
    location            = "uksouth"
    dns_servers         = ["10.82.17.5", " 10.82.17.6"]
    ip_configuration = {
      name                          = "DCGBAZSUKI0101-nic1"
      subnet_id                     = "sub-idamtier0-dc-uks"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.82.17.5"
    }

    tags = {
      Provisioner  = "Terraform"
      # Subscription = "idd_firecrest_production_sub"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  DCGBAZSUKI0102-nic1 = {
    name                = "DCGBAZSUKI0102-nic1"
    resource_group_name = "rg-idamtier0-dc"
    location            = "uksouth"
    dns_servers         = ["10.82.17.5", " 10.82.17.6"]
    ip_configuration = {
      name                          = "DCGBAZSUKI0102-nic1"
      subnet_id                     = "sub-idamtier0-dc-uks"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.82.17.6"
    }

    tags = {
      Provisioner  = "Terraform"
      # Subscription = "idd_firecrest_production_sub"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  INGBAZSDNS0101-nic1 = {
    name                = "INGBAZSDNS0101-nic1"
    resource_group_name = "rg-idam-tier1"
    location            = "uksouth"
    dns_servers         = ["10.82.17.5", " 10.82.17.6"]
    ip_configuration = {
      name                          = "INGBAZSDNS0101-nic1"
      subnet_id                     = "sub-idamtier1-uks"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.82.64.5"
    }

    tags = {
      Provisioner  = "Terraform"
      # Subscription = "idd_firecrest_production_sub"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

}
#############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\network_security_group.auto.tfvars.disabled  #
#############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\network_watcher.auto.tfvars.disabled  #
######################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

###############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\network_watcher_flow_log.auto.tfvars.disabled  #
###############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\private_dns_zone.auto.tfvars.disabled  #
#######################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

############################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\private_dns_zone_virtual_network_link.auto.tfvars.disabled  #
############################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

private_dns_zone_virtual_network_links  =   {

    pdnslink-VMregistrationIDAMTier0-uks=    {    
      name        =    "pdnslink-VMregistrationIDAMTier0-uks"        
      resource_group_name        =    "rg-idam-tier0"        
      private_dns_zone_name        =    "azure.ukint.fco"        
      virtual_network_id        =    "Vnet-IDAMtier0-uks"        
      registration_enabled        =    "TRUE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    pdnslink-VMregistrationIDAMTier0-ukw=    {    
      name        =    "pdnslink-VMregistrationIDAMTier0-ukw"        
      resource_group_name        =    "rg-idam-tier0"        
      private_dns_zone_name        =    "azure.ukint.fco"        
      virtual_network_id        =    "Vnet-IDAMtier0-ukw"        
      registration_enabled        =    "TRUE"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
  
}
#######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\private_endpoint.auto.tfvars.disabled  #
#######################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#######################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\public_ip.auto.tfvars  #
#######################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}
##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\recovery_services_vault.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\resource_group.auto.tfvars  #
############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

resource_groups = {

  rg-idam-tier0 = {
    name     = "rg-idam-tier0"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-idamtier0-dc = {
    name     = "rg-idamtier0-dc"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-azurebackup-idamtier0 = {
    name     = "rg-azurebackup-idamtier0"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-idam-tier0-nsglogs-uks = {
    name     = "rg-idam-tier0-nsglogs-uks"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-terraform-state-idamsub = {
    name     = "rg-terraform-state-idamsub"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-idam-tier0-nsglogs-ukw = {
    name     = "rg-idam-tier0-nsglogs-ukw"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-keyvault-idamtier0 = {
    name     = "rg-keyvault-idamtier0"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-bastion-idamtier0 = {
    name     = "rg-bastion-idamtier0"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-idamtier0-routingtable = {
    name     = "rg-idamtier0-routingtable"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-bastion-idamtier0-netwatcher = {
    name     = "rg-bastion-idamtier0-netwatcher"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-bastion-idamtier0 = {
    name     = "rg-bastion-idamtier0"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  },

  rg-idam-tier0-netwatcher = {
    name     = "rg-idam-tier0-netwatcher"
    location = "uksouth"
    tags = {
      Provisioner = "Terraform"
    }
  }

}
######################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\role_assignment.auto.tfvars.disabled  #
######################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

role_assignments  =   {

    role-azure-bastion-idamtier0-VM=    {    
      scope        =    "rg-idamtier0-dc"        
      role_definition_name        =    "reader"        
      principal_id        =    "New Azure AD group called AZrole-Firecrest-Azurebastion idamtier0"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    role-azure-bastion-idamtier0=    {    
      scope        =    "rg-bastion-idamtier0"        
      role_definition_name        =    "reader"        
      principal_id        =    "New Azure AD group called AZrole-Firecrest-Azurebastion-idamtier0"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    role-azure-bastion-firecrest-VM=    {    
      scope        =    "rg-idam-tier1"        
      role_definition_name        =    "reader"        
      principal_id        =    "New Azure AD group called Azure-role-Firecrest-Azurebastion-Firecrest"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    role-reader-idamtier0=    {    
      scope        =    "Idam tier0 subscription"        
      role_definition_name        =    "Reader"        
      principal_id        =    "Azure-role-IDAMTier0-sub-reader"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }

}
############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\route.auto.tfvars.disabled  #
############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

##################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\route_table.auto.tfvars.disabled  #
##################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}


route_tables  =   {

    rt-management-1-uks=    {    
      name        =    "rt-management-1-uks"        
      resource_group_name        =    "rg-management"        
      location        =    "uksouth"         
      tags = 
        { Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    rt-dnsteir1-ukw=    {    
      name        =    "rt-dnsteir1-ukw"        
      resource_group_name        =    "rg-idam-tier1-routingtable"        
      location        =    "ukwest"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    rt-dnsteir1-uks=    {    
      name        =    "rt-dnsteir1-uks"        
      resource_group_name        =    "rg-idam-tier1-routingtable"        
      location        =    "uksouth"         
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }
    
    rt-DC-idamtier0-ukw=    {    
      name        =    "rt-DC-idamtier0-ukw"        
      resource_group_name        =    "rg-idamtier0-routingtable"        
      location        =    "ukwest"     
      tags = { 
        Provisioner = "Terraform"        
        Subscription        =    "idd_firecrest_production_idam_sub" 
      } 
    }

}
#############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\storage_account.auto.tfvars  #
#############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

storage_accounts = {

  saidamtier0nsglogsuks = {
    name                     = "saidamtier0nsglogsuks"
    resource_group_name      = "rg-idam-tier0-netwatcher"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "NSG flow logs "
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  saidamtier0nsglogsukw = {
    name                     = "saidamtier0nsglogsukw"
    resource_group_name      = "rg-idam-tier0-netwatcher"
    location                 = "ukwest"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "NSG flow logs"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  satfstateidamtier0sub = {
    name                     = "satfstateidamtier0sub"
    resource_group_name      = "rg-terraform-state-idamtier0"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "Terraform state file"
      Description  = "Long name: saterraformstateidamtier0sub"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  saidamtier0dcuks = {
    name                     = "saidamtier0dcuks"
    resource_group_name      = "rg-idamtier0-dc"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "DC VM storage"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  saidamtier0dcukw = {
    name                     = "saidamtier0dcukw"
    resource_group_name      = "rg-idamtier0-dc"
    location                 = "ukwest"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "DC VM storage"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  satfstatemanagementsub = {
    name                     = "satfstatemanagementsub"
    resource_group_name      = "rg-terraform-state-managementsub"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "Terraform state file"
      Description  = "Long name: saterraformstatemanagementsub"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  saidamtier0vmbootdiaguks = {
    name                     = "saidamtier0vmbootdiaguks"
    resource_group_name      = "rg-idam-tier0"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "Boot diag"
      Description  = "Long name: saidamtier0vmbootdiagnosticsuks"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  saidamtier0vmbootdiagukw = {
    name                     = "saidamtier0vmbootdiagukw"
    resource_group_name      = "rg-idam-tier0"
    location                 = "ukwest"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "Boot diag"
      Description  = "saidamtier0vmbootdiagnosticsukw"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  saidamtier1dnsuks = {
    name                     = "saidamtier1dnsuks"
    resource_group_name      = "rg-firecrestsub-disk"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "Disk storage"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  saidamtier1dnsukw = {
    name                     = "saidamtier1dnsukw"
    resource_group_name      = "rg-firecrestsub-disk"
    location                 = "ukwest"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Provisioner  = "Terraform"
      Purpose      = "Disk Storage"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

}


saidamtier0vmbootdiagukw   =    {    
  name        =    "saidamtier0vmbootdiagukw"        
  resource_group_name        =    "rg-idam-tier0"        
  location        =    "ukwest"        
  account_tier        =    "Standard"        
  account_replication_type        =    "LRS"    
  tags       = {        
    Provisioner     =  "Terraform"        
    Purpose         =   "Boot diag"     
    Description     =   "Long name: saidamtier0vmbootdiagnosticsukw" 
    Subscription    =   "idd_firecrest_production_idam_sub"      
  }  
}



####################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\subnet.auto.tfvars  #
####################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

subnets     =   {

    sub-idamtier0-dc-uks=    {    
        name        =    "sub-idamtier0-dc-uks"        
        resource_group_name        =    "rg-idam-tier0"        
        location        =    "uksouth"        
        virtual_network_name        =    "Vnet-IDAMtier0-uks"        
        address_prefixes        =    ["10.82.17.0/24 "]         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }

    sub-idamtier0-dc-ukw=    {    
        name        =    "sub-idamtier0-dc-ukw"        
        resource_group_name        =    "rg-idam-tier0"        
        location        =    "ukwest"        
        virtual_network_name        =    "Vnet-IDAMTier0-ukw"        
        address_prefixes        =    ["10.93.17.0/24"]         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }


    AzureBastionSubnet=    {    
        name        =    "AzureBastionSubnet"        
        resource_group_name        =    "rg-bastion-idamtier0"        
        location        =    "uksouth"        
        virtual_network_name        =    "Vnet-IDAMTier0-bastion-uks"        
        address_prefixes        =    ["10.82.96.0/26"]         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }

}
###########################################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\virtual_machine_data_disk_attachment.auto.tfvars.disabled  #
###########################################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#############################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\virtual_network.auto.tfvars  #
#############################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

virtual_networks = {

  Vnet-IDAMtier0-uks = {
    name                = "Vnet-IDAMtier0-uks "
    resource_group_name = "rg-idam-tier0"
    location            = "uksouth"
    address_space       = ["10.82.16.0/20"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  Vnet-IDAMTier0-ukw = {
    name                = "Vnet-IDAMTier0-ukw"
    resource_group_name = "rg-idam-tier0"
    location            = "ukwest"
    address_space       = ["10.93.16.0/20"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

  Vnet-IDAMTier0-bastion-uks = {
    name                = "Vnet-IDAMTier0-bastion-uks"
    resource_group_name = "rg-idam-tier0"
    location            = "uksouth"
    address_space       = ["10.82.96.0/24"]
    tags = {
      Provisioner  = "Terraform"
      Subscription = "idd_firecrest_production_idam_sub"
    }
  }

}
#########################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\virtual_network_dns_servers.auto.tfvars  #
#########################################################################################################################################


virtual_network_dns_servers = {

    Vnet-IDAMtier0-uks  =    {  
        name        =    "Vnet-IDAMtier0-uks"  
        # virtual_network_id        =    "Vnet-IDAMtier0-uks"        
        dns_servers        =    ["10.82.17.5"," 10.82.17.6"]         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }
    
    Vnet-IDAMTier0-ukw  =    {   
        name        =    "Vnet-IDAMTier0-ukw"  
        # virtual_network_id        =    "Vnet-IDAMTier0-ukw"        
        dns_servers        =    ["10.93.17.5","10.93.17.6"]         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }

}
##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\virtual_network_gateway.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

#####################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\virtual_network_peering.auto.tfvars  #
#####################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

virtual_network_peerings = {

    vpbastionidamuks=    {    
        name        =    "vpbastionidamuks"        
        resource_group_name        =    "rg-idam-tier0"        
        virtual_network_name        =    "Vnet-IDAMTier0-bastion-uks" 
        # remote_virtual_network_id        =    "Vnet-IDAMtier0-uks"       
        remote_virtual_network_name        =    "Vnet-IDAMtier0-uks"        
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        use_remote_gateways        =    "false"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_aztf_firecrest_production_idam_sub" 
        } 
    }
    
    Vpidamtier0uksbastionuks=    {    
        name        =    "Vpidamtier0uksbastionuks"        
        resource_group_name        =    "rg-idam-tier0"        
        virtual_network_name        =    "Vnet-IDAMtier0-uks"  
        # remote_virtual_network_id        =    "Vnet-IDAMTier0-bastion-uks"      
        remote_virtual_network_name        =    "Vnet-IDAMTier0-bastion-uks"        
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        use_remote_gateways        =    "false"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }
    
    vpbastionuksidamtier0ukw =    {    
        name        =    "vpbastionuksidamtier0ukw "        
        resource_group_name        =    "rg-idam-tier0"        
        virtual_network_name        =    "Vnet-IDAMTier0-bastion-uks"  
        # remote_virtual_network_id        =    "Vnet-IDAMtier0-ukw"      
        remote_virtual_network_name        =    "Vnet-IDAMtier0-ukw"        
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        use_remote_gateways        =    "false"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }
    
    Vpidamtier0bastionuks=    {    
        name        =    "Vpidamtier0bastionuks"        
        resource_group_name        =    "rg-idam-tier0"        
        virtual_network_name        =    "Vnet-IDAMtier0-ukw"  
        # remote_virtual_network_id        =    "Vnet-IDAMTier0-bastion-uks"      
        remote_virtual_network_name        =    "Vnet-IDAMTier0-bastion-uks"        
        allow_virtual_network_access        =    "true"        
        allow_forwarded_traffic        =    "false"        
        allow_gateway_transit        =    "false"        
        use_remote_gateways        =    "false"         
        tags = { 
            Provisioner = "Terraform"        
            Subscription        =    "idd_firecrest_production_idam_sub" 
        } 
    }

}
##############################################################################################################################################
#  C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub\windows_virtual_machine.auto.tfvars.disabled  #
##############################################################################################################################################
global_tags = {
  Provisioner = "Terraform"
}

