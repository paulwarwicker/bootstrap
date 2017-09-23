write-host "Setup execution policy for both the 64 bit and 32 bit shells"
set-executionpolicy remotesigned
start-job -runas32 {set-executionpolicy remotesigned} | receive-job -wait

write-host "Configure Windows Explorer"
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

write-host "Configure Chocolatey"
choco feature enable -n allowGlobalConfirmation

write-host "Disable Windows firewall"
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

write-host "Remove Windows 10 Apps"
$packages = @(
"*3d*",
"*communicationsapps*",
"*feedback*", 
"*officehub*",
"*getstarted*", 
"*skype*", 
"*zune*", 
"*maps*", 
"*messaging*", 
"*solitaire*", 
"*wallet*", 
"*bing*", 
"*onenote*",
"*oneconnect*",
"*mspaint*",
"*people*",
"*phone*",
"*photos*",
"*sticky*",
"*sway*",
"*soundrecorder*",
"*xbox*",
"*netflix*",
"*facebook*",
"*advertising*",
"*twitter*",
"*parental*"
)
# leaving *alarms* *appconnector* *appinstaller* *calculator* *store*

foreach ($package in $packages) {
   get-appxpackage $package | remove-appxpackage 2>&1>$null
}

write-host "Install fixed version of ChefDK"
Invoke-RestMethod 'https://omnitruck.chef.io/install.ps1' | iex
install-project chefdk -verbose -version 2.2.1

refreshenv