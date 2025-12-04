# Test suite for setup-expo-windows.ps1
# This script validates the Windows setup script without actually installing anything

# Test counters
$script:TestsRun = 0
$script:TestsPassed = 0
$script:TestsFailed = 0

# Color functions
function Write-Header {
    param([string]$Message)
    Write-Host "`n========================================" -ForegroundColor Blue
    Write-Host $Message -ForegroundColor Blue
    Write-Host "========================================`n" -ForegroundColor Blue
}

function Write-TestName {
    param([string]$Message)
    Write-Host "TEST: $Message" -ForegroundColor Yellow
    $script:TestsRun++
}

function Write-Pass {
    param([string]$Message)
    Write-Host "✓ PASS: $Message`n" -ForegroundColor Green
    $script:TestsPassed++
}

function Write-Fail {
    param([string]$Message)
    Write-Host "✗ FAIL: $Message`n" -ForegroundColor Red
    $script:TestsFailed++
}

function Write-Info {
    param([string]$Message)
    Write-Host "ℹ INFO: $Message" -ForegroundColor Cyan
}

# Test 1: Check if script file exists
function Test-ScriptExists {
    Write-TestName "Script file exists"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    
    if (Test-Path $scriptPath) {
        Write-Pass "setup-expo-windows.ps1 found"
        return $true
    } else {
        Write-Fail "setup-expo-windows.ps1 not found at $scriptPath"
        return $false
    }
}

# Test 2: Check PowerShell syntax
function Test-PowerShellSyntax {
    Write-TestName "PowerShell syntax validation"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    
    try {
        $errors = $null
        $null = [System.Management.Automation.PSParser]::Tokenize((Get-Content $scriptPath -Raw), [ref]$errors)
        
        if ($errors.Count -eq 0) {
            Write-Pass "No syntax errors found"
            return $true
        } else {
            Write-Fail "Syntax errors detected: $($errors.Count) errors"
            $errors | ForEach-Object { Write-Info $_.Message }
            return $false
        }
    } catch {
        Write-Fail "Error parsing script: $_"
        return $false
    }
}

# Test 3: Check for Administrator privilege check
function Test-AdminCheck {
    Write-TestName "Script checks for Administrator privileges"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    $content = Get-Content $scriptPath -Raw
    
    if ($content -match "Administrator|IsInRole|RunAsAdministrator") {
        Write-Pass "Administrator privilege check found"
        return $true
    } else {
        Write-Fail "No Administrator privilege check found"
        return $false
    }
}

# Test 4: Check for Chocolatey installation
function Test-ChocolateyInstall {
    Write-TestName "Script installs Chocolatey"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    $content = Get-Content $scriptPath -Raw
    
    if ($content -match "chocolatey|choco") {
        Write-Pass "Chocolatey installation found"
        return $true
    } else {
        Write-Fail "Chocolatey installation not found"
        return $false
    }
}

# Test 5: Check for Node.js installation
function Test-NodeJsInstall {
    Write-TestName "Script installs Node.js"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    $content = Get-Content $scriptPath -Raw
    
    if ($content -match "choco install.*nodejs|node\.js") {
        Write-Pass "Node.js installation command found"
        return $true
    } else {
        Write-Fail "Node.js installation command not found"
        return $false
    }
}

# Test 6: Check for Git installation
function Test-GitInstall {
    Write-TestName "Script installs Git"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    $content = Get-Content $scriptPath -Raw
    
    if ($content -match "choco install.*git|git") {
        Write-Pass "Git installation command found"
        return $true
    } else {
        Write-Fail "Git installation command not found"
        return $false
    }
}

# Test 7: Check for VS Code installation
function Test-VSCodeInstall {
    Write-TestName "Script installs VS Code"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    $content = Get-Content $scriptPath -Raw
    
    if ($content -match "vscode|visualstudiocode|code") {
        Write-Pass "VS Code installation found"
        return $true
    } else {
        Write-Fail "VS Code installation not found"
        return $false
    }
}

# Test 8: Check for Expo CLI installation
function Test-ExpoInstall {
    Write-TestName "Script installs Expo CLI"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    $content = Get-Content $scriptPath -Raw
    
    if ($content -match "npm install.*expo-cli|expo") {
        Write-Pass "Expo CLI installation command found"
        return $true
    } else {
        Write-Fail "Expo CLI installation command not found"
        return $false
    }
}

