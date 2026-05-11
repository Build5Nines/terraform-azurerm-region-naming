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

output "base_suffix" {
  description = "The base prefix for Azure resource names based on the organization and environment."
  value       = local.name_suffix
}

output "base_prefix" {
  description = "The base prefix for Azure resource names based on the organization and environment."
  value       = local.name_prefix
}

output "resources" {
  description = "The Azure resources with names that match the naming convention defined."
  value       = module.azure_naming
}

output "organization" {
  description = "The organization name part used in the naming convention defined."
  value       = var.organization
}

output "environment" {
  description = "The environment name part used in the naming convention defined."
  value       = var.environment
}

output "location" {
  description = "The Azure Region used in the naming convention defined."
  value       = var.location
}

output "location_abbreviation" {
  description = "The abbreviation for the specified Azure region."
  value       = module.azure_region.primary.short
}

output "location_secondary" {
  description = "The standardized Azure region name for the specified location."
  value       = length(trimspace(var.location_secondary)) > 0 ? var.location_secondary : module.azure_region.secondary.name
}

output "region" {
  description = "Full Azure region metadata from the azure-region module (primary, secondary, geography, compliance zone, and policy helpers)."
  value       = module.azure_region
}
