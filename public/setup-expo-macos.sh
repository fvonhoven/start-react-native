#!/bin/bash

# Start React Native - macOS Setup Script
# This script automates the installation of everything needed for React Native/Expo development

set -e  # Exit on error

echo "=========================================="
echo "  Start React Native - macOS Setup"
echo "=========================================="
echo ""
echo "This script will install:"
echo "  ✓ Homebrew (package manager)"
echo "  ✓ Node.js & npm"
echo "  ✓ Git"
echo "  ✓ Visual Studio Code"
echo "  ✓ Expo CLI"
echo "  ✓ VS Code Extensions"
echo "  ✓ Test Project"
echo ""
read -p "Press Enter to continue or Ctrl+C to cancel..."
echo ""

# Function to print status messages
print_status() {
    echo ""
    echo "===> $1"
    echo ""
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Homebrew if not already installed
print_status "Checking for Homebrew..."
if ! command_exists brew; then
    print_status "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    print_status "Homebrew already installed ✓"
fi

# Update Homebrew
print_status "Updating Homebrew..."
brew update

# Install Node.js if not already installed
print_status "Checking for Node.js..."
if ! command_exists node; then
    print_status "Installing Node.js..."
    brew install node
else
    print_status "Node.js already installed ✓"
    echo "Current version: $(node --version)"
fi

# Install Git if not already installed
print_status "Checking for Git..."
if ! command_exists git; then
    print_status "Installing Git..."
    brew install git
else
    print_status "Git already installed ✓"
    echo "Current version: $(git --version)"
fi

# Install Visual Studio Code if not already installed
print_status "Checking for Visual Studio Code..."
if ! command_exists code; then
    print_status "Installing Visual Studio Code..."
    brew install --cask visual-studio-code
    
    # Add code command to PATH
    cat << EOF >> ~/.zprofile

# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF
    export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
else
    print_status "Visual Studio Code already installed ✓"
fi

# Install Watchman (recommended for React Native)
print_status "Checking for Watchman..."
if ! command_exists watchman; then
    print_status "Installing Watchman..."
    brew install watchman
else
    print_status "Watchman already installed ✓"
fi

# Install Expo CLI globally
print_status "Installing Expo CLI..."
npm install -g expo-cli

# Install useful VS Code extensions
print_status "Installing VS Code extensions..."
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension msjsdiag.vscode-react-native
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension dsznajder.es7-react-js-snippets

# Create a test project
print_status "Creating test project..."
cd ~
mkdir -p ReactNativeProjects
cd ReactNativeProjects

if [ ! -d "MyFirstApp" ]; then
    npx create-expo-app MyFirstApp --template blank
    print_status "Test project created at ~/ReactNativeProjects/MyFirstApp"
else
    print_status "Test project already exists ✓"
fi

# Print success message
echo ""
echo "=========================================="
echo "  ✓ Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "  1. Restart your Terminal"
echo "  2. Install Expo Go on your phone:"
echo "     - iOS: https://apps.apple.com/app/expo-go/id982107779"
echo "     - Android: https://play.google.com/store/apps/details?id=host.exp.exponent"
echo "  3. Navigate to your project:"
echo "     cd ~/ReactNativeProjects/MyFirstApp"
echo "  4. Start the development server:"
echo "     npx expo start"
echo "  5. Scan the QR code with Expo Go to see your app!"
echo ""
echo "Resources:"
echo "  - Expo Docs: https://docs.expo.dev/"
echo "  - Tutorial: https://docs.expo.dev/tutorial/introduction/"
echo "  - Community: https://chat.expo.dev/"
echo ""
echo "Happy coding! 🚀"
echo ""

