import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import Header from './Components/Header/Header';
import LoginPage from './Components/Login/LoginPage';
import PageNotFound from './Components/PageNotFound/PageNotFound';

function App() {
  return (
    <Router>
      <Header />
      <Routes>
        <Route exact path='/login' element={<LoginPage />} />
        <Route path="*" element={<PageNotFound />} />

      </Routes>

    </Router>
  );
}

export default App;
