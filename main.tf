# #######################################################
# Azure Resource Naming is easier with this
# Terraform Module for the AzureRM Provider
#
# Source:
# https://github.com/Build5Nines/tf-azure-region-naming
#
# Author: Chris Pietschmann (https://pietschsoft.com)
# Copyright (c) 2025-2026 Build5Nine LLC
# #######################################################

# Azure Region helper module — provides abbreviations, paired regions,
# geography metadata, and policy-compliance helpers.
module "azure_region" {
  source  = "Build5Nines/region-map/azure"
  version = "~> 1.0"

  primary_region       = var.location
  secondary_region     = var.location_secondary
  strategy             = length(trimspace(var.location_secondary)) > 0 ? "custom" : "paired-region"
  region_abbreviations = var.location_abbreviations
}

locals {
  # Canonical short region name derived from the provided location (e.g., "East US" -> "eastus")
  location_canonical = lower(replace(var.location, " ", ""))

  # Region abbreviation map — sourced from the azure-region module (includes user overrides).
  location_abbr = module.azure_region.region_abbreviations

  # Use explicit abbreviation when available; otherwise fall back to canonical short region name (e.g., eastus)
  # Build name suffix parts from the pattern array and then join into a string for consumers
  name_suffix = [for part in var.name_suffix :
    replace(
      replace(
        replace(
          part,
          "{org}", var.organization
        ),
        "{env}", var.environment
      ),
      "{loc}", try(local.location_abbr[local.location_canonical], try(local.location_abbr[var.location], local.location_canonical))
    )
  ]

  name_prefix = [for part in var.name_prefix :
    replace(
      replace(
        replace(
          part,
          "{org}", var.organization
        ),
        "{env}", var.environment
      ),
      "{loc}", try(local.location_abbr[local.location_canonical], try(local.location_abbr[var.location], local.location_canonical))
    )
  ]
}

# Azure Naming Module
# https://github.com/Azure/terraform-azurerm-naming
module "azure_naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.3"

  suffix = local.name_suffix
  prefix = local.name_prefix

  unique-seed            = var.unique_seed
  unique-length          = var.unique_length
  unique-include-numbers = var.unique_include_numbers
}
