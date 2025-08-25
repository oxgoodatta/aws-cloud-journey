import React, { useEffect, useState } from 'react';
import './App.css';

function App() {
  const [message, setMessage] = useState('');

  useEffect(() => {
  fetch('http://localhost:5000/api/hello')
    .then(res => res.json())
    .then(data => {
      console.log("Fetched data:", data);
      setMessage(data.message);
    });
}, []);


  return (
    <div className="App">
      <h1>Frontend + Backend in Kubernetes</h1>
      <p>{message}</p>
    </div>
  );
}

export default App;
