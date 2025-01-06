# SystemHealthCheck

## Overview
This PowerShell project automates system health checks, logs metrics, and generates reports. It monitors system performance, disk usage, and critical services.

## Features
- Collects CPU, memory, and disk usage.
- Logs data in JSON format.
- Generates HTML reports.
- Monitors and restarts critical services.

## Requirements
### PowerShell 7+
- For Windows: It’s pre-installed.

### PSWriteHTML module
- **Install the Module**: Run this command to install the PSWriteHTML module from the PowerShell Gallery:
```
Install-Module -Name PSWriteHTML -Force
```

- **Verify Installation**: Check if the module is installed by running:
```
Get-Module -ListAvailable | Where-Object { $_.Name -eq "PSWriteHTML" }
```

## Usage
1. Clone the repository:

```
git clone https://github.com/MenakaGodakanda//SystemHealthCheck.git
```

2. Run the scripts in the following order:

- HealthCheck.ps1: Collect system metrics.
```
.\HealthCheck.ps1
```

- GenerateReport.ps1: Generate an HTML report.
```
.\GenerateReport.ps1
```

- MonitorServices.ps1: Monitor and manage critical services.
```
.\MonitorServices.ps1
```

- View logs in the Logs directory and reports in the Reports directory.

## File Structure:
```
SystemHealthCheck/
├── Scripts/
│   ├── HealthCheck.ps1
│   ├── GenerateReport.ps1
│   └── MonitorServices.ps1
├── Logs/
│   ├── SystemHealthLog.json
│   └── ErrorLog.txt
├── Reports/
│   └── HealthReport.html
├── README.md
└── LICENSE
```

## License
This project is licensed under the MIT License.
