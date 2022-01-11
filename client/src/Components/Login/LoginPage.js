import axios from "axios";
import React, { useEffect, useState } from "react";

import "./loginStyles.css";

function LoginPage({ onClick }) {
  const [mobileNo, setMobileNo] = useState();
  const [password, setPassword] = useState();

  const handleSubmit = () => {
    axios
      .post("/home/login", {
        mobileNo: mobileNo,
        password: password,
      })
      .then((response) => {
        localStorage.setItem("user", response.data.token);
      })
      .catch((error) => {
        console.log(error);
      });
  };
  return (
    <div>
      <div>
        <h4 className="my-3 text-center">Login</h4>
        <form className="text-start login_form">
          <div className="field_container">
            <label>Mobile Number</label>
            <input
              type="text"
              name="username"
              className="input_field"
              placeholder="Enter Your mobile number"
              value={mobileNo}
              onChange={(e) => setMobileNo(e.target.value)}
            />
          </div>

          <div className="field_container">
            <label>Password</label>
            <input
              type="password"
              name="password"
              className="input_field"
              placeholder="Enter Your Password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />
          </div>
          {/* <span className="text-center my-3">
            Don't have an account ?
            <a
              href="#"
              className="mx-1 text-decoration-none"
              style={{ color: "#7F000E" }}
            >
              Register here
            </a>
          </span> */}

          <div className="text-center my-4">
            <button onClick={handleSubmit()} className="btn btn-danger mx-2">
              Submit
            </button>
            <button onClick={onClick} className="btn btn-light mx-2">
              Cancel
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}

export default LoginPage;
