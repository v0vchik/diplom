Function GPolitics{
Write-Host "--Enter option number--"
Write-Host "1. New Group Policy"
Write-Host "2. Bind a group policy to a group"
Write-Host "3. New option for group policy"
$Choise = Read-Host("Enter number: ")
switch ($Choise){
1{
$GPname = Read-Host "Enter new group politics name: "
$GPcomments = Read-Host "Enter comments new group politics: "

New-GPO -Name $GPname -Comment $GPcomments ;}
2{
  $GPOName = Read-Host "Enter group politics name: "
  $GPOGroup = Read-Host "Enter group name: "
  Get-GPO $GPOName | New-GPLink -Target "$GPOGroup"
}
3{
$GPOname = Read-Host "Enter group politics name: "
$GPORegistryPath = Read-Host "Enter registry path: "
Write-Host $GPORegistryPath
$GPOValueName = Read-Host "Enter value name: "
$GPOType = Read-Host "Enter type(String, DWORD, QWORD, Binary): "
$GPOValueData = Read-Host "Enter value data: "
$GPOValueData = [int]$GPOValueData
Set-GPRegistryValue -Name $GPOname -Key $GPORegistryPath -ValueName $GPOValueName -Value $GPOValueData -Type $GPOType

}
}
}

GPolitics