import React, { useState, useEffect } from "react";

import {
  
  Modal,
  ModalHeader,
  ModalBody,
  Navbar,
  NavbarBrand,
  NavbarToggler,
  Collapse,
  Nav,
  NavItem,
  NavLink,
  UncontrolledDropdown,
  DropdownToggle,
  DropdownMenu,
  DropdownItem,
  

} from "reactstrap";

import {AiOutlineLogin} from "react-icons/ai"
import {MdPostAdd,MdOutlineEditCalendar,MdOutlineChecklist} from "react-icons/md"
import { FiShoppingCart,FiLogOut,FiUserPlus } from "react-icons/fi";
import {FaUserEdit,FaClipboardList,FaStore,FaWallet,FaListAlt} from "react-icons/fa"
import { IoFastFood } from "react-icons/io5"

import jwt_decode from "jwt-decode";
import "./styles.css";
import LoginPage from "../Login/LoginPage";
import Signupform from "../Register/Signupform";
import { successToast } from "../utils/toast";
import axios from "axios";
import myaxios from "../utils/axios";

function Header() {
  const [loginModal, setloginModal] = useState(false);
  const [signupModal, setsignUpModal] = useState(false);
  const [isOpen, setIsopen] = useState(false)
  const [userType, setUserType] = useState();
  const [balance, setBalance] = useState();

  useEffect(() => {
    if (localStorage.getItem("user")) {
      const user = localStorage.getItem("user");
      const decode = jwt_decode(user);
      setUserType(decode.role);
    }
  });

  const toggle = () => {
    setIsopen(!isOpen)
  }

  const logOut = () => {
    localStorage.removeItem("user");
    localStorage.removeItem("role");
    window.location = "/";
  };

  const menus = () => {
    if (userType === "admin") {
      return (
        <Nav
          className="me-auto"
          navbar
        >
          <UncontrolledDropdown
              inNavbar
              nav
            >
              <DropdownToggle
                caret
                nav
                className="text-white"
              >
                Options
              </DropdownToggle>
              <DropdownMenu right>
                <DropdownItem className="d-flex align-items-center" href="/admin/home">
                  <FaStore className="mx-1"/>
                  <a>Create New Store</a>
                </DropdownItem>
                <DropdownItem className="d-flex align-items-center" href="/admin/addproducts">
                <MdPostAdd className="mx-1"/>
                  <a>Add Products to Store</a>
                </DropdownItem>
                <DropdownItem className="d-flex align-items-center" href="/admin/updatequantity">
                  <MdOutlineEditCalendar className="mx-1"/>
                 <a>Update Product Quantity</a>
                </DropdownItem>
                <DropdownItem className="d-flex align-items-center" href="/admin/updatewallet">
                  <FaWallet className="mx-1"/>
                 <a>Update User Wallet</a>
                </DropdownItem>
                <DropdownItem className="d-flex align-items-center" href="/admin/orders">
                  <FaListAlt className="mx-1"/>
                 <a>Store Orders</a>
                </DropdownItem>
                <DropdownItem className="d-flex align-items-center" href="/admin/orderhistory">
                  <MdOutlineChecklist className="mx-1"/>
                 Order History
                </DropdownItem>
                <DropdownItem divider />
                <DropdownItem className="d-flex align-items-center" onClick={() => logOut()}>
                <FiLogOut className="mx-1"/>
                  <a>Logout</a>
                </DropdownItem>
              </DropdownMenu>
            </UncontrolledDropdown>
        </Nav>
      );
    } else if (userType === "student") {
      const user = localStorage.getItem("user");
      const decode = jwt_decode(user);
      myaxios.post("/getUser", { id: decode.id }).then((response) => {
        setBalance(response.data.balance);
      });
      return (
        <>

          <Nav
            className="me-auto"
            navbar
          >
            <NavItem>
              <NavLink className="text-white" >
                Wallet : <span>&#x20b9; {balance}</span>
              </NavLink>
            </NavItem>

            <UncontrolledDropdown
              inNavbar
              nav
            >
              <DropdownToggle
                caret
                nav
                className="text-white"
              >
                Options
              </DropdownToggle>
              <DropdownMenu right>
                <DropdownItem className="d-flex align-items-center" href="/profile">
                 <FaUserEdit className="mx-1" /> 
                 <a>Profile</a>
                </DropdownItem>
                <DropdownItem className="d-flex align-items-center" href="/order">
                  <FaClipboardList className="mx-1"/>
                  <a>Orders</a>
                </DropdownItem>
                <DropdownItem divider />
                <DropdownItem className="d-flex align-items-center" onClick={() => logOut()}>
                  <FiLogOut className="mx-1"/>
                  <a>Logout</a>
                </DropdownItem>
              </DropdownMenu>
            </UncontrolledDropdown>
          </Nav>
          <a href="/cart">
            <FiShoppingCart className="text-white" size={25} />
          </a>

        </>
      );
    } else {
      return (
        <Nav className="me-auto"
          navbar>
          <NavItem >
            <NavLink className="text-white " onClick={() => setloginModal(true)} >
            <AiOutlineLogin className="mx-1"/>
              Signin
            </NavLink>
          </NavItem>
          <NavItem >
            <NavLink className="text-white " onClick={() => setsignUpModal(true)}>
              <FiUserPlus className="mx-1" />
              Signup
            </NavLink>
          </NavItem>

        </Nav>


      );
    }
  };

  const renderButtons = menus();

  return (
    <div>
      <div>
        {/* Main Header */}


        {/* Signin and Signup Modal */}
        <div>
          {/* Signin Modal */}
          <Modal isOpen={loginModal} toggle={() => setloginModal(false)}>
            <ModalHeader
              className="border-0 "
              toggle={() => setloginModal(false)}
            ></ModalHeader>
            <ModalBody>
              <LoginPage
                signup={() => setsignUpModal(true)}
                onClick={() => setloginModal(false)}
              />
            </ModalBody>
          </Modal>
          {/* Signin Modal */}

          {/* Signup Modal */}
          <Modal
            isOpen={signupModal}

            toggle={() => setsignUpModal(false)}
          >
            <ModalHeader
              className="border-0 "
              toggle={() => setsignUpModal(false)}
            ></ModalHeader>
            <ModalBody>
              <Signupform
                onClick={() => {
                  successToast("clicked");
                  setsignUpModal(false);
                }}
              />
            </ModalBody>
          </Modal>
          {/* Signup Modal */}
        </div>
      </div>
      <div>
        <Navbar
          color="#7f000e"
          expand="md"
          light
          className="py-2"
        >

          <NavbarBrand className="text-white" href="/">
            <div className="d-flex align-items-center justify-content-between mx-2" >
              <IoFastFood size={25} />
              <p className="my-auto h4">Foodie</p>
            </div>

          </NavbarBrand>
          <NavbarToggler onClick={toggle} />
          <Collapse isOpen={isOpen} navbar>

            {renderButtons}
          </Collapse>
        </Navbar>
      </div>
    </div>
  );
}

export default Header;
