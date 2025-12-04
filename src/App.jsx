import Hero from "./components/Hero"
import Features from "./components/Features"
import HowItWorks from "./components/HowItWorks"
import SetupInstructions from "./components/SetupInstructions"
import TryNow from "./components/TryNow"
import Resources from "./components/Resources"
import FAQ from "./components/FAQ"
import Footer from "./components/Footer"

function App() {
  return (
    <div className="min-h-screen">
      <Hero />
      <Features />
      <HowItWorks />
      <SetupInstructions />
      <TryNow />
      <Resources />
      <FAQ />
      <Footer />
    </div>
  )
}

export default App
