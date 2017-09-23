Invoke-RestMethod 'https://raw.githubusercontent.com/paulwarwicker/bootstrap/master/bootstrap_common.ps1' | iex

write-host "Apply basic setup recipe"
Invoke-RestMethod -UseBasicParsing 'https://raw.githubusercontent.com/paulwarwicker/bootstrap/master/basic.rb' | out-file -encoding ascii -filepath c:/basic.rb
chef-apply c:/basic.rb

chocolatey list -localonly
write-host "bootstrap.ps1 done"