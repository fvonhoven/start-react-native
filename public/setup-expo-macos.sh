#!/bin/bash

# Start React Native - macOS Setup Script
# This script automates the installation of everything needed for React Native/Expo development

echo "=========================================="
echo "  Start React Native - macOS Setup"
echo "=========================================="
echo ""
echo "This script will install:"
echo "  ✓ Homebrew (package manager)"
echo "  ✓ Node.js & npm"
echo "  ✓ Git"
echo "  ✓ Visual Studio Code"
echo "  ✓ Watchman (file watcher)"
echo "  ✓ EAS CLI (Expo build tools)"
echo "  ✓ VS Code Extensions"
echo ""
read -p "Press Enter to continue or Ctrl+C to cancel..."
echo ""

# Function to print status messages
print_status() {
    echo ""
    echo "===> $1"
    echo ""
}

print_success() {
    echo "[✓] $1"
}

print_warning() {
    echo "[!] $1"
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
        if ! grep -q '/opt/homebrew/bin/brew shellenv' ~/.zprofile 2>/dev/null; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        fi
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    print_success "Homebrew already installed"
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
    print_success "Node.js already installed ($(node --version))"
fi

# Install Git if not already installed
print_status "Checking for Git..."
if ! command_exists git; then
    print_status "Installing Git..."
    brew install git
else
    print_success "Git already installed ($(git --version))"
fi

# Install Visual Studio Code if not already installed
print_status "Checking for Visual Studio Code..."
if ! command_exists code; then
    print_status "Installing Visual Studio Code..."
    brew install --cask visual-studio-code

    # Add code command to PATH if not already present
    VS_CODE_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    if ! grep -q "$VS_CODE_PATH" ~/.zprofile 2>/dev/null; then
        cat << EOF >> ~/.zprofile

# Add Visual Studio Code (code)
export PATH="\$PATH:$VS_CODE_PATH"
EOF
    fi
    export PATH="$PATH:$VS_CODE_PATH"
else
    print_success "Visual Studio Code already installed"
fi

# Install Watchman (recommended for React Native)
print_status "Checking for Watchman..."
if ! command_exists watchman; then
    print_status "Installing Watchman..."
    brew install watchman
else
    print_success "Watchman already installed"
fi

# Install EAS CLI globally (modern Expo build tooling)
print_status "Installing EAS CLI..."
npm install -g eas-cli
print_success "EAS CLI installed"

# Install VS Code extensions (non-fatal if these fail)
print_status "Installing VS Code extensions..."
if command_exists code; then
    code --install-extension dbaeumer.vscode-eslint || print_warning "Could not install ESLint extension"
    code --install-extension esbenp.prettier-vscode || print_warning "Could not install Prettier extension"
    code --install-extension msjsdiag.vscode-react-native || print_warning "Could not install React Native extension"
    code --install-extension mgmcdermott.vscode-language-babel || print_warning "Could not install Babel extension"
    code --install-extension dsznajder.es7-react-js-snippets || print_warning "Could not install React snippets extension"
    print_success "VS Code extensions installed"
else
    print_warning "VS Code 'code' command not available yet."
    echo "         Open VS Code from Finder first, then run these manually:"
    echo "           code --install-extension dbaeumer.vscode-eslint"
    echo "           code --install-extension esbenp.prettier-vscode"
    echo "           code --install-extension msjsdiag.vscode-react-native"
    echo "           code --install-extension mgmcdermott.vscode-language-babel"
    echo "           code --install-extension dsznajder.es7-react-js-snippets"
fi

# Create a test project (optional)
echo ""
read -p "Would you like to create a test Expo project? (y/n): " create_project

if [[ "$create_project" == "y" || "$create_project" == "Y" ]]; then
    print_status "Creating test project..."
    mkdir -p ~/ReactNativeProjects
    cd ~/ReactNativeProjects

    if [ ! -d "MyFirstApp" ]; then
        npx create-expo-app@latest MyFirstApp
        print_success "Test project created at ~/ReactNativeProjects/MyFirstApp"
    else
        print_success "Test project already exists at ~/ReactNativeProjects/MyFirstApp"
    fi
fi

# Print success message
echo ""
echo "=========================================="
echo "  ✓ Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "  1. RESTART your Terminal (or run: source ~/.zprofile)"
echo "  2. Install Expo Go on your phone:"
echo "     - iOS: https://apps.apple.com/app/expo-go/id982107779"
echo "     - Android: https://play.google.com/store/apps/details?id=host.exp.exponent"
echo "  3. Create a new project:"
echo "     npx create-expo-app@latest MyApp"
echo "  4. Navigate to your project:"
echo "     cd MyApp"
echo "  5. Start the development server:"
echo "     npx expo start"
echo "  6. Scan the QR code with Expo Go to see your app!"
echo ""
echo "Resources:"
echo "  - Expo Docs: https://docs.expo.dev/"
echo "  - Tutorial: https://docs.expo.dev/tutorial/introduction/"
echo "  - Community: https://chat.expo.dev/"
echo ""
echo "Happy coding! 🚀"
echo ""

