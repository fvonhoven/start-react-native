import { useState } from 'react';

const FAQ = () => {
  const [openIndex, setOpenIndex] = useState(null);

  const faqs = [
    {
      question: 'Do I need coding experience?',
      answer: 'No! This setup is perfect for beginners. While some programming knowledge helps, Expo and React Native are designed to be beginner-friendly. The setup script gets your environment ready, and you can learn as you build with the extensive tutorials and documentation available.'
    },
    {
      question: 'How long does setup take?',
      answer: 'The automated setup typically takes 10-20 minutes, depending on your internet connection speed. The script handles all downloads and installations automatically, so you can grab a coffee while it works!'
    },
    {
      question: 'Is this free?',
      answer: 'Yes, completely free! All the tools installed (Node.js, VS Code, Expo CLI, Git) are open-source and free to use. Expo also offers a generous free tier that includes everything you need to build and publish apps.'
    },
    {
      question: 'Can I build iOS apps on Windows?',
      answer: 'Yes! With Expo, you can develop iOS apps on Windows. You can test your app using the Expo Go app on a physical iPhone or use Expo\'s cloud build service (EAS Build) to create iOS builds without needing a Mac.'
    },
    {
      question: 'What if something goes wrong?',
      answer: 'The setup script includes error handling and will display helpful messages if issues occur. Common problems are usually related to permissions or existing installations. Check the troubleshooting section in the README, or reach out to the community on Discord for help.'
    },
    {
      question: 'Can I use this for commercial apps?',
      answer: 'Absolutely! All the tools are licensed for commercial use. Many successful apps in the App Store and Google Play are built with React Native and Expo. You own your code and can publish apps freely.'
    }
  ];

  const toggleFAQ = (index) => {
    setOpenIndex(openIndex === index ? null : index);
  };

  return (
    <section id="faq" className="py-20 bg-gray-50">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-16">
          <h2 className="text-4xl md:text-5xl font-bold text-gray-900 mb-4">
            Frequently Asked Questions
          </h2>
          <p className="text-xl text-gray-600">
            Got questions? We've got answers
          </p>
        </div>

        <div className="space-y-4">
          {faqs.map((faq, index) => (
            <div
              key={index}
              className="bg-white rounded-xl shadow-md overflow-hidden transition-all duration-300 hover:shadow-lg"
            >
              <button
                onClick={() => toggleFAQ(index)}
                className="w-full px-6 py-5 text-left flex justify-between items-center gap-4 hover:bg-gray-50 transition-colors"
              >
                <span className="font-semibold text-lg text-gray-900">
                  {faq.question}
                </span>
                <svg
                  className={`w-6 h-6 text-indigo-600 flex-shrink-0 transition-transform duration-300 ${
                    openIndex === index ? 'transform rotate-180' : ''
                  }`}
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                </svg>
              </button>
              <div
                className={`overflow-hidden transition-all duration-300 ${
                  openIndex === index ? 'max-h-96' : 'max-h-0'
                }`}
              >
                <div className="px-6 pb-5 text-gray-600 leading-relaxed">
                  {faq.answer}
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* Still have questions */}
        <div className="mt-12 text-center bg-gradient-to-r from-purple-50 to-indigo-50 rounded-xl p-8 border border-purple-100">
          <h3 className="text-xl font-bold text-gray-900 mb-3">
            Still have questions?
          </h3>
          <p className="text-gray-600 mb-4">
            Join our community and get help from experienced developers
          </p>
          <a
            href="https://chat.expo.dev/"
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center gap-2 px-6 py-3 bg-indigo-600 text-white rounded-lg font-semibold hover:bg-indigo-700 transform hover:-translate-y-1 transition-all duration-200 shadow-lg"
          >
            Join Discord Community
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
            </svg>
          </a>
        </div>
      </div>
    </section>
  );
};

export default FAQ;

