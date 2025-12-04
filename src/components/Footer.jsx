import { useState, useEffect } from 'react';

const Footer = () => {
  const [os, setOs] = useState('');

  useEffect(() => {
    const detectOS = () => {
      const userAgent = window.navigator.userAgent.toLowerCase();
      if (userAgent.indexOf('mac') !== -1) {
        return 'macOS';
      } else if (userAgent.indexOf('win') !== -1) {
        return 'Windows';
      }
      return 'Unknown';
    };
    setOs(detectOS());
  }, []);

  const getDownloadLink = () => {
    if (os === 'macOS') {
      return '/setup-expo-macos.sh';
    } else if (os === 'Windows') {
      return '/setup-expo-windows.ps1';
    }
    return '/setup-expo-macos.sh';
  };

  const getScriptName = () => {
    if (os === 'macOS') {
      return 'setup-expo-macos.sh';
    } else if (os === 'Windows') {
      return 'setup-expo-windows.ps1';
    }
    return 'setup-expo-macos.sh';
  };

  const handleDownload = () => {
    const link = document.createElement('a');
    link.href = getDownloadLink();
    link.download = getScriptName();
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  const scrollToTop = () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  return (
    <footer className="bg-gray-900 text-white">
      {/* CTA Section */}
      <div className="bg-gradient-to-r from-purple-600 to-indigo-600 py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h2 className="text-3xl md:text-4xl font-bold mb-4">
            Ready to Start Building?
          </h2>
          <p className="text-xl text-white/90 mb-8 max-w-2xl mx-auto">
            Download the setup script and start creating mobile apps in minutes
          </p>
          <button
            onClick={handleDownload}
            className="inline-flex items-center gap-2 px-8 py-4 bg-white text-indigo-600 rounded-lg font-semibold text-lg shadow-xl hover:shadow-2xl transform hover:-translate-y-1 transition-all duration-200"
          >
            <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
            </svg>
            Download Setup Script
          </button>
        </div>
      </div>

      {/* Footer Links */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          {/* About */}
          <div>
            <h3 className="text-lg font-bold mb-4">Start React Native</h3>
            <p className="text-gray-400 text-sm leading-relaxed">
              Automated setup scripts to get you building mobile apps with React Native and Expo in minutes.
            </p>
          </div>

          {/* Quick Links */}
          <div>
            <h3 className="text-lg font-bold mb-4">Quick Links</h3>
            <ul className="space-y-2">
              <li>
                <a href="#features" className="text-gray-400 hover:text-white transition-colors text-sm">
                  Features
                </a>
              </li>
              <li>
                <a href="#how-it-works" className="text-gray-400 hover:text-white transition-colors text-sm">
                  How It Works
                </a>
              </li>
              <li>
                <a href="#setup" className="text-gray-400 hover:text-white transition-colors text-sm">
                  Setup Instructions
                </a>
              </li>
              <li>
                <a href="#faq" className="text-gray-400 hover:text-white transition-colors text-sm">
                  FAQ
                </a>
              </li>
            </ul>
          </div>

          {/* Resources */}
          <div>
            <h3 className="text-lg font-bold mb-4">Resources</h3>
            <ul className="space-y-2">
              <li>
                <a href="https://docs.expo.dev/" target="_blank" rel="noopener noreferrer" className="text-gray-400 hover:text-white transition-colors text-sm">
                  Expo Docs
                </a>
              </li>
              <li>
                <a href="https://docs.expo.dev/tutorial/introduction/" target="_blank" rel="noopener noreferrer" className="text-gray-400 hover:text-white transition-colors text-sm">
                  Tutorial
                </a>
              </li>
              <li>
                <a href="https://chat.expo.dev/" target="_blank" rel="noopener noreferrer" className="text-gray-400 hover:text-white transition-colors text-sm">
                  Discord Community
                </a>
              </li>
              <li>
                <a href="https://expo.dev/go" target="_blank" rel="noopener noreferrer" className="text-gray-400 hover:text-white transition-colors text-sm">
                  Expo Go App
                </a>
              </li>
            </ul>
          </div>

          {/* Download */}
          <div>
            <h3 className="text-lg font-bold mb-4">Download</h3>
            <ul className="space-y-2">
              <li>
                <a href="/setup-expo-macos.sh" download className="text-gray-400 hover:text-white transition-colors text-sm">
                  macOS Script
                </a>
              </li>
              <li>
                <a href="/setup-expo-windows.ps1" download className="text-gray-400 hover:text-white transition-colors text-sm">
                  Windows Script
                </a>
              </li>
              <li>
                <a href="https://snack.expo.dev" target="_blank" rel="noopener noreferrer" className="text-gray-400 hover:text-white transition-colors text-sm">
                  Try in Browser
                </a>
              </li>
            </ul>
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="border-t border-gray-800 mt-12 pt-8 flex flex-col md:flex-row justify-between items-center gap-4">
          <p className="text-gray-400 text-sm">
            © {new Date().getFullYear()} Start React Native. All rights reserved.
          </p>
          <button
            onClick={scrollToTop}
            className="flex items-center gap-2 text-gray-400 hover:text-white transition-colors text-sm"
          >
            Back to top
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 10l7-7m0 0l7 7m-7-7v18" />
            </svg>
          </button>
        </div>
      </div>
    </footer>
  );
};

export default Footer;

