#!/bin/bash

# Integration tests for Start React Native website
# Tests that scripts can be downloaded and are valid

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

# Configuration
WEBSITE_URL="http://localhost:5173"
TEMP_DIR=$(mktemp -d)

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

# Cleanup function
cleanup() {
    print_info "Cleaning up temporary files..."
    rm -rf "$TEMP_DIR"
}

trap cleanup EXIT

# Test 1: Check if dev server is running
test_server_running() {
    print_test "Development server is running"
    
    if curl -s -o /dev/null -w "%{http_code}" "$WEBSITE_URL" | grep -q "200"; then
        print_pass "Server is running at $WEBSITE_URL"
        return 0
    else
        print_fail "Server is not running at $WEBSITE_URL"
        print_info "Please start the dev server with: npm run dev"
        return 1
    fi
}

# Test 2: Check if macOS script is accessible
test_macos_script_accessible() {
    print_test "macOS script is accessible via HTTP"
    
    local status_code=$(curl -s -o /dev/null -w "%{http_code}" "$WEBSITE_URL/setup-expo-macos.sh")
    
    if [ "$status_code" = "200" ]; then
        print_pass "macOS script accessible (HTTP $status_code)"
        return 0
    else
        print_fail "macOS script not accessible (HTTP $status_code)"
        return 1
    fi
}

# Test 3: Check if Windows script is accessible
test_windows_script_accessible() {
    print_test "Windows script is accessible via HTTP"
    
    local status_code=$(curl -s -o /dev/null -w "%{http_code}" "$WEBSITE_URL/setup-expo-windows.ps1")
    
    if [ "$status_code" = "200" ]; then
        print_pass "Windows script accessible (HTTP $status_code)"
        return 0
    else
        print_fail "Windows script not accessible (HTTP $status_code)"
        return 1
    fi
}

# Test 4: Download and validate macOS script
test_download_macos_script() {
    print_test "Download and validate macOS script"
    
    local script_path="$TEMP_DIR/setup-expo-macos.sh"
    
    if curl -s "$WEBSITE_URL/setup-expo-macos.sh" -o "$script_path"; then
        # Check if file was downloaded
        if [ -f "$script_path" ]; then
            # Check if file is not empty
            if [ -s "$script_path" ]; then
                # Check if it's a bash script
                if head -n 1 "$script_path" | grep -q "#!/bin/bash"; then
                    # Check syntax
                    if bash -n "$script_path" 2>/dev/null; then
                        print_pass "macOS script downloaded and validated"
                        return 0
                    else
                        print_fail "macOS script has syntax errors"
                        return 1
                    fi
                else
                    print_fail "Downloaded file is not a bash script"
                    return 1
                fi
            else
                print_fail "Downloaded file is empty"
                return 1
            fi
        else
            print_fail "File was not downloaded"
            return 1
        fi
    else
        print_fail "Failed to download macOS script"
        return 1
    fi
}

# Test 5: Download and validate Windows script
test_download_windows_script() {
    print_test "Download and validate Windows script"
    
    local script_path="$TEMP_DIR/setup-expo-windows.ps1"
    
    if curl -s "$WEBSITE_URL/setup-expo-windows.ps1" -o "$script_path"; then
        # Check if file was downloaded
        if [ -f "$script_path" ]; then
            # Check if file is not empty
            if [ -s "$script_path" ]; then
                # Check if it contains PowerShell commands
                if grep -q "Write-Host\|PowerShell\|choco" "$script_path"; then
                    print_pass "Windows script downloaded and validated"
                    return 0
                else
                    print_fail "Downloaded file doesn't appear to be a PowerShell script"
                    return 1
                fi
            else
                print_fail "Downloaded file is empty"
                return 1
            fi
        else
            print_fail "File was not downloaded"
            return 1
        fi
    else
        print_fail "Failed to download Windows script"
        return 1
    fi
}

# Test 6: Check website loads without errors
test_website_loads() {
    print_test "Website loads without errors"
    
    local response=$(curl -s "$WEBSITE_URL")
    
    if echo "$response" | grep -q "Start React Native"; then
        print_pass "Website loads with correct title"
        return 0
    else
        print_fail "Website doesn't load correctly"
        return 1
    fi
}

