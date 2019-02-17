Invoke-WebRequest -Uri "https://raw.githubusercontent.com/tonyskidmore/poshud-docker/master/dashboard.ps1" -Method Get -OutFile /tmp/dashboard.ps1
& /tmp/dashboard.ps1