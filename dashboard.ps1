$MyDashboard = New-UDDashboard -Title "Hello World" -Content {
    New-UDCard -Title "Hello World - Universal Dashboard" 
}
Start-UDDashboard -Port 8585 -Dashboard $MyDashboard -Name 'HelloWorldDashboard' -Wait