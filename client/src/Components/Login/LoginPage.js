import React from 'react'
import { Card } from 'reactstrap'
import './loginStyles.css'

function LoginPage() {
    return (
        <div >
            <div className='login_card'>
                <Card >
                    <h4 className='my-3 text-center'>Login</h4>
                    <form className='text-start login_form'>

                        <div className='field_container'>
                            <label>Username</label>
                            <input type='text' name='username' className='input_field' placeholder='Enter Your username' />
                        </div>

                        <div className='field_container'>
                            <label>Password</label>
                            <input type='password' name='password' className='input_field' placeholder='Enter Your Password' />
                        </div>

                        <span className='text-center my-3'>Don't have an account ?<a href='#' className='mx-1 text-decoration-none' style={{ color: "#7F000E" }}>Register here</a></span>
                        <button className='submit_btn'>
                            Submit
                        </button>
                    </form>
                </Card>
            </div>

        </div>
    )
}

export default LoginPage
