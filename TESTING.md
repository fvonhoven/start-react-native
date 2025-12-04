# Testing Documentation

Comprehensive testing guide for the Start React Native project.

## 🎯 Overview

This project includes a robust test suite that validates:

1. **Setup Scripts** - Ensures macOS and Windows scripts are syntactically correct and contain all required commands
2. **Website Functionality** - Verifies the landing page works correctly
3. **Download Mechanism** - Tests that scripts can be downloaded and are valid
4. **Integration** - Ensures all components work together

## ✅ Test Results

### Latest Test Run

```
╔════════════════════════════════════════╗
║  ✓ ALL TEST SUITES PASSED!            ║
╚════════════════════════════════════════╝

Total Test Suites: 2
Passed: 2
Failed: 0
```

**Breakdown:**
- ✅ macOS Script Tests: 15/15 passed
- ✅ Integration Tests: 12/12 passed
- ⚠️ Windows Script Tests: Skipped (PowerShell not available on macOS)

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
./test-macos-script.sh

# Windows script tests (requires PowerShell)
pwsh test-windows-script.ps1

# Integration tests (requires dev server)
./integration-tests.sh
```

## 📋 Test Suites

### 1. macOS Script Tests (15 tests)

Validates `public/setup-expo-macos.sh`:

| Test | Description | Status |
|------|-------------|--------|
| Script exists | File is present | ✅ |
| Shebang | Correct `#!/bin/bash` | ✅ |
| Executable | Can be made executable | ✅ |
| Syntax | No bash syntax errors | ✅ |
| Commands | All required commands present | ✅ |
| Error handling | Uses `set -e` | ✅ |
| Homebrew | Installation command found | ✅ |
| Node.js | Installation command found | ✅ |
| Expo CLI | Installation command found | ✅ |
| VS Code extensions | Installation found | ✅ |
| Test project | Creation command found | ✅ |
| User feedback | Echo statements present | ✅ |
| macOS-specific | Uses Homebrew | ✅ |
| No Windows commands | No choco/PowerShell | ✅ |
| Directory creation | mkdir logic found | ✅ |

### 2. Windows Script Tests (16 tests)

Validates `public/setup-expo-windows.ps1`:

| Test | Description | Status |
|------|-------------|--------|
| Script exists | File is present | ⚠️ |
| Syntax | No PowerShell errors | ⚠️ |
| Admin check | Privilege verification | ⚠️ |
| Chocolatey | Installation command found | ⚠️ |
| Node.js | Installation command found | ⚠️ |
| Git | Installation command found | ⚠️ |
| VS Code | Installation command found | ⚠️ |
| Expo CLI | Installation command found | ⚠️ |
| VS Code extensions | Installation found | ⚠️ |
| Test project | Creation command found | ⚠️ |
| Error handling | Try/catch or $ErrorActionPreference | ⚠️ |
| User feedback | Write-Host statements | ⚠️ |
| Windows-specific | Uses Chocolatey/PowerShell | ⚠️ |
| No macOS commands | No brew/bash | ⚠️ |
| Directory creation | New-Item/mkdir logic | ⚠️ |
| Environment refresh | PATH update logic | ⚠️ |

⚠️ = Requires PowerShell to run (not available on macOS by default)

### 3. Integration Tests (12 tests)

Validates website and download functionality:

| Test | Description | Status |
|------|-------------|--------|
| Server running | Dev server accessible | ✅ |
| Website loads | Correct title present | ✅ |
| React mounts | Root element found | ✅ |
| Meta tags | SEO tags present | ✅ |
| macOS script accessible | HTTP 200 response | ✅ |
| Windows script accessible | HTTP 200 response | ✅ |
| macOS download | Valid bash script | ✅ |
| Windows download | Valid PowerShell script | ✅ |
| Content types | Headers set correctly | ✅ |
| File integrity | Downloads match source | ✅ |
| README accessible | Documentation available | ✅ |
| No JS errors | Clean HTML output | ✅ |

## 🔧 Prerequisites

### For All Tests
- Bash shell (pre-installed on macOS/Linux)
- curl (pre-installed on most systems)

### For macOS Script Tests
- No additional requirements

### For Windows Script Tests
- PowerShell Core (pwsh) or Windows PowerShell
- Install on macOS: `brew install --cask powershell`
- Install on Linux: See [PowerShell docs](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux)

