#######################################################################################
# NOTE: Fill out necessary variable's values to override default values
# and uncomment out variables that will overridden 

####################################################################
# PRIMARY REGION Virtual Network, Subnets, and NSG related variables 

/*

rg_name                           = 
location                          = 
vnet_name                         = 
#Virtual networks address space
address_space                     = 
#Names of network security groups
nsg_name1                         = 
nsg_name2                         = 
nsg_name3                         = 
#Subnet names
subnet_name1                      = 
subnet_name2                      = 
subnet_name3                      = 
subnet_name4                      = 
#subnet address cidr blocks
address_prefixes1                 = 
address_prefixes2                 = 
address_prefixes3                 = 
address_prefixes4                 = 
tags {}

*/


####################################################################
# SECONDARY REGION Virtual Network, Subnets, and NSG related variables. 
# Note: these variables are given t values to prevent repeated values from Primary to Secondary region

/*
rg_name_2                         = 
location_2                        = 
vnet_name_2                       = 
#Virtual networks address space
address_space_2                   = 
#Names of network security groups
nsg_name1_2                       = 
nsg_name2_2                       = 
nsg_name3_2                       = 
#Subnet names
subnet_name1_2                    = 
subnet_name2_2                    = 
subnet_name3_2                    = 
subnet_name4_2                    = 
#subnet address cidr blocks
address_prefixes1_2               = 
address_prefixes2_2               = 
address_prefixes3_2               = 
address_prefixes4_2               = 

*/