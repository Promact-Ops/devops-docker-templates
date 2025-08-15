'use client';

import { useState, useEffect } from 'react';

export default function Home() {
  const [apiResponse, setApiResponse] = useState<string>('');
  const [loading, setLoading] = useState<boolean>(false);

  const testApi = async () => {
    setLoading(true);
    try {
      const response = await fetch('/api/test');
      const data = await response.json();
      setApiResponse(data.message);
    } catch (error) {
      setApiResponse('Error: Could not connect to API');
    } finally {
      setLoading(false);
    }
  };

  return (
    <main className="min-h-screen">
      <div className="hero">
        <div className="container">
          <h1 className="text-4xl font-bold mb-4">
            Next.js Node.js Docker App
          </h1>
          <p className="text-xl">
            Promact Reusability Initiative - next.js build using docker
          </p>
        </div>
      </div>

      <div className="container py-8">
        <div className="card">
          <h2 className="text-2xl font-semibold mb-4">API Test</h2>
          <button 
            onClick={testApi} 
            disabled={loading}
            className="button"
          >
            {loading ? 'Testing...' : 'Test API'}
          </button>
          
          {apiResponse && (
            <div className="mt-4 p-4 bg-gray-100 rounded">
              <strong>API Response:</strong> {apiResponse}
            </div>
          )}
        </div>

        <div className="card">
          <h2 className="text-2xl font-semibold mb-4">Features</h2>
          <ul className="space-y-2">
            <li>✅ Next.js 14 with App Router</li>
            <li>✅ TypeScript support</li>
            <li>✅ Node.js backend</li>
            <li>✅ Docker containerization</li>
            <li>✅ Modern UI with responsive design</li>
            <li>✅ API endpoint at /api/test</li>
          </ul>
        </div>

        <div className="card">
          <h2 className="text-2xl font-semibold mb-4">Getting Started</h2>
          <div className="space-y-2">
            <p><strong>Development:</strong> npm run dev</p>
            <p><strong>Build:</strong> npm run build</p>
            <p><strong>Start:</strong> npm run start</p>
            <p><strong>Docker:</strong> docker build -t nextjs-app .</p>
          </div>
        </div>
      </div>
    </main>
  );
}
