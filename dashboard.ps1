Import-Module UniversalDashboard.Community

$Data = Import-CSV -Path /app/data/abc-runner1-config-reports.csv

$Dashboard = New-UDDashboard -Title "ALOHA - Compliance Results" -Content {
        New-UDChart -Title "Bottom Legend" -Type "Bar" -Endpoint {
                $Data | Out-UDChartData -LabelProperty "ComputerName"  -Dataset @(
                        New-UDBarChartDataset -Label "Pass" -DataProperty RegStandardPass -BackgroundColor "green" -BorderColor "black" -BorderWidth 2
                        New-UDBarChartDataset -Label "Fail" -DataProperty RegStandardFail -BackgroundColor "red" -BorderColor "black" -BorderWidth 2
                )
        }
}


Start-UDDashboard -Port 8585 -Dashboard $Dashboard -Name 'ALOHA' -Wait -AutoReload
