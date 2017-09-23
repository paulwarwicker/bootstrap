Invoke-RestMethod 'https://github.com/paulwarwicker/bootstrap/blob/master/bootstrap_common.ps1' | iex

write-host "Apply advanced setup recipe"
Invoke-RestMethod -UseBasicParsing 'https://github.com/paulwarwicker/bootstrap/blob/master/advanced.rb' | out-file -encoding ascii -filepath c:/advanced.rb
chef-apply c:/advanced.rb

chocolatey list -localonly
write-host "bootstrap_adv done"