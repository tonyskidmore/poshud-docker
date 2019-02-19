Remote-Item -Path /app/dashboard.ps1 -Force -ErrorAction SilentlyContinue
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/tonyskidmore/poshud-docker/master/dashboard.ps1" -Method Get -OutFile /app/dashboard.ps1
& /app/dashboard.ps1
