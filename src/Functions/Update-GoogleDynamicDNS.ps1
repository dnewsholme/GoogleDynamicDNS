function Update-GoogleDynamicDNS {
    [cmdletbinding()]
    param(
        [parameter(ValueFromPipelineByPropertyName)]$username,
        [parameter(ValueFromPipelineByPropertyName)]$password,
        [parameter(ValueFromPipelineByPropertyName)]$domainrecord
    )
    begin {
     Add-Type -AssemblyName System.Web
     $domainrecord = [System.Web.HttpUtility]::UrlEncode($domainrecord) 
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
            $cred = New-Object System.Management.Automation.PSCredential -ArgumentList "$username", $($password | ConvertTo-SecureString -AsPlainText -Force)
            $result = Invoke-RestMethod -method Post `
                -Uri "https://domains.google.com/nic/update?hostname=$domainrecord&myip=$($ExternalIP)" `
                -Authentication Basic `
                -Credential $cred
        }
        Catch {
            throw $_.Exception
        }
    }
    end {
        Write-Output "[$(Get-Date -format G)] $result"
    }
    
}
