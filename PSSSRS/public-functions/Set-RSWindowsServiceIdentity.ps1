<#
Copyright (c) 2016 Microsoft Corporation. All Rights Reserved.
Licensed under the MIT License (MIT)
#>

function Set-RSWindowsServiceIdentity
{
<#
.SYNOPSIS
Sets the Windows Service Identity
.EXAMPLE
Set-RSWindowsServiceIdentity -UseBuiltInAccount -ServiceIdentityCredential $credential
.EXAMPLE
 
.NOTES
https://msdn.microsoft.com/en-us/library/ms154512(v=sql.110).aspx

SetWindowsServiceIdentity(
    System.Boolean UseBuiltInAccount, 
    System.String Account, 
    System.String Password
)

#>
    [cmdletbinding(
        SupportsShouldProcess=$true,
        ConfirmImpact="High"
    )]
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

        [PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        # Indicates whether the specified account is a built-in Windows account.
        [switch]
        $UseBuiltInAccount,

        # The Windows account to use to run the Windows service, in the format "DOMAIN\alias".
        [PSCredential]
        [System.Management.Automation.Credential()]
        $AccountCredential
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
                UseBuiltInAccount = [bool]$UseBuiltInAccount
                Account           = $AccountCredential.UserName
                Password          = $AccountCredential.GetNetworkCredential().Password            
            }

            if ($pscmdlet.ShouldProcess('Set Windows Service Identity')) 
            {
                Invoke-CimMethod -InputObject $rsSettings -MethodName SetWindowsServiceIdentity -Arguments $CimArguments | Out-Null
            }
        }
    }
}