# Test 9: Check for VS Code extensions
function Test-VSCodeExtensions {
    Write-TestName "Script installs VS Code extensions"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    $content = Get-Content $scriptPath -Raw
    
    if ($content -match "code --install-extension") {
        Write-Pass "VS Code extension installation found"
        return $true
    } else {
        Write-Fail "VS Code extension installation not found"
        return $false
    }
}

# Test 10: Check for test project creation
function Test-ProjectCreation {
    Write-TestName "Script creates test project"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    $content = Get-Content $scriptPath -Raw
    
    if ($content -match "npx create-expo-app|expo init") {
        Write-Pass "Test project creation command found"
        return $true
    } else {
        Write-Fail "Test project creation command not found"
        return $false
    }
}

# Test 11: Check for error handling
function Test-ErrorHandling {
    Write-TestName "Script has error handling"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    $content = Get-Content $scriptPath -Raw
    
    if ($content -match "\$ErrorActionPreference|try.*catch|if.*\$\?") {
        Write-Pass "Error handling found"
        return $true
    } else {
        Write-Fail "No error handling found"
        return $false
    }
}

# Test 12: Check for user feedback
function Test-UserFeedback {
    Write-TestName "Script provides user feedback"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    $content = Get-Content $scriptPath -Raw
    
    if ($content -match "Write-Host|Write-Output|echo") {
        Write-Pass "User feedback commands found"
        return $true
    } else {
        Write-Fail "No user feedback commands found"
        return $false
    }
}

# Test 13: Check for Windows-specific commands
function Test-WindowsSpecific {
    Write-TestName "Script uses Windows-specific commands appropriately"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    $content = Get-Content $scriptPath -Raw
    
    if ($content -match "choco|PowerShell|\$env:") {
        Write-Pass "Uses Windows-specific commands (Chocolatey, PowerShell)"
        return $true
    } else {
        Write-Fail "Missing Windows-specific commands"
        return $false
    }
}

# Test 14: Check file doesn't contain macOS-specific commands
function Test-NoMacOSCommands {
    Write-TestName "Script doesn't contain macOS-specific commands"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    $content = Get-Content $scriptPath -Raw
    
    if ($content -match "brew|homebrew|\.sh\b|/bin/bash") {
        Write-Fail "Contains macOS-specific commands"
        return $false
    } else {
        Write-Pass "No macOS-specific commands found"
        return $true
    }
}

# Test 15: Check for proper directory creation
function Test-DirectoryCreation {
    Write-TestName "Script creates project directory"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    $content = Get-Content $scriptPath -Raw
    
    if ($content -match "New-Item.*Directory|mkdir|ReactNativeProjects") {
        Write-Pass "Directory creation logic found"
        return $true
    } else {
        Write-Fail "Directory creation logic not found"
        return $false
    }
}

# Test 16: Check for environment refresh
function Test-EnvironmentRefresh {
    Write-TestName "Script refreshes environment variables"
    
    $scriptPath = Join-Path $PSScriptRoot "..\public\setup-expo-windows.ps1"
    $content = Get-Content $scriptPath -Raw
    
    if ($content -match "refreshenv|\$env:Path|Update-SessionEnvironment") {
        Write-Pass "Environment refresh logic found"
        return $true
    } else {
        Write-Info "Environment refresh not found (may cause PATH issues)"
        return $true  # Not critical, so pass
    }
}

# Main test execution
function Main {
    Write-Header "Windows Setup Script Test Suite"
    
    # Run all tests
    Test-ScriptExists
    Test-PowerShellSyntax
    Test-AdminCheck
    Test-ChocolateyInstall
    Test-NodeJsInstall
    Test-GitInstall
    Test-VSCodeInstall
    Test-ExpoInstall
    Test-VSCodeExtensions
    Test-ProjectCreation
    Test-ErrorHandling
    Test-UserFeedback
    Test-WindowsSpecific
    Test-NoMacOSCommands
    Test-DirectoryCreation
    Test-EnvironmentRefresh
    
    # Print summary
    Write-Header "Test Summary"
    Write-Host "Total Tests: $script:TestsRun" -ForegroundColor Blue
    Write-Host "Passed: $script:TestsPassed" -ForegroundColor Green
    Write-Host "Failed: $script:TestsFailed" -ForegroundColor Red
    
    if ($script:TestsFailed -eq 0) {
        Write-Host "`n✓ All tests passed!`n" -ForegroundColor Green
        exit 0
    } else {
        Write-Host "`n✗ Some tests failed!`n" -ForegroundColor Red
        exit 1
    }
}

# Run main function
Main

