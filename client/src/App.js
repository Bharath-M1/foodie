import {BrowserRouter as Router,Routes,Route} from 'react-router-dom'
import Header from './Components/Header';
import LoginPage from './App/Login/LoginPage';

function App() {
  return (
    <Router>
      <Header/>
      <Routes>
      <Route exact path='/login' element={<LoginPage/>} />
      </Routes>
      
    </Router>
  );
}

export default App;
