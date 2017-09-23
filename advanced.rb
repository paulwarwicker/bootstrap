# chocolatey packages latest versions with default options
packages =  %w[ 7zip agentransack ant cpu-z curl cygwin dbgview docker fiddler4 emacs64 filezilla golang hashcheck irfanview jdk8 jenkins logstash nodejs-lts notepadplusplus nvm putty rdcman soapui sourcetree sysinternals tortoisehg visualstudiocode vlc windbg winmerge winscp wireshark xming ]
packages.each do |pkg|
  chocolatey_package pkg
end

# chocolatey packages specific versions with default options
packages =  [["eclipse", "4.7"]]
packages.each do |(pkg,ver)|
  chocolatey_package pkg do
    version ver
  end
end

# chocolatey packages with specific options and/or version
chocolatey_package 'git' do
  package_name 'git'
  options '-params /GitAndUnixToolsOnPath'
end

chocolatey_package 'softerraldapbrowser' do
  options '--allow-empty-checksums'
end

# ruby gems
gems = %w[kitchen-pester]
gems.each do |gem|
  chef_gem gem do
    compile_time false if respond_to?(:compile_time)
  end
end

# visual studio code extensions
extensions = %w[ ms-vscode.PowerShell lukehoban.go PeterJausovec.vscode-docker Pendrica.chef redhat.java eriklynd.json-tools DotJoshJohnson.xml yzhang.markdown-all-in-one DavidAnson.vscode-markdownlint yzane.markdown-pdf ]
extensions.each do |ext|
  execute "install vscode extension #{ext}" do
    command "code --install-extension #{ext}"
    cwd "C:/Program Files/Microsoft VS Code/bin"
  end
end

#powershell_script 'Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force' do
#end

# powershell extensions
modules = %w[ PSReadline ]
modules.each do |mod|
  powershell_package mod do
    action :install
  end
end

# setup chef
directory 'C:\opt\sw\src\Chef' do
  recursive true
  action :create
end

execute 'chef generate repo example_repo -p' do
  cwd 'C:\opt\sw\src\Chef'
end