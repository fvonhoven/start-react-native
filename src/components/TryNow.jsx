const TryNow = () => {
  return (
    <section id="try-now" className="py-20 bg-gradient-to-br from-purple-600 via-indigo-600 to-pink-500">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h2 className="text-4xl md:text-5xl font-bold text-white mb-4">
            Try in Browser
          </h2>
          <p className="text-xl text-white/90 max-w-2xl mx-auto">
            Don't want to install anything yet? Start coding immediately with Expo Snack
          </p>
        </div>

        <div className="bg-white/10 backdrop-blur-lg rounded-2xl p-8 md:p-12 border border-white/20 max-w-4xl mx-auto">
          <div className="grid md:grid-cols-2 gap-8 items-center">
            <div>
              <h3 className="text-2xl font-bold text-white mb-4">
                Expo Snack
              </h3>
              <p className="text-white/90 mb-6 leading-relaxed">
                Expo Snack is an online playground where you can write React Native code and see it running instantly on your phone or in the browser. Perfect for:
              </p>
              <ul className="space-y-3 mb-6">
                <li className="flex items-start gap-3 text-white/90">
                  <svg className="w-6 h-6 text-green-300 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                  </svg>
                  <span>Testing ideas quickly</span>
                </li>
                <li className="flex items-start gap-3 text-white/90">
                  <svg className="w-6 h-6 text-green-300 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                  </svg>
                  <span>Learning React Native basics</span>
                </li>
                <li className="flex items-start gap-3 text-white/90">
                  <svg className="w-6 h-6 text-green-300 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                  </svg>
                  <span>Sharing code examples</span>
                </li>
              </ul>
              <a
                href="https://snack.expo.dev"
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 px-8 py-4 bg-white text-indigo-600 rounded-lg font-semibold text-lg shadow-xl hover:shadow-2xl transform hover:-translate-y-1 transition-all duration-200"
              >
                Open Expo Snack
                <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                </svg>
              </a>
            </div>

            <div className="bg-white/5 rounded-xl p-6 border border-white/10">
              <div className="bg-gray-900 rounded-lg p-4 mb-4">
                <div className="flex gap-2 mb-3">
                  <div className="w-3 h-3 rounded-full bg-red-400"></div>
                  <div className="w-3 h-3 rounded-full bg-yellow-400"></div>
                  <div className="w-3 h-3 rounded-full bg-green-400"></div>
                </div>
                <pre className="text-green-400 font-mono text-sm overflow-x-auto">
                  <code>{`import { Text, View } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <Text style={styles.text}>
        Hello, World! 👋
      </Text>
    </View>
  );
}`}</code>
                </pre>
              </div>
              <p className="text-white/70 text-sm text-center">
                Write code, see results instantly
              </p>
            </div>
          </div>
        </div>

        <div className="mt-12 text-center">
          <p className="text-white/80 text-lg">
            Want the full development environment?{' '}
            <a href="#setup" className="font-semibold underline hover:text-white transition-colors">
              Download the setup script
            </a>
          </p>
        </div>
      </div>
    </section>
  );
};

export default TryNow;

