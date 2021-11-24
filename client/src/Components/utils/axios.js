import axios from 'axios'
let apiURL = 'http://localhost:5000/home';
let token = localStorage.getItem('token')
const myaxios = axios.create({
  baseURL: apiURL,
  headers: {
    'Content-Type': 'application/json',
    'authorization': `Bearer ${token}`
  }
})


export default myaxios;