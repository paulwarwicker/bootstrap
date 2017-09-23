. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force
Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/paulwarwicker/bootstrap/master/bootstrap_adv.ps1

#$cred=Get-Credential destiny\paulw
#Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/paulwarwicker/bootstrap/master/bootstrap_adv.ps1 -Credential $cred