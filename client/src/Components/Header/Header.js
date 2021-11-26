import React, { useState } from 'react'
import { Link } from 'react'
import { Container, Modal, ModalHeader, ModalBody, ModalFooter, Button } from 'reactstrap'
import { FiShoppingCart } from 'react-icons/fi'
import { GiHamburgerMenu } from 'react-icons/gi'

import './styles.css'
import LoginPage from '../Login/LoginPage'
import Signupform from '../Register/Signupform'


function Header() {
    const [loginModal, setloginModal] = useState(false)
    const [signupModal, setsignUpModal] = useState(false)

    return (
        <div>
            {/* Main Header */}
            <div className='navbar'>
                <Container>
                    <div className='nav_logo'>
                        <a href='/' className='logo fw-bold fs-1 text-decoration-none'>Foodie</a>
                    </div>
                    <div className='nav_items'>
                        <a className='nav_link'><FiShoppingCart className='cart_icon' size={25} /></a>
                        <a onClick={() => setloginModal(true)} className='nav_link' >Signin</a>
                        <a onClick={() => setsignUpModal(true)} className='nav_link'>Signup</a>
                    </div>
                </Container>
            </div>

            {/* Mobile Nav Bar */}
            <div className='mobile_nav'>
                <GiHamburgerMenu className='mobile_nav_menu' />
                <h2 className='mobile_nav_logo'>Foodie</h2>
                <GiHamburgerMenu className='sample_menu' />
            </div>


            {/* Signin and Signup Modal */}
            <div>
                {/* Signin Modal */}
                <Modal
                    isOpen={loginModal}

                    toggle={() => setloginModal(false)}
                >
                    <ModalHeader className='border-0 ' toggle={() => setloginModal(false)}>
                    </ModalHeader>
                    <ModalBody>

                        <LoginPage signup={() => setsignUpModal(true)} onClick={() => setloginModal(false)} />
                    </ModalBody>
                </Modal>
                {/* Signin Modal */}

                {/* Signup Modal */}
                <Modal
                    isOpen={signupModal}
                    centered
                    toggle={() => setsignUpModal(false)}
                >
                    <ModalHeader className='border-0 ' toggle={() => setsignUpModal(false)}>
                    </ModalHeader>
                    <ModalBody>
                        <Signupform onClick={()=>setsignUpModal(false)}/>
                    </ModalBody>
                </Modal>
                {/* Signup Modal */}
            </div>

        </div>
    )
}

export default Header

