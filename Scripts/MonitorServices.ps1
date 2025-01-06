# MonitorServices.ps1
# Script to monitor and restart critical services

# Define critical services to monitor
$criticalServices = @("wuauserv", "BITS", "Spooler")

# Log directory and file
$logDir = "C:\Users\menak\OneDrive\Desktop\SystemHealthCheck\Logs"
if (-not (Test-Path -Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force
}
$errorLog = "$logDir\ErrorLog.txt"

# Function to log errors
function Log-Error {
    param (
        [string]$Message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $errorLog -Value "[$timestamp] $Message"
}

# Monitor services
foreach ($service in $criticalServices) {
    $serviceStatus = Get-Service -Name $service -ErrorAction SilentlyContinue
    if ($null -eq $serviceStatus) {
        Log-Error -Message "Service $service not found on this system."
        continue
    }

    if ($serviceStatus.Status -ne 'Running') {
        try {
            Write-Host "Service $service is not running. Attempting to restart..."
            Start-Service -Name $service -ErrorAction Stop
            Write-Host "Successfully restarted $service."
        } catch {
            Write-Error -Message "Failed to restart ${service}: $_"
            Add-Content -Path "$logDir/ErrorLog.txt" -Value "[$(Get-Date)] Failed to restart ${service}: $_"
        }
    } else {
        Write-Host "Service $service is running."
    }
}
