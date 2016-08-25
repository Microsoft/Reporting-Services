﻿#
# Module manifest for module 'PSSSRS'
#
# Generated by: Kevin Marquette
#
# Generated on: 8/24/2016
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'psssrs.psm1'

# Version number of this module.
ModuleVersion = '0.0.2'

# ID used to uniquely identify this module
GUID = '4208a265-c082-4acf-9ae3-935743aa4a42'

# Author of this module
Author = 'Community'

# Company or vendor of this module
CompanyName = 'Microsoft'

# Copyright statement for this module
Copyright = 'Copyright (c) 2016 Microsoft Corporation.. All rights reserved.'

# Description of the functionality provided by this module
# Description = ''

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module
FunctionsToExport = 'Add-RSReservedURL', 'Add-RSSSLCertificateBinding', 
               'Backup-RSEncryptionKey', 'Disable-RSSSL', 'Enable-RSSSL', 
               'Get-RSAdminSiteUrl', 'Get-RSConfigurationSettings', 
               'Get-RSInstalledSharePointVersions', 'Get-RSIPAddresses', 
               'Get-RSReportServersInDatabase', 'Get-RSReservedUrls', 
               'Get-RSSSLCertificate', 'Get-RSSSLCertificateBindings', 
               'Initialize-ReportServer', 'Invoke-ReencryptSecureInformation', 
               'New-RSDatabaseCreationScript', 'New-RSDatabaseRightsScript', 
               'New-RSDatabaseUpgradeScript', 'New-RSWebServiceProxy', 
               'Remove-RSEncryptedInformation', 'Remove-RSEncryptionKey', 
               'Remove-RSReservedURL', 'Remove-RSSSLCertificateBinding', 
               'Remove-RSUnattendedExecutionAccount', 'Restore-RSEncryptionKey', 
               'Set-RSDatabaseConnection', 'Set-RSDatabaseLogonTimeout', 
               'Set-RSDatabaseQueryTimeout', 'Set-RSEmailConfiguration', 
               'Set-RSExtendedProtectionSettings', 'Set-RSServiceState', 
               'Set-RSUnattendedExecutionAccount', 'Set-RSVirtualDirectory', 
               'Set-RSWindowsServiceIdentity'

# Cmdlets to export from this module
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module
AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}


