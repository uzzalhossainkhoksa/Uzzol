#!/bin/bash

# ==============================
# uzzol Project Auto Setup Script
# ==============================
# By NirobTech (Customized for your setup)
# Creates folder structure, README.md, resource placeholders
# Adds & commits all changes, pushes to GitHub main branch
# ==============================

BASE_DIR="$(pwd)"
echo "Starting uzzol project auto-setup at: $BASE_DIR"

# Declare associative arrays for folder descriptions & resource placeholders
declare -A readmes=(
  ["Life/Archive"]="Archive\nThis folder contains archived documents and old resources."
  ["Life/Creativity"]="Creativity\nContains design, ideas, and writing materials for creative projects."
  ["Life/Creativity/Design"]="Design\nDesign resources including sketches, drafts, and graphic files."
  ["Life/Creativity/Ideas"]="Ideas\nBrainstorming notes and idea collections."
  ["Life/Creativity/Writing"]="Writing\nArticles, blog drafts, and writing samples."
  ["Life/Personal"]="Personal\nPersonal documents including diary, finance, goals, health, and learning."
  ["Life/Personal/Diary"]="Diary\nPersonal diary entries and daily logs."
  ["Life/Personal/Documents"]="Documents\nImportant personal documents and files."
  ["Life/Personal/Finance"]="Finance\nRecords of financial transactions, budgets, and accounts."
  ["Life/Personal/Goals"]="Goals\nPersonal and professional goals and plans."
  ["Life/Personal/Health"]="Health\nHealth records and fitness tracking data."
  ["Life/Personal/Learning"]="Learning\nNotes and resources related to personal learning and skills development."
  ["Life/Social"]="Social\nContacts, events, and photos related to social life."
  ["Life/Social/Contacts"]="Contacts\nAddress book and contact information."
  ["Life/Social/Events"]="Events\nEvent invitations, plans, and records."
  ["Life/Social/Photos"]="Photos\nPersonal and social photo archives."
  ["Life/Work"]="Work\nWork-related documents, projects, meetings, and client info."
  ["Life/Work/Clients"]="Clients\nInformation and correspondence related to clients."
  ["Life/Work/Learning"]="Learning\nWork-related training and professional development resources."
  ["Life/Work/Meetings"]="Meetings\nMeeting notes, agendas, and schedules."
  ["Life/Work/Projects"]="Projects\nDetails and documents related to projects."
)

# Additional resource folders and files to add
declare -A resources=(
  ["Tools"]="CLI and GUI tools for development and automation."
  ["Tools/Scripts"]="Shell scripts, automation scripts, and utilities."
  ["Tools/GitHubCLI"]="GitHub CLI configurations and helpers."
  ["Resources"]="Documentation, API keys, certificates, and notes."
  ["Resources/APIKeys"]="Secure API keys for various services."
  ["Resources/Docs"]="Important documents and manuals."
  ["Resources/Certificates"]="SSL and security certificates."
  ["Web"]="Web project files including index.php and assets."
  ["Web/Assets"]="Images, CSS, JS, and media files."
  ["Web/Components"]="Reusable UI components and templates."
  ["Automation"]="Scripts and configs for Web3 automation and task running."
  ["Automation/Web3Tasks"]="Web3 daily task automation scripts."
  ["Automation/Marketing"]="Email, SMS, and social media marketing automation."
)

# Function to create folder and README.md
create_folder_with_readme() {
  local folder_path="$1"
  local content="$2"
  mkdir -p "$BASE_DIR/$folder_path"
  local readme_file="$BASE_DIR/$folder_path/README.md"
  echo -e "# ${content%%\\n*}" > "$readme_file"
  echo -e "${content#*\\n}" >> "$readme_file"
  echo "Created: $readme_file"
}

# 1. Create Life folder structure with README.md
for folder in "${!readmes[@]}"; do
  create_folder_with_readme "$folder" "${readmes[$folder]}"
done

# 2. Create additional resources folders with README.md placeholders
for folder in "${!resources[@]}"; do
  create_folder_with_readme "$folder" "${resources[$folder]}"
done

# 3. Create placeholder files for key scripts and configs

# Fix GitHub push script placeholder (if not exists)
fix_script="$BASE_DIR/fix-github-push.sh"
if [ ! -f "$fix_script" ]; then
  cat > "$fix_script" << 'EOF'
#!/bin/bash
# Fix git push errors by pulling first, then pushing
git pull origin main --allow-unrelated-histories
git push origin main
EOF
  chmod +x "$fix_script"
  echo "Created placeholder script: $fix_script"
fi

# Sample index.php placeholder
index_php="$BASE_DIR/index.php"
if [ ! -f "$index_php" ]; then
  cat > "$index_php" << 'EOF'
<?php
echo "<!DOCTYPE html><html><head><title>NirobTech Home</title></head><body><h1>Welcome to NirobTech Web3 OS</h1></body></html>";
?>
EOF
  echo "Created placeholder file: $index_php"
fi

# 4. Git add, commit and push changes
echo "Adding all new files to git..."
git add .

echo "Committing changes..."
git commit -m "Setup complete project structure with resource folders, scripts, and README files"

echo "Pushing changes to origin/main..."
git push origin main

echo "Setup and push complete! 🎉"
