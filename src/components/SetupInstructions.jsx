import { useState } from 'react';

const SetupInstructions = () => {
  const [activeTab, setActiveTab] = useState('macos');

  const macOSInstructions = [
    { step: '1', text: 'Download the setup script', code: null },
    { step: '2', text: 'Open Terminal', code: 'Press Cmd+Space, type "Terminal", press Enter' },
    { step: '3', text: 'Navigate to Downloads', code: 'cd ~/Downloads' },
    { step: '4', text: 'Make script executable', code: 'chmod +x setup-expo-macos.sh' },
    { step: '5', text: 'Run the script', code: './setup-expo-macos.sh' },
    { step: '6', text: 'Restart Terminal', code: 'Close and reopen Terminal to apply changes' }
  ];

  const windowsInstructions = [
    { step: '1', text: 'Download the setup script', code: null },
    { step: '2', text: 'Open PowerShell as Administrator', code: 'Press Win+X, select "Windows PowerShell (Admin)"' },
    { step: '3', text: 'Navigate to Downloads', code: 'cd $env:USERPROFILE\\Downloads' },
    { step: '4', text: 'Run the script', code: '.\\setup-expo-windows.ps1' },
    { step: '5', text: 'Restart your computer', code: 'Restart to complete the installation' }
  ];

  const instructions = activeTab === 'macos' ? macOSInstructions : windowsInstructions;

  return (
    <section id="setup" className="py-20 bg-gradient-to-br from-gray-50 to-gray-100">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h2 className="text-4xl md:text-5xl font-bold text-gray-900 mb-4">
            Setup Instructions
          </h2>
          <p className="text-xl text-gray-600">
            Follow these simple steps to get started
          </p>
        </div>

        {/* Tabs */}
        <div className="flex justify-center mb-8">
          <div className="inline-flex rounded-lg bg-white shadow-lg p-1">
            <button
              onClick={() => setActiveTab('macos')}
              className={`px-8 py-3 rounded-lg font-semibold transition-all duration-200 ${
                activeTab === 'macos'
                  ? 'bg-gradient-to-r from-purple-500 to-indigo-500 text-white shadow-md'
                  : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              🍎 macOS
            </button>
            <button
              onClick={() => setActiveTab('windows')}
              className={`px-8 py-3 rounded-lg font-semibold transition-all duration-200 ${
                activeTab === 'windows'
                  ? 'bg-gradient-to-r from-purple-500 to-indigo-500 text-white shadow-md'
                  : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              🪟 Windows
            </button>
          </div>
        </div>

        {/* Instructions */}
        <div className="bg-white rounded-2xl shadow-2xl p-8 md:p-12">
          <div className="space-y-6">
            {instructions.map((instruction, index) => (
              <div key={index} className="flex gap-4">
                <div className="flex-shrink-0">
                  <div className="w-10 h-10 bg-gradient-to-br from-purple-500 to-pink-500 rounded-full flex items-center justify-center text-white font-bold shadow-lg">
                    {instruction.step}
                  </div>
                </div>
                <div className="flex-1">
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">
                    {instruction.text}
                  </h3>
                  {instruction.code && (
                    <div className="bg-gray-900 rounded-lg p-4 overflow-x-auto">
                      <code className="text-green-400 font-mono text-sm">
                        {instruction.code}
                      </code>
                    </div>
                  )}
                </div>
              </div>
            ))}
          </div>

          {/* Warning box */}
          <div className="mt-8 bg-yellow-50 border-l-4 border-yellow-400 p-4 rounded">
            <div className="flex">
              <div className="flex-shrink-0">
                <svg className="h-5 w-5 text-yellow-400" viewBox="0 0 20 20" fill="currentColor">
                  <path fillRule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
                </svg>
              </div>
              <div className="ml-3">
                <p className="text-sm text-yellow-700">
                  <strong>Note:</strong> The setup process may take 10-20 minutes depending on your internet connection.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default SetupInstructions;

