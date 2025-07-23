#!/bin/bash

# Configure Git user (run once, or comment out after setting)
git config --global user.email "uzzolhassan38@gmail.com"
git config --global user.name "nirobtech"

echo "🟢 Adding all changes..."
git add .

echo "🟡 Committing changes..."
git commit -m "📝 Update Uzzol project - $(date '+%Y-%m-%d %H:%M:%S')"

echo "🔵 Pushing to origin main branch..."
git push origin main

echo "✅ All changes pushed successfully!"
