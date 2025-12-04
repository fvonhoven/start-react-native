#!/bin/bash

# Test suite for setup-expo-macos.sh
# This script validates the macOS setup script without actually installing anything

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test counters
TESTS_RUN=0
TESTS_PASSED=0
TESTS_FAILED=0

# Print functions
print_header() {
    echo -e "\n${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}\n"
}

print_test() {
    echo -e "${YELLOW}TEST:${NC} $1"
    TESTS_RUN=$((TESTS_RUN + 1))
}

print_pass() {
    echo -e "${GREEN}✓ PASS:${NC} $1\n"
    TESTS_PASSED=$((TESTS_PASSED + 1))
}

print_fail() {
    echo -e "${RED}✗ FAIL:${NC} $1\n"
    TESTS_FAILED=$((TESTS_FAILED + 1))
}

print_info() {
    echo -e "${BLUE}ℹ INFO:${NC} $1"
}

# Test 1: Check if script file exists
test_script_exists() {
    print_test "Script file exists"
    if [ -f "../public/setup-expo-macos.sh" ]; then
        print_pass "setup-expo-macos.sh found"
        return 0
    else
        print_fail "setup-expo-macos.sh not found"
        return 1
    fi
}

# Test 2: Check if script has correct shebang
test_shebang() {
    print_test "Script has correct shebang"
    local first_line=$(head -n 1 ../public/setup-expo-macos.sh)
    if [[ "$first_line" == "#!/bin/bash" ]]; then
        print_pass "Correct shebang: $first_line"
        return 0
    else
        print_fail "Incorrect shebang: $first_line"
        return 1
    fi
}

# Test 3: Check if script is executable or can be made executable
test_executable() {
    print_test "Script can be made executable"
    if chmod +x ../public/setup-expo-macos.sh 2>/dev/null; then
        print_pass "Script can be made executable"
        return 0
    else
        print_fail "Cannot make script executable"
        return 1
    fi
}

# Test 4: Validate bash syntax
test_bash_syntax() {
    print_test "Bash syntax validation"
    if bash -n ../public/setup-expo-macos.sh 2>/dev/null; then
        print_pass "No syntax errors found"
        return 0
    else
        print_fail "Syntax errors detected"
        bash -n ../public/setup-expo-macos.sh
        return 1
    fi
}

# Test 5: Check for required commands in script
test_required_commands() {
    print_test "Script contains required installation commands"
    local script_content=$(cat ../public/setup-expo-macos.sh)
    local required_commands=("brew" "node" "git" "code" "npm" "npx")
    local all_found=true
    
    for cmd in "${required_commands[@]}"; do
        if echo "$script_content" | grep -q "$cmd"; then
            print_info "Found reference to: $cmd"
        else
            print_info "Missing reference to: $cmd"
            all_found=false
        fi
    done
    
    if [ "$all_found" = true ]; then
        print_pass "All required commands referenced"
        return 0
    else
        print_fail "Some required commands missing"
        return 1
    fi
}

# Test 6: Check for error handling
test_error_handling() {
    print_test "Script has error handling"
    local script_content=$(cat ../public/setup-expo-macos.sh)
    
    if echo "$script_content" | grep -q "set -e"; then
        print_pass "Script uses 'set -e' for error handling"
        return 0
    else
        print_fail "Script missing 'set -e' error handling"
        return 1
    fi
}

# Test 7: Check for Homebrew installation
test_homebrew_install() {
    print_test "Script installs Homebrew"
    local script_content=$(cat ../public/setup-expo-macos.sh)
    
    if echo "$script_content" | grep -q "brew.sh"; then
        print_pass "Homebrew installation command found"
        return 0
    else
        print_fail "Homebrew installation command not found"
        return 1
    fi
}

# Test 8: Check for Node.js installation
test_nodejs_install() {
    print_test "Script installs Node.js"
    local script_content=$(cat ../public/setup-expo-macos.sh)
    
    if echo "$script_content" | grep -q "brew install node"; then
        print_pass "Node.js installation command found"
        return 0
    else
        print_fail "Node.js installation command not found"
        return 1
    fi
}

