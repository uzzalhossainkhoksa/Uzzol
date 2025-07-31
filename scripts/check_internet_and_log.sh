#!/data/data/com.termux/files/usr/bin/bash

echo "🌐 ইন্টারনেট চেক করা হচ্ছে..."
ping -c 2 google.com > /dev/null 2>&1

if [ $? -eq 0 ]; then
  echo "✅ ইন্টারনেট চলছে!"
  echo "$(date): Internet is working" >> ~/Uzzol/internet_log.txt
else
  echo "❌ ইন্টারনেট নেই!"
  echo "$(date): Internet is NOT working" >> ~/Uzzol/internet_log.txt
fi
