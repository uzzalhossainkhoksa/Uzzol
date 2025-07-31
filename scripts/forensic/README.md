# Android Forensic Scan Tool 🛡️

A simple and effective script to detect suspicious apps, dangerous permissions, and gather forensic data from your Android device via **ADB**.

---

## Features

- Detects connected Android devices via ADB  
- Collects installed apps list  
- Checks for suspicious keywords in package names  
- Collects app permissions (appops)  
- Gathers battery stats  
- Captures running services and top processes  
- Dumps logcat logs  
- Generates timestamped report folders with all data  
- Provides a summary report highlighting potential threats  

---

## Requirements

- Ubuntu/Linux/macOS system with **ADB** installed  
- Android device with **USB Debugging enabled**  
- USB cable to connect device to computer  

---

## Installation

1. Update package list and install adb:

   ```bash
   sudo apt update
   sudo apt install adb

chmod +x forensic_scan.sh
./forensic_scan.sh

spy, keylog, remote, sms, call, backdoor, monitor, steal, hack, inject, shell, logger, recorder, record

READ_SMS, SEND_SMS, CALL_PHONE, CAMERA, RECORD_AUDIO, SYSTEM_ALERT_WINDOW, WRITE_SETTINGS, WRITE_SECURE_SETTINGS, PACKAGE_USAGE_STATS
---

If you want, I can also prepare the full GitHub repo with this README plus the `forensic_scan.sh` script and folder structure ready to clone. Just let me know!
