

$Schedule = New-UDEndpointSchedule -Every 1 -Minute

$EveryMinute = New-UDEndpoint -Schedule $Schedule -Endpoint {
    $Data = Import-Csv -Path "/var/alohadata/abc-runner1-config-reports.csv"
}


$Dashboard = New-UDDashboard -Title "Charts - Legend" -Content {

    $LegendOptions = New-UDChartLegendOptions -Position bottom
    $Options = New-UDLineChartOptions -LegendOptions $LegendOptions

    New-UDChart -Title "Bottom Legend" -Type "Line" -Endpoint {
        $Data | Out-UDChartData -LabelProperty "ComputerName"  -Dataset @(
            New-UDLineChartDataset -Label "ALOHA Data" -DataProperty RegStandardFail -BackgroundColor "#205D4CFF" -BorderColor "#5D4CFF" -BorderWidth 3
        )
    } -Options $Options
}

Start-UDDashboard -Port 8585 -Dashboard $Dashboard -Name 'ALOHA' -Wait -Endpoint @($EveryMinute)
