<#
    Provies an example of creating a chart with multiple datasets.
#>

Import-Module UniversalDashboard.Community

$Data = @(
    @{Animal="Frog";Count=10}
    @{Animal="Tiger";Count=1}
    @{Animal="Bat";Count=34}
    @{Animal="Fox";Count=20}
)

$Dashboard = New-UDDashboard -Title "Charts - Colors" -Content {
    New-UDChart -Title "Line Chart" -Type "Line" -Endpoint {
        $Data | Out-UDChartData -LabelProperty "Animal"  -Dataset @(
            New-UDLineChartDataset -Label "Animals" -DataProperty Count -BackgroundColor "#234FE2" -BorderColor "#35FF8A" -BorderWidth 3
        )
    }

    New-UDChart -Title "Line Chart without Underfill" -Type "Line" -Endpoint {
        $Data | Out-UDChartData -LabelProperty "Animal"  -Dataset @(
            New-UDLineChartDataset -Label "Animals" -DataProperty Count  -BorderColor "#35FF8A" -BorderWidth 3 -Fill $false
        )
    }
}

Start-UDDashboard -Port 8585 -Dashboard $Dashboard -Name 'ALOHA' -Wait -AutoReload
