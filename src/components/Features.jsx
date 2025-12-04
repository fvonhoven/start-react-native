const Features = () => {
  const features = [
    {
      icon: '📦',
      title: 'Node.js & npm',
      description: 'Latest LTS version with package manager for dependencies'
    },
    {
      icon: '💻',
      title: 'VS Code',
      description: 'Industry-standard code editor with optimal settings'
    },
    {
      icon: '🚀',
      title: 'Expo CLI',
      description: 'Complete toolchain for React Native development'
    },
    {
      icon: '🔧',
      title: 'Git',
      description: 'Version control system for tracking your code'
    },
    {
      icon: '🔌',
      title: 'Extensions',
      description: 'Essential VS Code extensions pre-configured'
    },
    {
      icon: '📱',
      title: 'Test Project',
      description: 'Sample app ready to run and modify'
    }
  ];

  return (
    <section id="features" className="py-20 bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-16">
          <h2 className="text-4xl md:text-5xl font-bold text-gray-900 mb-4">
            What Gets Installed
          </h2>
          <p className="text-xl text-gray-600 max-w-2xl mx-auto">
            Everything you need for React Native development, configured and ready to go
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {features.map((feature, index) => (
            <div
              key={index}
              className="bg-white rounded-xl p-8 shadow-lg hover:shadow-2xl transform hover:-translate-y-2 transition-all duration-300 border border-gray-100"
            >
              <div className="text-5xl mb-4">{feature.icon}</div>
              <h3 className="text-xl font-bold text-gray-900 mb-2">
                {feature.title}
              </h3>
              <p className="text-gray-600">
                {feature.description}
              </p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default Features;

