try {
    Write-Verbose "[$(Get-Date -format G)] Importing Function For Updating Dynamic DNS"
    . $PSScriptRoot\Functions\Update-GoogleDynamicDNS.ps1   
}
Catch {
    . .\Functions\Update-GoogleDynamicDNS.ps1 
}
if ($env:GDNS_FREQUENCY){
    $frequency = $env:GDNS_FREQUENCY
}
else {$frequency = 300 }
Write-verbose "Checking for Environment Variables"
if ("$ENV:GDNS*") {
    $config = [PSCustomObject]@{
        Userame      = $ENV:GDNS_USERNAME
        password     = $ENV:GDNS_PASSWORD
        Domainrecord = $ENV:GNS_DOMAINRECORD
    }
}
Else {
    Write-Verbose "[$(Get-Date -format G)] Importing Config file"
    $config = Get-Content $psscriptroot\config\config.json | ConvertFrom-Json
}
Write-Verbose "[$(Get-Date -format G)] Starting Dynamic DNS Update"
While ($loop -ne $false){
    $config | Update-GoogleDynamicDNS
    Start-Sleep -Seconds $frequency
}