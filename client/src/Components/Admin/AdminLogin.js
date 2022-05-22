import React,{useState} from "react";
import axios from "axios"
import jwt_decode from "jwt-decode"
import { Card } from "reactstrap";
import {RiAdminFill} from 'react-icons/ri'

function AdminLogin() {
    const [mobileno,setMobileNo]=useState();
    const [password,setPassword]=useState();

    const handleSubmit = (event) => {
        event.preventDefault();
        
        if (mobileno === null||mobileno === undefined || password === null||password ===undefined) {
          alert("Fill out all the fields");
        } else {
          axios
            .post("http://localhost:5000/home/login", {
              mobileNo: mobileno,
              password: password,
            })
            .then((response) => {
              
              if (
                response.data.message === "In correct Password" ||
                response.data.message === "Username not Found"
              ) {
                alert("Incorrect Username or Password");
              } else {
                var user=response.data.data
               
                if (user.role === "student") {
                  alert("Incorrect Username or password");         
                } else {
                  localStorage.setItem("user", response.data.token);
                  const loggedUser = localStorage.getItem("user");
                  const decodeUser = jwt_decode(loggedUser);
                  localStorage.setItem("role", decodeUser.role);
                  window.location="/admin/home"
      
                }
              }
            })
            .catch((error) => {
              console.log(error);
            });
        }
      };
  return (
    <div className="d-flex align-items-center justify-content-center  my-5 " >
      <Card className="p-lg-5 p-md-5 p-3  shadow">
        <div>
            <div className="d-flex justify-content-center align-items-center my-2">
                <RiAdminFill className="mx-1" size={25}/>
                <h4 className="my-1">Admin Login</h4>
            </div>
          
          <form >
            <div className="form-group">
              <label className="my-2">Mobile Number</label>
              <input
                type="text"
                name="username"
                className="form-control my-2"
                placeholder="Enter Your mobile number"
                  value={mobileno}
                  onChange={(e) => {
                    setMobileNo(e.target.value);
                  }}
              />
            </div>

            <div className="form-group ">
              <label className="my-2">Password</label>
              <input
                type="password"
                name="password"
                className="form-control my-2"
                placeholder="Enter Your Password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
              />
            </div>

            <div className=" my-4 text-center">
              <button
                  onClick={(e) => handleSubmit(e)}
                className="btn btn-danger mx-2"
              >
                Submit
              </button>
              <button
                onClick={()=>{setMobileNo("");setPassword("")}}
                className="btn btn-light mx-2"
              >
                Cancel
              </button>
            </div>
          </form>
        </div>
      </Card>
    </div>
  );
}

export default AdminLogin;
