# System Health Check

This PowerShell project automates system health checks, logs metrics, and generates reports. It monitors system performance, disk usage, and critical services.

## Overview
<img width="1243" alt="Screenshot 2025-01-30 at 9 16 14 pm" src="https://github.com/user-attachments/assets/78803689-292c-4699-9fa0-775ccd51531c" />

### Explanation
#### 1. Input Sources:
- **System Metrics**: CPU, memory, and disk usage are collected.
- **Critical Services**: Monitored services (e.g., `wuauserv`, `BITS`) and their statuses.

#### 2. Core Script Logic:
- `HealthCheck.ps1`:
  - Collects system metrics (CPU, memory, disk).
  - Logs the data in a JSON format file (`SystemHealthLog.json`).
- `GenerateReport.ps1`:
  - Reads the JSON log.
  - Uses `PSWriteHTML` to generate a user-friendly HTML report.
- `MonitorServices.ps1`:
  - Monitors critical services.
  - Restarts stopped services.
  - Logs errors in `ErrorLog.txt`.

#### 3. Output and Reports:
- **Error Logs**: Tracks errors in service restarts or script execution.
- **System Logs**: Contains system health metrics in JSON.
- **HTML Reports**: Summarizes system health for easy review.


## Features
- Collects CPU, memory, and disk usage.
- Logs data in JSON format.
- Generates HTML reports.
- Monitors and restarts critical services.

## Requirements
### PowerShell 7+
- For Windows: It’s pre-installed.

### PSWriteHTML module
- **Install the Module**: Run this command to install the `PSWriteHTML` module from the PowerShell Gallery:
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
git clone https://github.com/MenakaGodakanda/SystemHealthCheck.git
```

### 2. Run the scripts in the following order:

#### I. `HealthCheck.ps1`: Collect system metrics.
- This script collects system metrics and saves them in a JSON file. After running the script, the following outputs are generated:
```
.\HealthCheck.ps1
```
- `HealthCheck.ps1` Console Output:
![Screenshot 2025-01-06 130730](https://github.com/user-attachments/assets/b3fb9de1-e6a9-4460-9a27-45d829bb9622)

- The `SystemHealthLog.json` log file will contain detailed metrics in JSON format:
![Screenshot 2025-01-06 132104](https://github.com/user-attachments/assets/ad5785d9-96f7-42db-b58f-5d8ae8d78bda)


#### II. `GenerateReport.ps1`: Generate an HTML report.
- This script reads the JSON log and generates an HTML report summarizing the system health.
```
.\GenerateReport.ps1
```
- `GenerateReport.ps1` Console Output:
![Screenshot 2025-01-06 130711](https://github.com/user-attachments/assets/da745b9d-9b9e-40d3-aece-3db46e6456ab)

- Generated HTML Report (`HealthReport.html`) will include CPU and memory usage, and disk usage. Sample output in HTML:
![Screenshot 2025-01-06 130655](https://github.com/user-attachments/assets/63eecc97-192d-418c-8b57-c5cbb2ea35c0)


#### III. `MonitorServices.ps1`: Monitor and manage critical services.
- This script checks critical services and attempts to restart any stopped services.
```
.\MonitorServices.ps1
```
- `MonitorServices.ps1` Console Output:
![Screenshot 2025-01-06 130853](https://github.com/user-attachments/assets/63c7b11b-cd1a-4137-97b9-f6d6b81af842)

#### IV. View logs in the Logs directory and reports in the Reports directory.

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