# Test 9: Check for Expo CLI installation
test_expo_install() {
    print_test "Script installs Expo CLI"
    local script_content=$(cat ../public/setup-expo-macos.sh)
    
    if echo "$script_content" | grep -q "npm install -g expo-cli"; then
        print_pass "Expo CLI installation command found"
        return 0
    else
        print_fail "Expo CLI installation command not found"
        return 1
    fi
}

# Test 10: Check for VS Code extensions
test_vscode_extensions() {
    print_test "Script installs VS Code extensions"
    local script_content=$(cat ../public/setup-expo-macos.sh)
    
    if echo "$script_content" | grep -q "code --install-extension"; then
        print_pass "VS Code extension installation found"
        return 0
    else
        print_fail "VS Code extension installation not found"
        return 1
    fi
}

# Test 11: Check for test project creation
test_project_creation() {
    print_test "Script creates test project"
    local script_content=$(cat ../public/setup-expo-macos.sh)
    
    if echo "$script_content" | grep -q "npx create-expo-app"; then
        print_pass "Test project creation command found"
        return 0
    else
        print_fail "Test project creation command not found"
        return 1
    fi
}

# Test 12: Check for user feedback/output
test_user_feedback() {
    print_test "Script provides user feedback"
    local script_content=$(cat ../public/setup-expo-macos.sh)
    
    if echo "$script_content" | grep -q "echo"; then
        print_pass "Script contains echo statements for user feedback"
        return 0
    else
        print_fail "Script missing user feedback"
        return 1
    fi
}

# Test 13: Check for macOS-specific commands
test_macos_specific() {
    print_test "Script uses macOS-specific commands appropriately"
    local script_content=$(cat ../public/setup-expo-macos.sh)
    
    # Check for Homebrew (macOS package manager)
    if echo "$script_content" | grep -q "brew"; then
        print_pass "Uses Homebrew (macOS package manager)"
        return 0
    else
        print_fail "Missing Homebrew commands"
        return 1
    fi
}

# Test 14: Check file doesn't contain Windows-specific commands
test_no_windows_commands() {
    print_test "Script doesn't contain Windows-specific commands"
    local script_content=$(cat ../public/setup-expo-macos.sh)
    
    if echo "$script_content" | grep -qE "(choco|winget|\.exe|PowerShell)"; then
        print_fail "Contains Windows-specific commands"
        return 1
    else
        print_pass "No Windows-specific commands found"
        return 0
    fi
}

# Test 15: Check for proper directory creation
test_directory_creation() {
    print_test "Script creates project directory"
    local script_content=$(cat ../public/setup-expo-macos.sh)
    
    if echo "$script_content" | grep -qE "(mkdir|ReactNativeProjects)"; then
        print_pass "Directory creation logic found"
        return 0
    else
        print_fail "Directory creation logic not found"
        return 1
    fi
}

# Main test execution
main() {
    print_header "macOS Setup Script Test Suite"
    
    # Change to tests directory
    cd "$(dirname "$0")"
    
    # Run all tests
    test_script_exists || true
    test_shebang || true
    test_executable || true
    test_bash_syntax || true
    test_required_commands || true
    test_error_handling || true
    test_homebrew_install || true
    test_nodejs_install || true
    test_expo_install || true
    test_vscode_extensions || true
    test_project_creation || true
    test_user_feedback || true
    test_macos_specific || true
    test_no_windows_commands || true
    test_directory_creation || true
    
    # Print summary
    print_header "Test Summary"
    echo -e "Total Tests: ${BLUE}$TESTS_RUN${NC}"
    echo -e "Passed: ${GREEN}$TESTS_PASSED${NC}"
    echo -e "Failed: ${RED}$TESTS_FAILED${NC}"
    
    if [ $TESTS_FAILED -eq 0 ]; then
        echo -e "\n${GREEN}✓ All tests passed!${NC}\n"
        exit 0
    else
        echo -e "\n${RED}✗ Some tests failed!${NC}\n"
        exit 1
    fi
}

# Run main function
main

