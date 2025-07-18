#!/data/data/com.termux/files/usr/bin/bash

echo "📡 Checking internet connection..."
ping -c 2 google.com > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "❌ No internet connection. Please connect to the internet and try again."
    exit 1
fi

echo "✅ Internet connection: OK"

echo "🔧 Fixing DNS with Google's nameserver (8.8.8.8)..."
echo "nameserver 8.8.8.8" > $PREFIX/etc/resolv.conf

echo "🌐 Pinging GitHub to test connection..."
ping -c 2 github.com > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "❌ Cannot reach GitHub. Check your DNS, VPN, or network settings."
    exit 1
fi

echo "✅ GitHub is reachable."

echo "🚀 Attempting to push to GitHub..."
git add .
git commit -m "🔄 Auto Commit from Termux"
git push origin main

if [ $? -eq 0 ]; then
    echo "🎉 Push successful!"
else
    echo "❌ Push failed. Check your git remote or credentials."
fi
