Function DHCP {
    $ServerName = "WS2019"
    $ScopeName = Read-Host "Enter the name of the DHCP scope: "
    $ScopeDescription = Read-Host "Enter the description of the DHCP scope: "
    $ScopeStartRange = Read-Host "Enter the start IP address of the DHCP scope: "
    $ScopeEndRange = Read-Host "Enter the end IP address of the DHCP scope: "
    $ScopeSubnet = Read-Host "Enter the subnet mask of the DHCP scope: "
    $ScopeNetwork = Read-Host "Enter the IP-Network: "
    

    Add-DhcpServerv4Scope -ComputerName $ServerName `
        -Name $ScopeName `
        -StartRange $ScopeStartRange `
        -EndRange $ScopeEndRange `
        -SubnetMask $ScopeSubnet `
        -LeaseDuration "8.00:00:00" `
        -State Active `
        -Description $ScopeDescription

        $ExcludeIP = Read-Host "Do you want to exclude a specific IP address from the scope? (y/n): "
    if ($ExcludeIP.ToUpper() -eq "y") {
        $ScopeExcludeStartRange = Read-Host "Enter the start exclude IP address of the DHCP scope: "
        $ScopeExcludeEndRange = Read-Host "Enter the end exclude IP address of the DHCP scope: "
        Add-DhcpServerv4ExclusionRange -ComputerName $ServerName `
            -ScopeId $ScopeNetwork `
            -StartRange $ScopeExcludeStartRange `
            -EndRange $ScopeExcludeEndRange
    }
}

DHCP
