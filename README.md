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
![Screenshot 2025-01-06 130738](https://github.com/user-attachments/assets/026eb06f-268f-46b1-828e-e165d8878e09)

## Usage
### 1. Clone the repository:

```
git clone https://github.com/MenakaGodakanda//SystemHealthCheck.git
```

### 2. Run the scripts in the following order:

#### 1. HealthCheck.ps1 Output
This script collects system metrics and saves them in a JSON file. After running the script, the following outputs are generated:

- HealthCheck.ps1: Collect system metrics.
```
.\HealthCheck.ps1
```
Console Output:
![Screenshot 2025-01-06 130730](https://github.com/user-attachments/assets/b3fb9de1-e6a9-4460-9a27-45d829bb9622)

The log file will contain detailed metrics in JSON format:
![Screenshot 2025-01-06 132104](https://github.com/user-attachments/assets/ad5785d9-96f7-42db-b58f-5d8ae8d78bda)

- GenerateReport.ps1: Generate an HTML report.
```
.\GenerateReport.ps1
```
Console Output:
![Screenshot 2025-01-06 130711](https://github.com/user-attachments/assets/da745b9d-9b9e-40d3-aece-3db46e6456ab)




- MonitorServices.ps1: Monitor and manage critical services.
```
.\MonitorServices.ps1
```
![Screenshot 2025-01-06 130853](https://github.com/user-attachments/assets/63c7b11b-cd1a-4137-97b9-f6d6b81af842)

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
