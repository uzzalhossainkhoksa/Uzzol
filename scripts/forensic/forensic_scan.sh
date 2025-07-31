#!/bin/bash

echo "======================"
echo "  Android Forensic Scan"
echo "======================"
echo ""

# 1. Check for connected adb devices
echo "Checking for connected Android devices via adb..."
DEVICE_COUNT=$(adb devices | grep -w "device" | wc -l)

if [ "$DEVICE_COUNT" -eq 0 ]; then
  echo "❌ No connected adb devices found!"
  echo "Please connect your Android device and enable USB debugging."
  exit 1
else
  echo "✅ $DEVICE_COUNT device(s) detected."
fi

# Create report folder with timestamp
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_DIR="reports/$DATE"
mkdir -p "$REPORT_DIR"

echo ""
echo "Collecting installed apps list..."
adb shell pm list packages -f > "$REPORT_DIR/installed_apps.txt"

# Suspicious keywords to search for
SUSPICIOUS_KEYWORDS=(
  spy
  keylog
  remote
  sms
  call
  backdoor
  monitor
  steal
  hack
  inject
  shell
  logger
  recorder
  record
)

echo ""
echo "Searching for suspicious apps..."
SUSPICIOUS_FOUND=0
for keyword in "${SUSPICIOUS_KEYWORDS[@]}"; do
  MATCHES=$(grep -i "$keyword" "$REPORT_DIR/installed_apps.txt")
  if [ ! -z "$MATCHES" ]; then
    echo "⚠️ Suspicious keyword found: '$keyword'"
    echo "$MATCHES"
    echo ""
    SUSPICIOUS_FOUND=1
  fi
done

if [ $SUSPICIOUS_FOUND -eq 0 ]; then
  echo "✅ No suspicious app keywords found."
fi

echo ""
echo "Collecting app permissions (appops)..."
adb shell appops > "$REPORT_DIR/app_permissions.txt"

# Dangerous permissions to check
DANGEROUS_PERMISSIONS=(
  READ_SMS
  SEND_SMS
  CALL_PHONE
  CAMERA
  RECORD_AUDIO
  SYSTEM_ALERT_WINDOW
  WRITE_SETTINGS
  WRITE_SECURE_SETTINGS
  PACKAGE_USAGE_STATS
)

echo ""
echo "Checking for dangerous permissions usage..."
PERMISSION_FOUND=0
for perm in "${DANGEROUS_PERMISSIONS[@]}"; do
  PERM_MATCH=$(grep "$perm" "$REPORT_DIR/app_permissions.txt")
  if [ ! -z "$PERM_MATCH" ]; then
    echo "⚠️ Dangerous permission detected: $perm"
    echo "$PERM_MATCH"
    echo ""
    PERMISSION_FOUND=1
  fi
done

if [ $PERMISSION_FOUND -eq 0 ]; then
  echo "✅ No dangerous permissions detected."
fi

echo ""
echo "Collecting battery usage stats..."
adb shell dumpsys batterystats > "$REPORT_DIR/battery_stats.txt"

echo ""
echo "Collecting running services info..."
adb shell dumpsys activity services > "$REPORT_DIR/services.txt"

echo ""
echo "Collecting top processes..."
adb shell top -n 1 > "$REPORT_DIR/process_list.txt"

echo ""
echo "Collecting logcat logs..."
adb logcat -d > "$REPORT_DIR/logcat.txt"

# Create summary report
SUMMARY_FILE="$REPORT_DIR/summary_report.txt"
echo "====================== Cyber Attack Detection Summary ======================" > "$SUMMARY_FILE"

if [ $SUSPICIOUS_FOUND -eq 1 ]; then
  echo "⚠️ Potential Spyware or Malicious Apps Detected:" >> "$SUMMARY_FILE"
  for keyword in "${SUSPICIOUS_KEYWORDS[@]}"; do
    grep -i "$keyword" "$REPORT_DIR/installed_apps.txt" >> "$SUMMARY_FILE"
  done
else
  echo "✅ No suspicious apps detected." >> "$SUMMARY_FILE"
fi

if [ $PERMISSION_FOUND -eq 1 ]; then
  echo "" >> "$SUMMARY_FILE"
  echo "⚠️ Dangerous Permissions Found:" >> "$SUMMARY_FILE"
  for perm in "${DANGEROUS_PERMISSIONS[@]}"; do
    grep "$perm" "$REPORT_DIR/app_permissions.txt" >> "$SUMMARY_FILE"
  done
else
  echo "✅ No dangerous permissions usage detected." >> "$SUMMARY_FILE"
fi

echo "" >> "$SUMMARY_FILE"
echo "Battery stats saved to battery_stats.txt" >> "$SUMMARY_FILE"
echo "Running services info saved to services.txt" >> "$SUMMARY_FILE"
echo "Top processes saved to process_list.txt" >> "$SUMMARY_FILE"
echo "Logcat logs saved to logcat.txt" >> "$SUMMARY_FILE"
echo "=========================================================================== " >> "$SUMMARY_FILE"

echo ""
echo "✅ Scan complete!"
echo "Summary report saved at: $SUMMARY_FILE"
