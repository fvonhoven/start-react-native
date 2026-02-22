# Expo React Native Development Environment Setup for Windows
# Run this script in PowerShell as Administrator

# Check if running as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host ""
    Write-Host "[ERROR] This script must be run as Administrator!" -ForegroundColor Red
    Write-Host "Right-click PowerShell and select 'Run as Administrator'" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Press any key to exit..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit 1
}

# Set execution policy to allow script execution
Set-ExecutionPolicy Bypass -Scope Process -Force

Write-Host ""
Write-Host "================================================================" -ForegroundColor Blue
Write-Host "                                                                " -ForegroundColor Blue
Write-Host "    Expo React Native Development Setup (Windows)              " -ForegroundColor Blue
Write-Host "                                                                " -ForegroundColor Blue
Write-Host "================================================================" -ForegroundColor Blue
Write-Host ""

Write-Host "This script will install:" -ForegroundColor Yellow
Write-Host "  * Chocolatey (package manager)"
Write-Host "  * Node.js (JavaScript runtime)"
Write-Host "  * Git (version control)"
Write-Host "  * Visual Studio Code (code editor)"
Write-Host "  * EAS CLI (Expo build tools)"
Write-Host ""
Write-Host "Press Enter to continue or Ctrl+C to cancel..."
Read-Host

function Print-Status {
    param($message)
    Write-Host "[INFO] $message" -ForegroundColor Blue
}

function Print-Success {
    param($message)
    Write-Host "[SUCCESS] $message" -ForegroundColor Green
}

function Print-Error {
    param($message)
    Write-Host "[ERROR] $message" -ForegroundColor Red
}

function Print-Warning {
    param($message)
    Write-Host "[WARNING] $message" -ForegroundColor Yellow
}

function Command-Exists {
    param($command)
    $null -ne (Get-Command $command -ErrorAction SilentlyContinue)
}

function Refresh-Path {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

Print-Status "Starting installation process..."
Write-Host ""

# 1. Install Chocolatey
if (Command-Exists choco) {
    Print-Success "Chocolatey is already installed"
} else {
    Print-Status "Installing Chocolatey..."
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    Refresh-Path
    Print-Success "Chocolatey installed successfully"
}

# 2. Install Node.js
if (Command-Exists node) {
    $nodeVersion = node -v
    Print-Success "Node.js is already installed ($nodeVersion)"
} else {
    Print-Status "Installing Node.js..."
    choco install nodejs -y
    Refresh-Path
    Print-Success "Node.js installed successfully"
}

# 3. Install Git
if (Command-Exists git) {
    $gitVersion = git --version
    Print-Success "Git is already installed ($gitVersion)"
} else {
    Print-Status "Installing Git..."
    choco install git -y
    Refresh-Path
    Print-Success "Git installed successfully"
}

# 4. Install Visual Studio Code
if (Command-Exists code) {
    Print-Success "VS Code is already installed"
} else {
    Print-Status "Installing Visual Studio Code..."
    choco install vscode -y
    Refresh-Path
    Print-Success "VS Code installed successfully"
}

# 5. Install EAS CLI globally (modern Expo build tooling)
Print-Status "Installing EAS CLI..."
npm install -g eas-cli
Print-Success "EAS CLI installed successfully"

# 6. Install useful VS Code extensions
Print-Status "Installing recommended VS Code extensions..."
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension msjsdiag.vscode-react-native
Print-Success "VS Code extensions installed"

# 7. Configure Windows for long paths (needed for Node.js)
Print-Status "Configuring Windows for long file paths..."
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force | Out-Null
Print-Success "Long paths enabled"

# 8. Create a test project (optional)
Write-Host ""
Write-Host "Would you like to create a test Expo project? (y/n): " -ForegroundColor Yellow -NoNewline
$createProject = Read-Host

if ($createProject -eq "y" -or $createProject -eq "Y") {
    Print-Status "Creating test project..."
    $projectPath = "$env:USERPROFILE\ExpoProjects"
    New-Item -ItemType Directory -Force -Path $projectPath | Out-Null
    Set-Location $projectPath
    npx create-expo-app@latest MyFirstApp
    Print-Success "Test project created at $projectPath\MyFirstApp"
}

# Print final instructions
Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "                                                                " -ForegroundColor Green
Write-Host "              Installation Complete!                            " -ForegroundColor Green
Write-Host "                                                                " -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""

Write-Host "Installed versions:" -ForegroundColor Blue
Write-Host "  * Node.js: $(node -v)"
Write-Host "  * npm: $(npm -v)"
Write-Host "  * Git: $(git --version)"
Write-Host "  * EAS CLI: $(eas --version)"

Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. RESTART your computer (or at least PowerShell)"
Write-Host "  2. Create a new Expo project: npx create-expo-app@latest MyApp"
Write-Host "  3. Navigate to your project: cd MyApp"
Write-Host "  4. Start the development server: npx expo start"
Write-Host "  5. Scan the QR code with the Expo Go app on your phone"

Write-Host ""
Write-Host "To develop for Android (optional):" -ForegroundColor Yellow
Write-Host "  * Install Android Studio from https://developer.android.com/studio"
Write-Host "  * Or run: choco install androidstudio -y"

Write-Host ""
Write-Host "Happy coding!" -ForegroundColor Green
Write-Host ""

Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")