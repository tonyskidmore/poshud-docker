

$Schedule = New-UDEndpointSchedule -Every 1 -Minute

$EveryMinute = New-UDEndpoint -Schedule $Schedule -Endpoint {
    $Cache:ModuleCount = (Get-Module -ListAvailable).Count
}

$moduleCount = New-UDEndpoint -Url "/moduleCount" -Endpoint {
    (Get-Module -ListAvailable).Count
}

$CachedModuleCount = New-UDEndpoint -Url "/cached-moduleCount" -Endpoint {
    $Cache:ModuleCount
}

$dashboard = New-UDDashboard -Title "Aloha" -Content {
    New-UDCounter -Title "Aloha" -Id "Counter" -Endpoint {
        $Cache:ModuleCount
    } -AutoRefresh -RefreshInterval 1
}

$MyDashboard = New-UDDashboard -Title "Hello Aloha" -Content {
    New-UDCard -Title "Say Hello to ALOHA"
}

Start-UDDashboard -Port 8585 -Dashboard $dashboard -Name 'ALOHA' -Wait -Endpoint @($EveryMinute, $ModuleCount, $CachedModuleCount)
