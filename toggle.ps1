$bios = Get-WmiObject -Namespace root\HP\InstrumentedBIOS -Class HP_BIOSSettingInterface
$biosSettings  = Get-WmiObject -Namespace root\HP\InstrumentedBIOS -Class HP_BIOSSetting

$setting = $biosSettings | Where-Object Name -eq "Battery Health Manager"

$isOn = $setting.CurrentValue -match "On"

$password = "<utf-16/>your password"

if ($isOn) {
    $bios.SetBIOSSetting(
        "Adaptive Battery Extender",
        "Disable",
        $password
    )
    
    $bios.SetBIOSSetting(
        "Battery Health Manager",
        "Maximize my battery health Off",
        $password
    )
} else {
    $bios.SetBIOSSetting(
        "Adaptive Battery Extender",
        "Enable",
        $password
    )
    
    $bios.SetBIOSSetting(
        "Battery Health Manager",
        "Maximize my battery health On",
        $password
    )
}

