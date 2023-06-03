# Вивести меню вибору ролей
Write-Host "Виберіть роль для встановлення:"
Write-Host "1. Active Directory"
Write-Host "2. DNS"
Write-Host "3. DHCP"

# Запитати користувача про вибір ролі
$choice = Read-Host "Введіть номер ролі"

# Встановити обрану роль
switch ($choice) {
    1 {
        Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -Restart
        break
    }
    2 {
        Install-WindowsFeature -Name DNS -IncludeManagementTools -Restart
        break
    }
    3 {
        Install-WindowsFeature -Name DHCP -IncludeManagementTools -Restart
        break
    }
    default {
        Write-Host "Невірний вибір. Спробуйте ще раз."
        break
    }
}
