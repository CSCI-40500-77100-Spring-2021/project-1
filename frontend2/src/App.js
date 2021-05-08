import React, {Component} from 'react'
import logo from './logo.svg';
import './App.css';

import NavBar from './Components/NavBar';
import SignInModal from './Components/SignInModal';
import RegisterModal from './Components/RegisterModal';

function App() {
  return (
    <div className="App">
    <NavBar/>
    </div>
  );
}

export default App;
