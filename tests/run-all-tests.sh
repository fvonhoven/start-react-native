#!/bin/bash

# Run all tests for Start React Native project
# This script runs macOS script tests, Windows script tests (if on Windows/WSL),
# and integration tests

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Print functions
print_header() {
    echo -e "\n${CYAN}╔════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC} $1"
    echo -e "${CYAN}╚════════════════════════════════════════╝${NC}\n"
}

print_section() {
    echo -e "\n${BLUE}▶ $1${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}ℹ $1${NC}"
}

# Change to tests directory
cd "$(dirname "$0")"

# Track overall results
TOTAL_SUITES=0
PASSED_SUITES=0
FAILED_SUITES=0

print_header "Start React Native - Test Suite Runner"

# Test 1: macOS Script Tests
print_section "Running macOS Script Tests"
TOTAL_SUITES=$((TOTAL_SUITES + 1))

if [ -f "test-macos-script.sh" ]; then
    chmod +x test-macos-script.sh
    if ./test-macos-script.sh; then
        print_success "macOS script tests passed"
        PASSED_SUITES=$((PASSED_SUITES + 1))
    else
        print_error "macOS script tests failed"
        FAILED_SUITES=$((FAILED_SUITES + 1))
    fi
else
    print_error "test-macos-script.sh not found"
    FAILED_SUITES=$((FAILED_SUITES + 1))
fi

# Test 2: Windows Script Tests (if PowerShell is available)
print_section "Running Windows Script Tests"
TOTAL_SUITES=$((TOTAL_SUITES + 1))

if command -v pwsh >/dev/null 2>&1 || command -v powershell >/dev/null 2>&1; then
    if [ -f "test-windows-script.ps1" ]; then
        # Try pwsh first (PowerShell Core), then powershell (Windows PowerShell)
        if command -v pwsh >/dev/null 2>&1; then
            if pwsh -File test-windows-script.ps1; then
                print_success "Windows script tests passed"
                PASSED_SUITES=$((PASSED_SUITES + 1))
            else
                print_error "Windows script tests failed"
                FAILED_SUITES=$((FAILED_SUITES + 1))
            fi
        elif command -v powershell >/dev/null 2>&1; then
            if powershell -File test-windows-script.ps1; then
                print_success "Windows script tests passed"
                PASSED_SUITES=$((PASSED_SUITES + 1))
            else
                print_error "Windows script tests failed"
                FAILED_SUITES=$((FAILED_SUITES + 1))
            fi
        fi
    else
        print_error "test-windows-script.ps1 not found"
        FAILED_SUITES=$((FAILED_SUITES + 1))
    fi
else
    print_info "PowerShell not available - skipping Windows script tests"
    print_info "Install PowerShell Core to run Windows tests on macOS/Linux"
    TOTAL_SUITES=$((TOTAL_SUITES - 1))  # Don't count as failed
fi

# Test 3: Integration Tests
print_section "Running Integration Tests"
TOTAL_SUITES=$((TOTAL_SUITES + 1))

# Check if dev server is running
if curl -s -o /dev/null -w "%{http_code}" "http://localhost:5173" | grep -q "200"; then
    if [ -f "integration-tests.sh" ]; then
        chmod +x integration-tests.sh
        if ./integration-tests.sh; then
            print_success "Integration tests passed"
            PASSED_SUITES=$((PASSED_SUITES + 1))
        else
            print_error "Integration tests failed"
            FAILED_SUITES=$((FAILED_SUITES + 1))
        fi
    else
        print_error "integration-tests.sh not found"
        FAILED_SUITES=$((FAILED_SUITES + 1))
    fi
else
    print_error "Dev server not running at http://localhost:5173"
    print_info "Start the dev server with: npm run dev"
    print_info "Then run this test suite again"
    FAILED_SUITES=$((FAILED_SUITES + 1))
fi

# Print final summary
print_header "Final Test Summary"

echo -e "Total Test Suites: ${BLUE}$TOTAL_SUITES${NC}"
echo -e "Passed: ${GREEN}$PASSED_SUITES${NC}"
echo -e "Failed: ${RED}$FAILED_SUITES${NC}"

if [ $FAILED_SUITES -eq 0 ]; then
    echo -e "\n${GREEN}╔════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  ✓ ALL TEST SUITES PASSED!            ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════╝${NC}\n"
    exit 0
else
    echo -e "\n${RED}╔════════════════════════════════════════╗${NC}"
    echo -e "${RED}║  ✗ SOME TEST SUITES FAILED!           ║${NC}"
    echo -e "${RED}╚════════════════════════════════════════╝${NC}\n"
    exit 1
fi

