# GenerateReport.ps1
# Script to generate an HTML report from system health logs.

# Import the PSWriteHTML module
try {
    Import-Module PSWriteHTML -ErrorAction Stop
} catch {
    Write-Error "PSWriteHTML module not found. Please install it using Install-Module -Name PSWriteHTML."
    exit
}

# Define paths
$logFile = "C:\Users\menak\OneDrive\Desktop\SystemHealthCheck\Logs\SystemHealthLog.json"
$reportDir = "C:\Users\menak\OneDrive\Desktop\SystemHealthCheck\Reports"
$reportFile = "$reportDir\HealthReport.html"

# Ensure report directory exists
if (-not (Test-Path -Path $reportDir)) {
    New-Item -ItemType Directory -Path $reportDir -Force
}

# Check if log file exists
if (-not (Test-Path -Path $logFile)) {
    Write-Error "Log file not found at $logFile. Run HealthCheck.ps1 first."
    exit
}

# Read log data
$logData = Get-Content -Path $logFile | ConvertFrom-Json

# Generate HTML report
try {
    New-HTML -TitleText "System Health Report" -FilePath $reportFile -Show {
        New-HTMLSection -Name "System Usage" {
            New-HTMLTable -DataTable @($logData.SystemUsage)
        }
        New-HTMLSection -Name "Disk Usage" {
            New-HTMLTable -DataTable $logData.DiskUsage
        }
    }
    Write-Host "HTML report generated at $reportFile"
} catch {
    Write-Error "Failed to generate HTML report: $_"
}
