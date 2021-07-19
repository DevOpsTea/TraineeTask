#First session
$User1 = "Administrator"
$pass1 = ConvertTo-SecureString -String "u.jvNTe)f4b(PMwmvTWY!8.-Lc3YTZeV" -AsPlainText -Force

$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User1, $pass1
$s = New-PSSession -computerName "18.234.167.238" -credential $Credential
Invoke-Command -Session $s -ScriptBlock {C:\Redeploy.ps1} 
Remove-PSSession $s

#SecondSession
$User2 = "Administrator"
$pass2 = ConvertTo-SecureString -String 'q=Hj(EkSQo?$8JUaHgvcEdFj4Uo2i)Bs' -AsPlainText -Force
$Credential2 = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User2, $pass2
$ss = New-PSSession -computerName "52.91.111.253" -credential $Credential2
Invoke-Command -Session $ss -ScriptBlock {C:\Redeploy.ps1}
Remove-PSSession $ss