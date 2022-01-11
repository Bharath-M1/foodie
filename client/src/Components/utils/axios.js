import axios from "axios";
let apiURL = "http://localhost:5000/home";
let token = localStorage.getItem("user");
const myaxios = axios.create({
  baseURL: apiURL,
  headers: {
    "Content-Type": "application/json",
    authorization: `${token}`,
    // authorization: `Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxYThhMzFkY2E1OTZiMTAzMGEzNWZhMCIsInJvbGUiOiJzdHVkZW50IiwiaWF0IjoxNjM4NDQxNzYxfQ.0Z_wOYlzMH5dPGxsR3IbGHryox3qh96ZEQTz28A8TFg`,
  },
});

export default myaxios;
