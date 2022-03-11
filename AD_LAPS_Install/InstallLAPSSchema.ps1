function Get-ScriptDirectory {
    Split-Path -Parent $PSCommandPath
}
$scriptPath = Get-ScriptDirectory

Install-Module ADMPwd.ps

copy-item -path ($scriptpath + "\AdmPwd.admx") -destination "C:\Windows\PolicyDefinitions"
copy-item -path ($scriptpath + "\AdmPwd.adml") -destination "C:\Windows\PolicyDefinitions\en-US"

Import-Module ADMPwd.ps
Update-AdmPwdADSchema
Set-AdmPwdComputerSelfPermission -OrgUnit (Get-ADDomain).distinguishedname