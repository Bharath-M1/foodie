import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import {Container} from 'reactstrap'
import AdminHeader from './Components/Admin/adminHeader';
import Header from './Components/Header/Header';
import HomePage from './Components/HomePage/HomePage';
import LoginPage from './Components/Login/LoginPage';
import PageNotFound from './Components/PageNotFound/PageNotFound';
import 'bootstrap/dist/css/bootstrap.min.css';
import StoreDetails from './Components/Stores.js/StoreDetails';
import Footer from './Components/Footer/Footer';

function App() {
  return (
    <Router>
      <Header/>
      {/* <AdminHeader/> */}
      <Container>
      <Routes>
        <Route path='/' element={<HomePage/>}/>
        <Route path="*" element={<PageNotFound />} />
        <Route exact path='/stores/:id' element={<StoreDetails/>} />
      </Routes>
      </Container>
<Footer/>
    </Router>
  );
}

export default App;
