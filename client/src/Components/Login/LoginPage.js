import React,{useEffect,useState} from 'react'

import './loginStyles.css'

function LoginPage({onClick}) {
    const [mobileNo, setMobileNo] = useState("")
    // const [password, setMobileNo] = useState("")
useEffect(()=>{

},[])
    return (
        <div >
            <div >
                
                    <h4 className='my-3 text-center'>Login</h4>
                    <form className='text-start login_form'>

                        <div className='field_container'>
                            <label>Mobile Number</label>
                            <input type='text' name='username' className='input_field' placeholder='Enter Your mobile number' />
                        </div>

                        <div className='field_container'>
                            <label>Password</label>
                            <input type='password' name='password' className='input_field' placeholder='Enter Your Password' />
                        </div>
                        <span className='text-center my-3'>Don't have an account ?<a href='#' className='mx-1 text-decoration-none' style={{ color: "#7F000E" }}>Register here</a></span>
                       
                      <div className='text-center my-4'>
                      <button className='btn btn-danger mx-2'>
                            Submit
                        </button>
                        <button onClick={onClick} className='btn btn-light mx-2'>
                            Cancel
                        </button>
                      </div>
                        

                    </form>
                
            </div>

        </div>
    )
}

export default LoginPage
