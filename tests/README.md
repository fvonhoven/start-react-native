# Test Suite Documentation

Comprehensive test suite for the Start React Native landing page and setup scripts.

## 📋 Overview

This test suite validates:
1. **macOS Setup Script** - Syntax, commands, and logic
2. **Windows Setup Script** - PowerShell syntax, commands, and logic
3. **Integration Tests** - Website functionality and script downloads

## 🚀 Quick Start

### Run All Tests

```bash
cd tests
chmod +x run-all-tests.sh
./run-all-tests.sh
```

### Run Individual Test Suites

```bash
# macOS script tests
chmod +x test-macos-script.sh
./test-macos-script.sh

# Windows script tests (requires PowerShell)
pwsh test-windows-script.ps1
# or on Windows:
powershell -File test-windows-script.ps1

# Integration tests (requires dev server running)
chmod +x integration-tests.sh
./integration-tests.sh
```

## 📦 Prerequisites

### For macOS Script Tests
- Bash shell (pre-installed on macOS/Linux)
- No additional dependencies

### For Windows Script Tests
- PowerShell Core (pwsh) or Windows PowerShell
- Install on macOS/Linux:
  ```bash
  # macOS
  brew install --cask powershell
  
  # Ubuntu/Debian
  sudo apt-get install -y powershell
  ```

### For Integration Tests
- Development server running (`npm run dev`)
- curl (pre-installed on most systems)

## 🧪 Test Suites

### 1. macOS Script Tests (`test-macos-script.sh`)

**What it tests:**
- ✅ Script file exists
- ✅ Correct shebang (`#!/bin/bash`)
- ✅ Script can be made executable
- ✅ Bash syntax validation
- ✅ Required commands present (brew, node, git, etc.)
- ✅ Error handling (`set -e`)
- ✅ Homebrew installation
- ✅ Node.js installation
- ✅ Expo CLI installation
- ✅ VS Code extensions installation
- ✅ Test project creation
- ✅ User feedback (echo statements)
- ✅ macOS-specific commands
- ✅ No Windows-specific commands
- ✅ Directory creation logic

**Total Tests:** 15

**Example Output:**
```
========================================
macOS Setup Script Test Suite
========================================

TEST: Script file exists
✓ PASS: setup-expo-macos.sh found

TEST: Bash syntax validation
✓ PASS: No syntax errors found

...

========================================
Test Summary
========================================
Total Tests: 15
Passed: 15
Failed: 0

✓ All tests passed!
```

### 2. Windows Script Tests (`test-windows-script.ps1`)

**What it tests:**
- ✅ Script file exists
- ✅ PowerShell syntax validation
- ✅ Administrator privilege check
- ✅ Chocolatey installation
- ✅ Node.js installation
- ✅ Git installation
- ✅ VS Code installation
- ✅ Expo CLI installation
- ✅ VS Code extensions installation
- ✅ Test project creation
- ✅ Error handling
- ✅ User feedback (Write-Host)
- ✅ Windows-specific commands
- ✅ No macOS-specific commands
- ✅ Directory creation logic
- ✅ Environment variable refresh

**Total Tests:** 16

**Example Output:**
```
========================================
Windows Setup Script Test Suite
========================================

TEST: Script file exists
✓ PASS: setup-expo-windows.ps1 found

TEST: PowerShell syntax validation
✓ PASS: No syntax errors found

...

========================================
Test Summary
========================================
Total Tests: 16
Passed: 16
Failed: 0

✓ All tests passed!
```

### 3. Integration Tests (`integration-tests.sh`)

**What it tests:**
- ✅ Development server is running
- ✅ Website loads correctly
- ✅ React app mounts
- ✅ SEO meta tags present
- ✅ macOS script accessible via HTTP
- ✅ Windows script accessible via HTTP
- ✅ macOS script downloads correctly
- ✅ Windows script downloads correctly
- ✅ Downloaded scripts have valid syntax
- ✅ Scripts match source files
- ✅ Correct content types
- ✅ No JavaScript errors

**Total Tests:** 12

