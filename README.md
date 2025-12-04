# Start React Native - Landing Page

A modern, responsive landing page for [startreactnative.com](https://startreactnative.com) - automated setup scripts for React Native and Expo development.

![Start React Native](https://img.shields.io/badge/React-18-blue)
![Vite](https://img.shields.io/badge/Vite-7-purple)
![Tailwind CSS](https://img.shields.io/badge/Tailwind-3-cyan)

## 🚀 Features

- **OS Detection** - Automatically detects user's operating system (macOS/Windows)
- **Smart Downloads** - Serves the correct setup script based on detected OS
- **Responsive Design** - Mobile-first design that works on all devices
- **Modern UI** - Gradient backgrounds, glassmorphism effects, smooth animations
- **Interactive Components** - Tabbed instructions, FAQ accordion, smooth scrolling
- **SEO Optimized** - Comprehensive meta tags for search engines and social media

## 📦 Tech Stack

- **React 18** - UI library
- **Vite** - Build tool and dev server
- **Tailwind CSS 3** - Utility-first CSS framework
- **PostCSS** - CSS processing
- **ESLint** - Code linting

## 🛠️ Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd start-react-native
   ```

2. **Install dependencies**

   ```bash
   npm install
   ```

3. **Start development server**

   ```bash
   npm run dev
   ```

4. **Open in browser**
   ```
   http://localhost:5173
   ```

## 📁 Project Structure

```
start-react-native/
├── public/
│   ├── setup-expo-macos.sh      # macOS setup script
│   ├── setup-expo-windows.ps1   # Windows setup script
│   └── README.md                # Setup scripts documentation
├── src/
│   ├── components/
│   │   ├── Hero.jsx             # Hero section with OS detection
│   │   ├── Features.jsx         # What gets installed
│   │   ├── HowItWorks.jsx       # 3-step process
│   │   ├── SetupInstructions.jsx # Tabbed setup guide
│   │   ├── TryNow.jsx           # Expo Snack section
│   │   ├── Resources.jsx        # Learning resources
│   │   ├── FAQ.jsx              # FAQ accordion
│   │   └── Footer.jsx           # Footer with CTA
│   ├── App.jsx                  # Main app component
│   ├── main.jsx                 # Entry point
│   └── index.css                # Global styles
├── index.html                   # HTML template
├── tailwind.config.js           # Tailwind configuration
├── postcss.config.js            # PostCSS configuration
└── vite.config.js               # Vite configuration
```

## 🎨 Components

### Hero

- Gradient background with animated blobs
- OS detection and smart download button
- Stats display (setup time, automation level)
- Smooth scroll indicator

### Features

- Grid of 6 feature cards
- Hover effects and animations
- Icons for visual appeal

### How It Works

- 3-step visual process
- Numbered circles with connecting lines
- Clear, concise descriptions

### Setup Instructions

- Tabbed interface (macOS/Windows)
- Step-by-step instructions
- Code blocks with syntax highlighting
- Warning/info boxes

### Try Now

- Expo Snack integration
- Code preview
- Benefits list with checkmarks

### Resources

- 4 resource cards with external links
- Additional help section
- Community links

### FAQ

- Accordion-style questions
- Smooth expand/collapse animations
- 6 common questions answered

### Footer

- Repeat CTA section
- Quick links navigation
- Resource links
- Back to top button

## 🚀 Build for Production

```bash
npm run build
```

The build output will be in the `dist/` directory.

## 🧪 Preview Production Build

```bash
npm run preview
```

## 🧪 Testing

Run the comprehensive test suite to verify setup scripts and website functionality:

```bash
cd tests
./run-all-tests.sh
```

**Test Coverage:**

- ✅ macOS script validation (15 tests)
- ✅ Windows script validation (16 tests)
- ✅ Integration tests (12 tests)
- ✅ Syntax checking
- ✅ Download functionality
- ✅ File integrity

See [tests/README.md](tests/README.md) for detailed testing documentation.

## 📝 Setup Scripts

The setup scripts in the `public/` folder automate the installation of:

- **Node.js & npm** - JavaScript runtime and package manager
- **Git** - Version control system
- **Visual Studio Code** - Code editor
- **Expo CLI** - React Native development tools
- **VS Code Extensions** - Essential extensions
- **Test Project** - Sample app to get started

### macOS Script

- Uses Homebrew for package management
- Installs Watchman for file watching
- Creates test project in `~/ReactNativeProjects`

### Windows Script

- Uses Chocolatey for package management
- Runs with Administrator privileges
- Creates test project in `%USERPROFILE%\ReactNativeProjects`

## 🎨 Customization

### Colors

Edit `tailwind.config.js` to customize the color scheme:

```javascript
theme: {
  extend: {
    colors: {
      primary: '#6366f1',    // Indigo
      secondary: '#10b981',  // Green
    },
  },
}
```

### Fonts

The site uses Inter font family. To change it, update:

1. `tailwind.config.js` - font family configuration
2. `src/index.css` - Google Fonts import

### Content

All content is in the component files under `src/components/`. Edit the text, links, and data directly in each component.

## 🌐 Deployment

This site can be deployed to any static hosting service:

- **Vercel** - `vercel deploy`
- **Netlify** - Drag and drop `dist/` folder
- **GitHub Pages** - Use `gh-pages` package
- **Cloudflare Pages** - Connect repository

## 📄 License

This project is open source and available under the MIT License.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## 📧 Contact

For questions or support, visit [startreactnative.com](https://startreactnative.com)

---

**Built with ❤️ for the React Native community**
