function Update-GoogleDynamicDNS {
    [cmdletbinding()]
    param(
        [parameter(ValueFromPipelineByPropertyName)]$username,
        [parameter(ValueFromPipelineByPropertyName)]$password,
        [parameter(ValueFromPipelineByPropertyName)]$domainrecord
    )
    begin {

    }
    Process {
        try {
            Write-Verbose "[$(Get-Date -format G)] Getting External IP"
            $ExternalIP = Invoke-restmethod "https://domains.google.com/checkip"
            Write-Verbose "[$(Get-Date -format G)] IP Address is $externalIP"
        }
        Catch {
            Throw $_.Exception
        }
        Write-Verbose "[$(Get-Date -format G)] Updating Record"
        try {
            $cred = New-Object System.Management.Automation.PSCredential -ArgumentList "$username", $($Password | ConvertTo-SecureString -AsPlainText -Force)
            Invoke-RestMethod -method Post `
                -Uri "https://domains.google.com/nic/update?hostname=$domainrecord&myip=$($ExternalIP)" `
                -Authentication Basic `
                -Credential $cred
        }
        Catch {
            throw $_.Exception
        }
    }
    end {

    }
    
}
