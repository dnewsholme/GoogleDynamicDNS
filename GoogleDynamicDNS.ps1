try {
    Write-Verbose "[$(Get-Date -format G)] Importing Function For Updating Dynamic DNS"
    . $PSScriptRoot\Functions\Update-GoogleDynamicDNS.ps1   
}
Catch {
    . .\Functions\Update-GoogleDynamicDNS.ps1 
}

#$config = Get-Content $PSScriptRoot\config.json | ConvertFrom-Json -ErrorAction Stop
Write-Verbose "[$(Get-Date -format G)] Importing Config file"
$config = Get-Content $psscriptroot\config.json | ConvertFrom-Json
Write-Verbose "[$(Get-Date -format G)] Starting Dynamic DNS Update"
$config | Update-GoogleDynamicDNS