# Test 7: Check for React app mounting
test_react_app_mounts() {
    print_test "React app mounts correctly"
    
    local response=$(curl -s "$WEBSITE_URL")
    
    if echo "$response" | grep -q '<div id="root">'; then
        print_pass "React root element found"
        return 0
    else
        print_fail "React root element not found"
        return 1
    fi
}

# Test 8: Check meta tags are present
test_meta_tags() {
    print_test "SEO meta tags are present"

    local response=$(curl -s "$WEBSITE_URL")

    if echo "$response" | grep -qi 'description' && \
       echo "$response" | grep -q 'og:'; then
        print_pass "Meta tags found"
        return 0
    else
        print_fail "Meta tags missing"
        return 1
    fi
}

# Test 9: Check scripts have correct content type
test_content_types() {
    print_test "Scripts have correct content types"
    
    local macos_type=$(curl -s -I "$WEBSITE_URL/setup-expo-macos.sh" | grep -i "content-type")
    local windows_type=$(curl -s -I "$WEBSITE_URL/setup-expo-windows.ps1" | grep -i "content-type")
    
    print_info "macOS script: $macos_type"
    print_info "Windows script: $windows_type"
    
    # Just check they return some content type
    if [ -n "$macos_type" ] && [ -n "$windows_type" ]; then
        print_pass "Content types are set"
        return 0
    else
        print_fail "Content types missing"
        return 1
    fi
}

# Test 10: Compare downloaded scripts with source
test_scripts_match_source() {
    print_test "Downloaded scripts match source files"
    
    local macos_downloaded="$TEMP_DIR/setup-expo-macos.sh"
    local windows_downloaded="$TEMP_DIR/setup-expo-windows.ps1"
    local macos_source="../public/setup-expo-macos.sh"
    local windows_source="../public/setup-expo-windows.ps1"
    
    # Download scripts
    curl -s "$WEBSITE_URL/setup-expo-macos.sh" -o "$macos_downloaded"
    curl -s "$WEBSITE_URL/setup-expo-windows.ps1" -o "$windows_downloaded"
    
    # Compare files
    if diff -q "$macos_downloaded" "$macos_source" >/dev/null 2>&1 && \
       diff -q "$windows_downloaded" "$windows_source" >/dev/null 2>&1; then
        print_pass "Downloaded scripts match source files"
        return 0
    else
        print_fail "Downloaded scripts differ from source files"
        return 1
    fi
}

# Test 11: Check README is accessible
test_readme_accessible() {
    print_test "README is accessible"
    
    local status_code=$(curl -s -o /dev/null -w "%{http_code}" "$WEBSITE_URL/README.md")
    
    if [ "$status_code" = "200" ]; then
        print_pass "README accessible (HTTP $status_code)"
        return 0
    else
        print_info "README not accessible (HTTP $status_code) - this is optional"
        return 0  # Not critical
    fi
}

# Test 12: Check for JavaScript errors (basic check)
test_no_js_errors() {
    print_test "No obvious JavaScript errors in HTML"
    
    local response=$(curl -s "$WEBSITE_URL")
    
    # Check for common error indicators
    if echo "$response" | grep -qi "error\|exception\|undefined is not"; then
        print_fail "Possible JavaScript errors detected"
        return 1
    else
        print_pass "No obvious JavaScript errors"
        return 0
    fi
}

# Main test execution
main() {
    print_header "Integration Tests for Start React Native"
    
    # Change to tests directory
    cd "$(dirname "$0")"
    
    print_info "Using temporary directory: $TEMP_DIR"
    print_info "Testing website at: $WEBSITE_URL"
    
    # Run all tests
    test_server_running || exit 1  # Exit if server not running
    test_website_loads || true
    test_react_app_mounts || true
    test_meta_tags || true
    test_macos_script_accessible || true
    test_windows_script_accessible || true
    test_download_macos_script || true
    test_download_windows_script || true
    test_content_types || true
    test_scripts_match_source || true
    test_readme_accessible || true
    test_no_js_errors || true
    
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