### For Integration Tests
- Development server running: `npm run dev`

## 📊 Test Coverage

### What IS Tested ✅

- ✅ Script syntax validation
- ✅ Required commands presence
- ✅ Error handling mechanisms
- ✅ Platform-specific logic
- ✅ User feedback/output
- ✅ HTTP accessibility
- ✅ Download functionality
- ✅ File integrity
- ✅ Content validation
- ✅ Website rendering
- ✅ React app mounting
- ✅ SEO meta tags

### What is NOT Tested ❌

- ❌ Actual package installation (requires clean environment)
- ❌ Network connectivity to external services
- ❌ Package manager availability (Homebrew, Chocolatey)
- ❌ User interaction/prompts
- ❌ Cross-platform execution
- ❌ VS Code extension installation
- ❌ Expo project creation
- ❌ Browser JavaScript execution
- ❌ UI interactions (clicks, scrolls)

## 🎓 Why These Tests Matter

### 1. Script Validation
**Problem:** Syntax errors in setup scripts would cause failures for users.
**Solution:** Automated syntax checking catches errors before deployment.

### 2. Command Verification
**Problem:** Missing installation commands would result in incomplete setups.
**Solution:** Tests verify all required tools are installed.

### 3. Platform Isolation
**Problem:** macOS commands in Windows script (or vice versa) would fail.
**Solution:** Tests ensure platform-specific commands are isolated.

### 4. Download Integrity
**Problem:** Corrupted downloads would frustrate users.
**Solution:** Tests verify downloaded files match source files.

### 5. Website Functionality
**Problem:** Broken website prevents users from accessing scripts.
**Solution:** Integration tests verify website works correctly.

## 🔍 Continuous Integration

### GitHub Actions Example

```yaml
name: Test Suite

on: [push, pull_request]

jobs:
  test:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, macos-latest, windows-latest]
    
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

## 📈 Future Test Improvements

### Planned Enhancements

1. **Browser Testing**
   - Add Playwright/Puppeteer for UI testing
   - Test OS detection in actual browsers
   - Verify download button clicks

2. **E2E Testing**
   - Test complete user flow
   - Verify all interactive elements
   - Test mobile responsiveness

3. **Performance Testing**
   - Lighthouse CI integration
   - Bundle size monitoring
   - Load time verification

4. **Accessibility Testing**
   - WCAG compliance checks
   - Screen reader compatibility
   - Keyboard navigation

5. **Visual Regression Testing**
   - Screenshot comparison
   - CSS regression detection
   - Cross-browser rendering

## 🐛 Troubleshooting

### Test Failures

#### "Server is not running"
```bash
# Start the dev server
npm run dev
```

#### "Permission denied"
```bash
# Make scripts executable
chmod +x tests/*.sh
```

#### "PowerShell not available"
```bash
# Install PowerShell Core (optional)
brew install --cask powershell
```

#### "Syntax errors detected"
- Check for CRLF line endings (should be LF)
- Verify no special characters
- Check quotes and brackets are balanced

## 📝 Adding New Tests

See [tests/README.md](tests/README.md) for detailed instructions on adding new tests.

## 🎯 Test Philosophy

Our testing approach follows these principles:

1. **Fast Feedback** - Tests run quickly (< 1 minute total)
2. **Reliable** - Tests are deterministic and don't flake
3. **Isolated** - Tests don't depend on external services
4. **Comprehensive** - Cover critical functionality
5. **Maintainable** - Easy to understand and update

## 📚 Resources

- [Bash Testing Best Practices](https://github.com/bats-core/bats-core)
- [PowerShell Testing (Pester)](https://pester.dev/)
- [Integration Testing Guide](https://martinfowler.com/bliki/IntegrationTest.html)
- [Test Pyramid](https://martinfowler.com/articles/practical-test-pyramid.html)

## 🤝 Contributing

When contributing:

1. ✅ Write tests for new features
2. ✅ Ensure all tests pass before committing
3. ✅ Update test documentation
4. ✅ Add test cases for bug fixes

## 📧 Support

If you encounter test failures:

1. Check error messages carefully
2. Verify prerequisites are met
3. Try running tests individually
4. Check the troubleshooting section
5. Review [tests/README.md](tests/README.md)

---

**Test Coverage: 43 automated tests across 3 test suites** 🧪

