# https://hub.docker.com/_/microsoft-powershell
# docker pull mcr.microsoft.com/powershell:6.1.2-centos-7
# docker pull mcr.microsoft.com/powershell:6.1.2-alpine-3.8
FROM mcr.microsoft.com/powershell:ubuntu-18.04
# FROM mcr.microsoft.com/powershell:centos-7

RUN pwsh -c 'Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted' && \
    # pwsh -c 'Install-Module universaldashboard -Acceptlicense -Force' && \
    pwsh -c 'Install-Module UniversalDashboard.Community -Acceptlicense -Force' && \
    # pwsh -c 'Install-Module -Name Az -Force -Confirm:$false' && \
    pwsh -c 'New-Item -Path /app -ItemType Directory'

COPY Get-UdDashboard.ps1 /app

# CMD [ "pwsh","-c","& /app/Get-UdDashboard.ps1" ]
