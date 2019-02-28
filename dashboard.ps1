Import-Module UniversalDashboard.Community

$Schedule = New-UDEndpointSchedule -Every 1 -Minute

$EveryMinute = New-UDEndpoint -Schedule $Schedule -Endpoint {
    $Cache:Data = Import-CSV -Path /app/data/abc-runner1-config-reports.csv
}

$Dashboard = New-UDDashboard -Title "ALOHA - Compliance Results" -Content {
        New-UDChart -Title "Standards Compliance" -Type "Bar" -Endpoint {
                $Cache:Data | Out-UDChartData -LabelProperty "ComputerName"  -Dataset @(
                        New-UDBarChartDataset -Label "Pass" -DataProperty RegStandardPass -BackgroundColor "green" -BorderColor "black" -BorderWidth 2
                        New-UDBarChartDataset -Label "Fail" -DataProperty RegStandardFail -BackgroundColor "red" -BorderColor "black" -BorderWidth 2
                )
        } -AutoRefresh -RefreshInterval 1
}


Start-UDDashboard -Port 8585 -Dashboard $Dashboard -Name 'ALOHA' -Wait -AutoReload -EndPoint @($EveryMinute)
