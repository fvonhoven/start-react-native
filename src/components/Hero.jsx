import { useState, useEffect } from "react"

const Hero = () => {
  const [os, setOs] = useState("")

  useEffect(() => {
    const detectOS = () => {
      const userAgent = window.navigator.userAgent.toLowerCase()
      if (userAgent.indexOf("mac") !== -1) {
        return "macOS"
      } else if (userAgent.indexOf("win") !== -1) {
        return "Windows"
      }
      return "Unknown"
    }
    setOs(detectOS())
  }, [])

  const getDownloadLink = () => {
    if (os === "macOS") {
      return "/setup-expo-macos.sh"
    } else if (os === "Windows") {
      return "/setup-expo-windows.ps1"
    }
    return "/setup-expo-macos.sh" // default
  }

  const getScriptName = () => {
    if (os === "macOS") {
      return "setup-expo-macos.sh"
    } else if (os === "Windows") {
      return "setup-expo-windows.ps1"
    }
    return "setup-expo-macos.sh"
  }

  const handleDownload = () => {
    const link = document.createElement("a")
    link.href = getDownloadLink()
    link.download = getScriptName()
    document.body.appendChild(link)
    link.click()
    document.body.removeChild(link)
  }

  return (
    <section className="relative min-h-screen flex items-center justify-center overflow-hidden bg-gradient-to-br from-purple-600 via-indigo-600 to-pink-500">
      {/* Animated background elements */}
      <div className="absolute inset-0 overflow-hidden">
        <div className="absolute -top-40 -right-40 w-80 h-80 bg-purple-400 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob"></div>
        <div className="absolute -bottom-40 -left-40 w-80 h-80 bg-pink-400 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob animation-delay-2000"></div>
        <div className="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-80 h-80 bg-indigo-400 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob animation-delay-4000"></div>
      </div>

      <div className="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20 text-center">
        <h1 className="text-5xl md:text-7xl font-bold text-white mb-6 leading-tight">
          Build Mobile Apps
          <br />
          <span className="bg-clip-text text-transparent bg-gradient-to-r from-yellow-200 to-pink-200">in Minutes</span>
        </h1>

        <p className="text-xl md:text-2xl text-white/90 mb-12 max-w-3xl mx-auto">
          Automated setup gets you from zero to building iOS & Android apps in one click
        </p>

        {/* CTA Buttons */}
        <div className="flex flex-col sm:flex-row gap-4 justify-center items-center mb-8">
          <button
            onClick={handleDownload}
            className="group relative px-8 py-4 bg-white text-indigo-600 rounded-lg font-semibold text-lg shadow-xl hover:shadow-2xl transform hover:-translate-y-1 transition-all duration-200 flex items-center gap-2"
          >
            <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
            </svg>
            Download Setup Script
          </button>

          <a
            href="https://snack.expo.dev"
            target="_blank"
            rel="noopener noreferrer"
            className="px-8 py-4 bg-white/10 backdrop-blur-lg text-white rounded-lg font-semibold text-lg border-2 border-white/30 hover:bg-white/20 transform hover:-translate-y-1 transition-all duration-200"
          >
            Try in Browser
          </a>
        </div>

        {/* OS Detection */}
        {os && os !== "Unknown" && (
          <p className="text-white/80 text-sm mb-12">
            Detected: <span className="font-semibold">{os}</span>
          </p>
        )}

        {/* Stats */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-4xl mx-auto mt-16">
          <div className="glass rounded-xl p-6 transform hover:scale-105 transition-transform duration-200">
            <div className="text-4xl font-bold text-white mb-2">~15 min</div>
            <div className="text-white/80">Setup Time</div>
          </div>
          <div className="glass rounded-xl p-6 transform hover:scale-105 transition-transform duration-200">
            <div className="text-4xl font-bold text-white mb-2">Zero</div>
            <div className="text-white/80">Manual Steps</div>
          </div>
          <div className="glass rounded-xl p-6 transform hover:scale-105 transition-transform duration-200">
            <div className="text-4xl font-bold text-white mb-2">100%</div>
            <div className="text-white/80">Automated</div>
          </div>
        </div>

        {/* Scroll indicator */}
        <div className="absolute bottom-8 left-1/2 transform -translate-x-1/2 animate-bounce">
          <svg className="w-6 h-6 text-white/60" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 14l-7 7m0 0l-7-7m7 7V3" />
          </svg>
        </div>
      </div>
    </section>
  )
}

export default Hero
