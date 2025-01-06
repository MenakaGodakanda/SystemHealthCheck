# HealthCheck.ps1
# Script to log system health metrics in JSON format.

# Import necessary modules
try {
    Import-Module PSWriteHTML -ErrorAction Stop
} catch {
    Write-Error "PSWriteHTML module not found. Please install it using Install-Module -Name PSWriteHTML."
    exit
}

# Define directories and ensure they exist
$logDir = "C:\Users\menak\OneDrive\Desktop\SystemHealthCheck\Logs"
if (-not (Test-Path -Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force
}

# Define log file paths
$logFile = "$logDir\SystemHealthLog.json"
$errorLog = "$logDir\ErrorLog.txt"

# Initialize error logging
function Log-Error {
    param (
        [string]$Message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $errorLog -Value "[$timestamp] $Message"
}

# Collect CPU and memory usage
try {
    $cpuUsage = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples[0].CookedValue
    $memoryStats = Get-WmiObject Win32_OperatingSystem
    $totalMemory = $memoryStats.TotalVisibleMemorySize / 1MB
    $freeMemory = $memoryStats.FreePhysicalMemory / 1MB
    $memoryUsage = [math]::Round((($totalMemory - $freeMemory) / $totalMemory) * 100, 2)
} catch {
    Log-Error "Error fetching system usage: $_"
    $cpuUsage = $null
    $memoryUsage = $null
}

# Collect disk usage
try {
    $diskUsage = Get-PSDrive -PSProvider FileSystem | ForEach-Object {
        @{
            Name = $_.Name
            UsedSpace = $_.Used * 1MB
            FreeSpace = $_.Free * 1MB
            TotalSpace = ($_.Used + $_.Free) * 1MB
        }
    }
} catch {
    Log-Error "Error fetching disk usage: $_"
    $diskUsage = @()
}

# Prepare health data
$healthData = @{
    Timestamp   = Get-Date -Format "yyyy-MM-ddTHH:mm:ss"
    SystemUsage = @{
        CPUUsage    = [math]::Round($cpuUsage, 2)
        MemoryUsage = $memoryUsage
    }
    DiskUsage   = $diskUsage
}

# Save health data to log file
try {
    $healthData | ConvertTo-Json -Depth 3 | Set-Content -Path $logFile
    Write-Host "System health logged to $logFile"
} catch {
    Log-Error "Error writing to log file: $_"
    Write-Host "Failed to write system health log. Check error log for details."
}
