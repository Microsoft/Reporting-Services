<#
Copyright (c) 2016 Microsoft Corporation. All Rights Reserved.
Licensed under the MIT License (MIT)
#>

function Set-RSDatabaseQueryTimeout
{
<#
.SYNOPSIS
Specifies the default time-out value for report server database queries.
.EXAMPLE
Set-RSDatabaseQueryTimeout -QueryTimeout 120
.EXAMPLE
 
.NOTES
https://msdn.microsoft.com/en-us/library/ms155080(v=sql.110).aspx
SetDatabaseQueryTimeout(System.Int32 QueryTimeout)

#>
    [cmdletbinding(
        SupportsShouldProcess=$true,
        ConfirmImpact="Medium"
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

        [Alias('UserName')]
        [PSCredential]
        [System.Management.Automation.Credential()]
        $Credential,

        [int32]
        $QueryTimeout = 120
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
                QueryTimeout = $QueryTimeout  
            }

            if ($pscmdlet.ShouldProcess('Set Database Query Timeout')) 
            {
                Invoke-CimMethod -InputObject $rsSettings -MethodName SetDatabaseQueryTimeout -Arguments $CimArguments | Out-Null
            }
        }
    }
}


