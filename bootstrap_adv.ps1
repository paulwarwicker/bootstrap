Invoke-RestMethod 'https://raw.githubusercontent.com/paulwarwicker/bootstrap/master/bootstrap_common.ps1' | iex

write-host "Apply advanced setup recipe"
Invoke-RestMethod -UseBasicParsing 'https://raw.githubusercontent.com/paulwarwicker/bootstrap/master/advanced.rb' | out-file -encoding ascii -filepath c:/advanced.rb
chef-apply c:/advanced.rb

chocolatey list -localonly
write-host "bootstrap_adv done"