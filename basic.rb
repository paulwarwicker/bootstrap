# chocolatey packages with default options
packages =  %w[7zip jdk8 putty rcdman sourcetree sysinternals]
packages.each do |pkg|
  chocolatey_package pkg
end

# ruby gems
gems = %w[kitchen-pester]
gems.each do |gem|
  chef_gem gem do
    compile_time false if respond_to?(:compile_time)
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