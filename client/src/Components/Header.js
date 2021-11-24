import React from 'react'
import { Container } from 'reactstrap'
import { FiShoppingCart } from 'react-icons/fi'
import { GiHamburgerMenu } from 'react-icons/gi'

import './styles.css'

function Header() {
    return (
        <div>
            <div className='navbar'>
                <Container>
                    <div className='nav_logo'>
                        <h1 className='logo'>RVS Canteen</h1>
                    </div>
                    <div className='nav_items'>
                        <a className='nav_link'><FiShoppingCart className='cart_icon' size={25} /></a>
                        <a href='/login' className='nav_link' >Signin</a>
                        <a className='nav_link'>Signup</a>
                    </div>
                </Container>
            </div>
            <div className='mobile_nav'>
                <GiHamburgerMenu className='mobile_nav_menu'/>
                <h2 className='mobile_nav_logo'>RVS CANTEEN</h2>
                <GiHamburgerMenu className='sample_menu'/>
            </div>
        </div>
    )
}

export default Header

