const Resources = () => {
  const resources = [
    {
      title: 'Expo Documentation',
      description: 'Complete guides and API references for Expo and React Native',
      icon: '📚',
      link: 'https://docs.expo.dev/',
      color: 'from-blue-500 to-cyan-500'
    },
    {
      title: 'Expo Tutorial',
      description: 'Step-by-step tutorial to build your first app from scratch',
      icon: '🎓',
      link: 'https://docs.expo.dev/tutorial/introduction/',
      color: 'from-purple-500 to-pink-500'
    },
    {
      title: 'Community Discord',
      description: 'Join thousands of developers, ask questions, get help',
      icon: '💬',
      link: 'https://chat.expo.dev/',
      color: 'from-green-500 to-emerald-500'
    },
    {
      title: 'Expo Go App',
      description: 'Download the app to test your projects on real devices',
      icon: '📱',
      link: 'https://expo.dev/go',
      color: 'from-orange-500 to-red-500'
    }
  ];

  return (
    <section id="resources" className="py-20 bg-white">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-16">
          <h2 className="text-4xl md:text-5xl font-bold text-gray-900 mb-4">
            Learning Resources
          </h2>
          <p className="text-xl text-gray-600 max-w-2xl mx-auto">
            Everything you need to become a React Native developer
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          {resources.map((resource, index) => (
            <a
              key={index}
              href={resource.link}
              target="_blank"
              rel="noopener noreferrer"
              className="group bg-white rounded-xl p-8 shadow-lg hover:shadow-2xl transform hover:-translate-y-2 transition-all duration-300 border border-gray-100"
            >
              <div className="flex items-start gap-4">
                <div className={`flex-shrink-0 w-16 h-16 bg-gradient-to-br ${resource.color} rounded-xl flex items-center justify-center text-3xl shadow-lg group-hover:scale-110 transition-transform duration-300`}>
                  {resource.icon}
                </div>
                <div className="flex-1">
                  <h3 className="text-xl font-bold text-gray-900 mb-2 group-hover:text-indigo-600 transition-colors">
                    {resource.title}
                    <svg className="inline-block w-5 h-5 ml-2 opacity-0 group-hover:opacity-100 transition-opacity" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                    </svg>
                  </h3>
                  <p className="text-gray-600">
                    {resource.description}
                  </p>
                </div>
              </div>
            </a>
          ))}
        </div>

        {/* Additional help section */}
        <div className="mt-16 bg-gradient-to-r from-indigo-50 to-purple-50 rounded-2xl p-8 text-center border border-indigo-100">
          <h3 className="text-2xl font-bold text-gray-900 mb-3">
            Need More Help?
          </h3>
          <p className="text-gray-600 mb-6 max-w-2xl mx-auto">
            The React Native and Expo communities are incredibly welcoming to beginners. Don't hesitate to ask questions!
          </p>
          <div className="flex flex-wrap justify-center gap-4">
            <a
              href="https://stackoverflow.com/questions/tagged/expo"
              target="_blank"
              rel="noopener noreferrer"
              className="px-6 py-3 bg-white text-gray-700 rounded-lg font-semibold shadow hover:shadow-lg transform hover:-translate-y-1 transition-all duration-200"
            >
              Stack Overflow
            </a>
            <a
              href="https://github.com/expo/expo/discussions"
              target="_blank"
              rel="noopener noreferrer"
              className="px-6 py-3 bg-white text-gray-700 rounded-lg font-semibold shadow hover:shadow-lg transform hover:-translate-y-1 transition-all duration-200"
            >
              GitHub Discussions
            </a>
            <a
              href="https://www.reddit.com/r/reactnative/"
              target="_blank"
              rel="noopener noreferrer"
              className="px-6 py-3 bg-white text-gray-700 rounded-lg font-semibold shadow hover:shadow-lg transform hover:-translate-y-1 transition-all duration-200"
            >
              Reddit Community
            </a>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Resources;

