<#
Copyright (c) 2016 Microsoft Corporation. All Rights Reserved.
Licensed under the MIT License (MIT)
#>

function Add-RSSSLCertificateBinding
{
<#
.SYNOPSIS
Create SSL Certificate Bindings
.EXAMPLE
Add-RSSSLCertificateBinding -Application ReportManager
.EXAMPLE
 
.NOTES

UrlString does not include the virtual directory name. The SetVirtualDirectory method is provided for that purpose.

URL reservations are created for the current windows service account. Changing the windows service account requires updating all the URL reservations manually.

This method causes all application domains to hard recycle. Application domains are restarted after this operation is complete.
#>
    [cmdletbinding()]
    param
    (
        [Parameter(
            HelpMessage = 'The computer hosting SSRS',
            Position    = 0,
            ValueFromPipelineByPropertyName = $true
        )]
        [Alias('Server')]
        [string[]]$ComputerName = 'localhost',

        [string]
        $InstanceName='MSSQLSERVER',

        [Alias('UserName')]
        [PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        # The name of application for which to set the virtual directory.
        [string]
        $Application,

        [string]
        $CertificateHash,

        [string]
        $IPAddress,

        [int32]
        $Port
    )

    begin
    {
        # Build a hashtable for spallting that takes into account optional values
        $rsParam = @{}
        if($PSBoundParameters.Instancename)
        {
            $rsParam.Instancename = $PSBoundParameters.Instancename
        }
        if($PSBoundParameters.Credential)
        {
            $rsParam.Credential = $PSBoundParameters.Credential
        }
    }
    process
    {
        foreach($node in $ComputerName) 
        {
            Write-Verbose $node
            $rsParam.ComputerName = $node         
            $rsSettings = Get-RSConfigurationSetting @rsParam 

            $CimArguments = [ordered]@{
                Application     = $Application  
                CertificateHash = $CertificateHash
                IPAddress       = $IPAddress
                Port            = [int32]$Port
                Lcid            = [int32](Get-Culture).Lcid
            }

            Write-Verbose 'CreateSSLCertificateBinding'
            Invoke-CimMethod -InputObject $rsSettings -MethodName CreateSSLCertificateBinding -Arguments $CimArguments | Out-Null
        }
    }
}