**Example Output:**
```
========================================
Integration Tests for Start React Native
========================================

ℹ INFO: Using temporary directory: /tmp/tmp.XXXXXX
ℹ INFO: Testing website at: http://localhost:5173

TEST: Development server is running
✓ PASS: Server is running at http://localhost:5173

TEST: Download and validate macOS script
✓ PASS: macOS script downloaded and validated

...

========================================
Test Summary
========================================
Total Tests: 12
Passed: 12
Failed: 0

✓ All tests passed!
```

## 🔧 Troubleshooting

### Dev Server Not Running

**Error:**
```
✗ FAIL: Server is not running at http://localhost:5173
```

**Solution:**
```bash
# In the project root directory
npm run dev
```

### PowerShell Not Found

**Error:**
```
ℹ PowerShell not available - skipping Windows script tests
```

**Solution:**
```bash
# macOS
brew install --cask powershell

# Linux
# See: https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux
```

### Permission Denied

**Error:**
```
bash: ./test-macos-script.sh: Permission denied
```

**Solution:**
```bash
chmod +x test-macos-script.sh
chmod +x integration-tests.sh
chmod +x run-all-tests.sh
```

### Script Syntax Errors

If syntax tests fail, check:
1. Script has correct line endings (LF, not CRLF)
2. No special characters or encoding issues
3. All quotes and brackets are balanced

## 📊 Test Coverage

### Script Validation
- ✅ Syntax checking
- ✅ Command presence
- ✅ Error handling
- ✅ Platform-specific logic
- ✅ User feedback

### Integration Testing
- ✅ HTTP accessibility
- ✅ Download functionality
- ✅ File integrity
- ✅ Content validation

### What's NOT Tested
- ❌ Actual installation (would require clean environment)
- ❌ Network connectivity to external services
- ❌ Package manager availability
- ❌ User interaction/prompts
- ❌ Cross-platform execution

## 🎯 CI/CD Integration

### GitHub Actions Example

```yaml
name: Test Setup Scripts

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
      
      - name: Install dependencies
        run: npm install
      
      - name: Start dev server
        run: npm run dev &
        
      - name: Wait for server
        run: sleep 5
      
      - name: Run tests
        run: |
          cd tests
          chmod +x run-all-tests.sh
          ./run-all-tests.sh
```

## 📝 Adding New Tests

### To add a test to macOS script tests:

1. Open `test-macos-script.sh`
2. Create a new test function:
   ```bash
   test_my_new_test() {
       print_test "Description of test"
       
       # Your test logic here
       if [ condition ]; then
           print_pass "Test passed"
           return 0
       else
           print_fail "Test failed"
           return 1
       fi
   }
   ```
3. Add to main function:
   ```bash
   test_my_new_test || true
   ```

### To add a test to Windows script tests:

1. Open `test-windows-script.ps1`
2. Create a new test function:
   ```powershell
   function Test-MyNewTest {
       Write-TestName "Description of test"
       
       # Your test logic here
       if ($condition) {
           Write-Pass "Test passed"
           return $true
       } else {
           Write-Fail "Test failed"
           return $false
       }
   }
   ```
3. Add to Main function:
   ```powershell
   Test-MyNewTest
   ```

### To add an integration test:

1. Open `integration-tests.sh`
2. Follow the same pattern as macOS tests
3. Use curl for HTTP requests
4. Add to main function

## 🔍 Manual Testing Checklist

In addition to automated tests, manually verify:

- [ ] Download button works in browser
- [ ] OS detection shows correct OS
- [ ] Scripts download with correct filename
- [ ] Downloaded scripts are executable
- [ ] All links open in new tabs
- [ ] Mobile responsive design works
- [ ] FAQ accordion expands/collapses
- [ ] Tab switching works in Setup Instructions
- [ ] Smooth scrolling works
- [ ] All external links are valid

## 📚 Resources

- [Bash Testing Guide](https://github.com/bats-core/bats-core)
- [PowerShell Testing (Pester)](https://pester.dev/)
- [Integration Testing Best Practices](https://martinfowler.com/bliki/IntegrationTest.html)

## 🤝 Contributing

When adding new features to the setup scripts:

1. Update the corresponding test file
2. Add tests for new functionality
3. Run all tests before committing
4. Update this README if needed

## 📧 Support

If tests fail unexpectedly:
1. Check the error messages
2. Verify prerequisites are met
3. Try running tests individually
4. Check the troubleshooting section

---

**Happy Testing! 🧪**

