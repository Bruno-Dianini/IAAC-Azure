#################################
# INSTALL CHOCOLATEY IN THE VMS
#################################
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

#################################
# INSTALL VSCODE WITH CHOCOLATEY
#################################
choco install vscode -y


#################################
# INSTALL PYTHON 3.8.10 WITH CHOCOLATEY
#################################
choco install python3 --version=3.8.10 -y

#################################
# INSTALL MICROSOFT STORAGE EXPLORER WITH CHOCOLATEY
#################################
choco install microsoftazurestorageexplorer -y
