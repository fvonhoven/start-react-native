# Start React Native - Setup Scripts

Automated setup scripts to get you building mobile apps with React Native and Expo in minutes.

## 🚀 Quick Start

### macOS

1. Download `setup-expo-macos.sh`
2. Open Terminal (Cmd+Space, type "Terminal")
3. Navigate to Downloads:
   ```bash
   cd ~/Downloads
   ```
4. Make the script executable:
   ```bash
   chmod +x setup-expo-macos.sh
   ```
5. Run the script:
   ```bash
   ./setup-expo-macos.sh
   ```
6. Restart Terminal when complete

### Windows

1. Download `setup-expo-windows.ps1`
2. Open PowerShell as Administrator (Win+X, select "Windows PowerShell (Admin)")
3. Navigate to Downloads:
   ```powershell
   cd $env:USERPROFILE\Downloads
   ```
4. Run the script:
   ```powershell
   .\setup-expo-windows.ps1
   ```
5. Restart your computer when complete

## 📦 What Gets Installed

- **Node.js & npm** - JavaScript runtime and package manager
- **Git** - Version control system
- **Visual Studio Code** - Code editor
- **Expo CLI** - React Native development tools
- **VS Code Extensions** - Essential extensions for React Native development
- **Test Project** - A sample app to get you started

## ⏱️ Setup Time

The automated setup typically takes **10-20 minutes**, depending on your internet connection.

## 🆘 Troubleshooting

### macOS Issues

**"Permission denied" error:**
```bash
chmod +x setup-expo-macos.sh
```

**Homebrew installation fails:**
- Make sure you have Xcode Command Line Tools installed
- Run: `xcode-select --install`

**"command not found" after installation:**
- Restart your Terminal
- Or reload your shell: `source ~/.zprofile`

### Windows Issues

**"Execution policy" error:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**"Must be run as Administrator" error:**
- Right-click PowerShell
- Select "Run as Administrator"

**Chocolatey installation fails:**
- Check your internet connection
- Disable antivirus temporarily
- Try running the script again

## 📱 After Setup

1. **Install Expo Go on your phone:**
   - iOS: [App Store](https://apps.apple.com/app/expo-go/id982107779)
   - Android: [Play Store](https://play.google.com/store/apps/details?id=host.exp.exponent)

2. **Navigate to your test project:**
   - macOS: `cd ~/ReactNativeProjects/MyFirstApp`
   - Windows: `cd $env:USERPROFILE\ReactNativeProjects\MyFirstApp`

3. **Start the development server:**
   ```bash
   npx expo start
   ```

4. **Scan the QR code** with Expo Go to see your app running!

## 📚 Learning Resources

- [Expo Documentation](https://docs.expo.dev/)
- [Expo Tutorial](https://docs.expo.dev/tutorial/introduction/)
- [React Native Docs](https://reactnative.dev/docs/getting-started)
- [Community Discord](https://chat.expo.dev/)

## 🤝 Getting Help

- **Discord Community:** [chat.expo.dev](https://chat.expo.dev/)
- **Stack Overflow:** Tag your questions with `expo` and `react-native`
- **GitHub Discussions:** [expo/expo](https://github.com/expo/expo/discussions)

## ❓ FAQ

**Do I need coding experience?**
No! These tools are beginner-friendly. Start with the Expo tutorial to learn the basics.

**Can I build iOS apps on Windows?**
Yes! With Expo, you can develop iOS apps on Windows and use Expo's cloud build service.

**Is this free?**
Yes, all tools are free and open-source. Expo offers a generous free tier.

**What if I already have some tools installed?**
The scripts check for existing installations and skip them.

## 📄 License

These setup scripts are provided as-is for educational purposes. All installed software is subject to their respective licenses.

---

**Happy coding! 🚀**

Visit [startreactnative.com](https://startreactnative.com) for more information.

