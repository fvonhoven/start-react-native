# Quick Start Guide

Get the Start React Native landing page running in 3 minutes!

## 🚀 Super Quick Start

```bash
# 1. Install dependencies
npm install

# 2. Start development server
npm run dev

# 3. Open in browser
# Visit http://localhost:5173
```

That's it! The website should now be running locally.

## 🎯 What You'll See

When you open http://localhost:5173, you'll see:

1. **Hero Section** - Purple gradient with download button
2. **Features** - 6 cards showing what gets installed
3. **How It Works** - 3-step process
4. **Setup Instructions** - Tabbed macOS/Windows guides
5. **Try in Browser** - Expo Snack section
6. **Resources** - Learning materials
7. **FAQ** - Common questions
8. **Footer** - Links and CTA

## 🧪 Testing Features

### Test OS Detection
- Open the site in your browser
- Look below the download button
- You should see "Detected: macOS" or "Detected: Windows"

### Test Download Button
- Click "Download Setup Script" in the hero
- The correct script for your OS should download
- macOS: `setup-expo-macos.sh`
- Windows: `setup-expo-windows.ps1`

### Test Tabs
- Scroll to "Setup Instructions"
- Click between macOS and Windows tabs
- Instructions should change

### Test FAQ Accordion
- Scroll to FAQ section
- Click on any question
- It should expand/collapse smoothly

### Test Smooth Scrolling
- Click any link in the footer
- Page should smoothly scroll to that section

## 🛠️ Common Commands

```bash
# Development
npm run dev          # Start dev server
npm run build        # Build for production
npm run preview      # Preview production build
npm run lint         # Run ESLint

# Deployment
vercel              # Deploy to Vercel
netlify deploy      # Deploy to Netlify
```

## 📱 Test on Mobile

### Option 1: Use Your Phone
1. Find your computer's IP address:
   ```bash
   # macOS/Linux
   ifconfig | grep "inet "
   
   # Windows
   ipconfig
   ```

2. Start dev server with host flag:
   ```bash
   npm run dev -- --host
   ```

3. On your phone, visit:
   ```
   http://YOUR_IP_ADDRESS:5173
   ```

### Option 2: Use Browser DevTools
1. Open the site in Chrome
2. Press F12 to open DevTools
3. Click the device toggle icon (Ctrl+Shift+M)
4. Select a mobile device from the dropdown

## 🎨 Quick Customization

### Change Colors
Edit `tailwind.config.js`:
```javascript
theme: {
  extend: {
    colors: {
      primary: '#6366f1',    // Change this
      secondary: '#10b981',  // And this
    },
  },
}
```

### Change Text
All text is in the component files:
- `src/components/Hero.jsx` - Hero section text
- `src/components/Features.jsx` - Feature descriptions
- `src/components/FAQ.jsx` - FAQ questions/answers
- etc.

### Change Links
Update external links in:
- `src/components/Resources.jsx` - Resource links
- `src/components/Footer.jsx` - Footer links
- `src/components/TryNow.jsx` - Expo Snack link

## 🐛 Troubleshooting

### Port Already in Use
```bash
# Kill process on port 5173
# macOS/Linux
lsof -ti:5173 | xargs kill -9

# Windows
netstat -ano | findstr :5173
taskkill /PID <PID> /F
```

### Dependencies Not Installing
```bash
# Clear npm cache
npm cache clean --force

# Delete node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
```

### Tailwind Not Working
```bash
# Restart dev server
# Press Ctrl+C to stop
npm run dev
```

### Build Errors
```bash
# Check for TypeScript/ESLint errors
npm run lint

# Clear Vite cache
rm -rf node_modules/.vite
npm run dev
```

## 📚 Learn More

- **README.md** - Full project documentation
- **DEPLOYMENT.md** - How to deploy to production
- **PROJECT_SUMMARY.md** - Complete feature list
- **public/README.md** - Setup scripts documentation

## 🎓 Next Steps

1. ✅ Get it running locally
2. ✅ Test all features
3. ✅ Customize colors and text
4. ✅ Test on mobile
5. ✅ Build for production
6. ✅ Deploy to hosting platform

## 💡 Pro Tips

1. **Hot Reload** - Changes auto-refresh in dev mode
2. **Component Structure** - Each section is a separate component
3. **Tailwind Classes** - Use Tailwind's utility classes for styling
4. **Responsive Design** - Use `sm:`, `md:`, `lg:` prefixes
5. **Icons** - Currently using emojis, can replace with icon library

## 🚀 Ready to Deploy?

See **DEPLOYMENT.md** for detailed deployment instructions to:
- Vercel (recommended)
- Netlify
- GitHub Pages
- Cloudflare Pages
- AWS S3

## 🆘 Need Help?

- Check the console for errors (F12 in browser)
- Read the full README.md
- Check the component files for examples
- All external links open in new tabs

---

**Happy coding! 🎉**

