# Start React Native - Windows Setup Script
# This script automates the installation of everything needed for React Native/Expo development
# Run this script in PowerShell as Administrator

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  Start React Native - Windows Setup" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "This script will install:" -ForegroundColor Yellow
Write-Host "  ✓ Chocolatey (package manager)"
Write-Host "  ✓ Node.js & npm"
Write-Host "  ✓ Git"
Write-Host "  ✓ Visual Studio Code"
Write-Host "  ✓ Expo CLI"
Write-Host "  ✓ VS Code Extensions"
Write-Host "  ✓ Test Project"
Write-Host ""
$continue = Read-Host "Press Enter to continue or Ctrl+C to cancel"
Write-Host ""

# Function to print status messages
function Print-Status {
    param($Message)
    Write-Host ""
    Write-Host "===> $Message" -ForegroundColor Green
    Write-Host ""
}

# Function to check if command exists
function Test-CommandExists {
    param($Command)
    $null -ne (Get-Command $Command -ErrorAction SilentlyContinue)
}

# Check if running as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "ERROR: This script must be run as Administrator!" -ForegroundColor Red
    Write-Host "Right-click PowerShell and select 'Run as Administrator'" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

# Install Chocolatey if not already installed
Print-Status "Checking for Chocolatey..."
if (-not (Test-CommandExists choco)) {
    Print-Status "Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    
    # Refresh environment variables
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
} else {
    Print-Status "Chocolatey already installed ✓"
}

# Install Node.js if not already installed
Print-Status "Checking for Node.js..."
if (-not (Test-CommandExists node)) {
    Print-Status "Installing Node.js..."
    choco install nodejs-lts -y
    
    # Refresh environment variables
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
} else {
    Print-Status "Node.js already installed ✓"
    Write-Host "Current version: $(node --version)"
}

# Install Git if not already installed
Print-Status "Checking for Git..."
if (-not (Test-CommandExists git)) {
    Print-Status "Installing Git..."
    choco install git -y
    
    # Refresh environment variables
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
} else {
    Print-Status "Git already installed ✓"
    Write-Host "Current version: $(git --version)"
}

# Install Visual Studio Code if not already installed
Print-Status "Checking for Visual Studio Code..."
if (-not (Test-CommandExists code)) {
    Print-Status "Installing Visual Studio Code..."
    choco install vscode -y
    
    # Refresh environment variables
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
} else {
    Print-Status "Visual Studio Code already installed ✓"
}

# Install Expo CLI globally
Print-Status "Installing Expo CLI..."
npm install -g expo-cli

# Wait a moment for npm to complete
Start-Sleep -Seconds 2

# Install useful VS Code extensions
Print-Status "Installing VS Code extensions..."
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension msjsdiag.vscode-react-native
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension dsznajder.es7-react-js-snippets

# Create a test project
Print-Status "Creating test project..."
$projectsPath = "$env:USERPROFILE\ReactNativeProjects"
New-Item -ItemType Directory -Force -Path $projectsPath | Out-Null
Set-Location $projectsPath

if (-not (Test-Path "MyFirstApp")) {
    npx create-expo-app MyFirstApp --template blank
    Print-Status "Test project created at $projectsPath\MyFirstApp"
} else {
    Print-Status "Test project already exists ✓"
}

# Print success message
Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  ✓ Setup Complete!" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. Restart your computer to apply all changes"
Write-Host "  2. Install Expo Go on your phone:"
Write-Host "     - iOS: https://apps.apple.com/app/expo-go/id982107779"
Write-Host "     - Android: https://play.google.com/store/apps/details?id=host.exp.exponent"
Write-Host "  3. Open PowerShell and navigate to your project:"
Write-Host "     cd $projectsPath\MyFirstApp"
Write-Host "  4. Start the development server:"
Write-Host "     npx expo start"
Write-Host "  5. Scan the QR code with Expo Go to see your app!"
Write-Host ""
Write-Host "Resources:" -ForegroundColor Yellow
Write-Host "  - Expo Docs: https://docs.expo.dev/"
Write-Host "  - Tutorial: https://docs.expo.dev/tutorial/introduction/"
Write-Host "  - Community: https://chat.expo.dev/"
Write-Host ""
Write-Host "Happy coding! 🚀" -ForegroundColor Green
Write-Host ""
Read-Host "Press Enter to exit"

