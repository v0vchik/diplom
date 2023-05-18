
Function DNS{
$Check = Read-Host "Primary(1)/Reverse(2): "

If($Check -eq 1){
$ZoneName = Read-Host "Enter the name of the DNS zone: "
$ZoneFile = Read-Host "Enter the path and filename for the zone file: "
$DynamicUpdate = Read-Host "Enter the dynamic update type (None/NonsecureAndSecure/SecureOnly): "
Add-DnsServerPrimaryZone -Name $ZoneName -ZoneFile $ZoneFile -DynamicUpdate $DynamicUpdate -PassThru
Write-Host "DNS zone '$ZoneName' has been created."
}
ElseIf($Check -eq 2){
Import-Module DnsServer
# Set the parameters for the reverse DNS zone
$ReverseZoneName = Read-Host "Enter decired reverse zone name(0.168.192.in-addr.arpa): "  # Replace with your desired reverse zone name
$ReverseZoneIPAddress = Read-Host "Enter decired reverse zone IP-address(192.168.0.0)"       # Replace with your desired reverse zone IP address

# Create the reverse DNS zone using dnscmd
dnscmd /ZoneAdd $ReverseZoneName /Primary /file $ReverseZoneName.dns /load

# Create the reverse lookup range
dnscmd /RecordAdd $ReverseZoneName $ReverseZoneIPAddress PTR reverse.example.com


}
}
DNS