Import-Module WebAdministration
#cleaningup
Stop-Website -Name "MyWebsite"
Remove-WebSite -Name "MyWebsite"
Remove-WebAppPool -Name "NewAppPool"
Remove-Item –Path "C:\MyWebsite\index.html"
#Redeploy
New-WebAppPool -Name "NewAppPool"
New-WebSite -Name "MyWebsite" -Port 8080 -HostHeader "" -IPAddress "*" -PhysicalPath "C:\MyWebsite" -ApplicationPool "NewAppPool" -force
New-WebApplication -Name "TestApp" -Site "MyWebsite" -PhysicalPath "C:\MyWebsite" -ApplicationPool "NewAppPool"
New-Item -ItemType File -Name 'index.html' -Path 'C:\MyWebsite\' -Value 'TEST1'
Start-Website -Name "MyWebsite"
