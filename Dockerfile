# https://hub.docker.com/_/microsoft-powershell
# docker pull mcr.microsoft.com/powershell:6.1.2-centos-7
# docker pull mcr.microsoft.com/powershell:6.1.2-alpine-3.8
# docker pull mcr.microsoft.com/powershell:ubuntu-bionic
FROM mcr.microsoft.com/powershell:alpine-3.8
RUN pwsh -c 'Install-Module universaldashboard -Acceptlicense -Force' && \
    pwsh -c 'Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted' && \
    pwsh -c 'Install-Module -Name Az -Force -Confirm:$false' && \
    pwsh -c 'Invoke-WebRequest -Uri "https://raw.githubusercontent.com/tonyskidmore/poshud-docker/master/Get-UdDashboard.ps1" -Method Get -OutFile /tmp/Get-UdDashboard.ps1'

CMD [ "pwsh","-c","& /tmp/Get-UdDashboard.ps1" ]

