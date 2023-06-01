Function AD{
$ADname = Read-Host "Enter name: "
$ADGivenName = Read-Host "Enter givenname: "
$ADSurname = Read-Host "Enter surname : "
$ADSamAccountName = Read-Host "Enter user logon name: "
$ADPath = Read-Host "OU: "
$ADPath = "OU=" + $ADPath
$ADPathCheck=Read-Host "Add one more OU(1/0): "
while($ADPathCheck -eq 1){
	$ADPathNew=Read-Host "OU: "
	$ADPathNew="OU=" + $ADPathNew
	$ADPath = $ADPathNew + "," + $ADPath
	$ADPathCheck=Read-Host "Add one more OU(1/0): "
}
$ADPath = $ADPath + ",DC=It-club,DC=com"
$ADUserPrincipalName = $ADName + "@it-club.com"
New-ADUser -Name $ADName -GivenName $ADGivenName -Surname $ADSurname -SamAccountName $ADSamAccountName -UserPrincipalName $ADUserPrincipalName -Path $ADPath -AccountPassword(Read-Host -AsSecureString "Input Password") -Enabled $true
}
AD
