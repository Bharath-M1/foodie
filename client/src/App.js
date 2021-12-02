import 'bootstrap/dist/css/bootstrap.min.css';
import 'react-toastify/dist/ReactToastify.css';
import { ToastContainer, toast, cssTransition } from 'react-toastify';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import { Container } from 'reactstrap'
import AdminHeader from './Components/Admin/header/AdminHeader'
import Header from './Components/Header/Header';
import HomePage from './Components/HomePage/HomePage';
import LoginPage from './Components/Login/LoginPage';
import PageNotFound from './Components/PageNotFound/PageNotFound';
import StoreDetails from './Components/Stores.js/StoreDetails';
import Footer from './Components/Footer/Footer';

function App() {
  const bounce = cssTransition({
    enter: 'animate__animated animate__bounceIn',
    exit: 'animate__animated animate__bounceOut',
  });

  const User = ({ match }) => {

  }


  const Admin = ({ match }) => {

  }
  const Store = ({ match }) => {

  }
  return (
    <div>
      <Router>
        <Header />
        {/* <AdminHeader/> */}
        <Container>
          <Routes>
            <Route path='/' element={<HomePage />} />
            <Route path="*" element={<PageNotFound />} />
            <Route exact path='/stores/:id' element={<StoreDetails />} />
            <Route exact path='/user' element={<User />} />
            {
              !localStorage.getItem("role") == "student" && <Route exact path='/admin' element={<Admin />} />
            }

            <Route exact path='/store' element={<Store />} />
          </Routes>
        </Container>
        <Footer />
      </Router>
      <ToastContainer transition={bounce} />
    </div>
  );
}

export default App;
