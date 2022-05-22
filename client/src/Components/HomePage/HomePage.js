import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import {AiFillHeart} from "react-icons/ai"
import {IoFastFood} from "react-icons/io5"

import { MdEventSeat,MdEmojiFoodBeverage } from "react-icons/md";
import { Row, Col, Container } from "reactstrap";
import Cards from "../Card/Cards";
import axios from "axios";

function HomePage() {
  const [stores, setStores] = useState([]);

  useEffect(() => {
    axios
      .get("http://localhost:5000/home/store")
      .then((response) => {

        setStores(response.data);
      })
      .catch((err) => {
        console.log(err);
      });
  }, []);

  const renderCards = (
    <>
      <Container>
        <Row>
          {stores.map((store, index) => (
            <Col lg={4} md={6} sm={12} xs={12} className="my-3">
          
                <Cards title={store.storeName}>
                  <div className="d-flex align-items-center justify-content-between">  
                    <p >
                      <span><MdEventSeat size={20}/></span>
                      <span className="fw-bold mx-1" >{store.seating}</span>
                      <span className="fst-italic fw-bold">nos</span>
                    </p>
                    
                    
                    <p>
                      {
                        !localStorage.getItem("user") ?<a onClick={()=>alert("Please Login")} className="text-primary text-decoration-none fw-bold">Know More </a> :<Link to={`/stores/${store._id}`}  className="text-primary text-decoration-none fw-bold">Know more </Link>
                      }
                      
                    </p>
                      
                  </div>
                  <div className="d-flex align-items-center justify-content-center" >
                        <AiFillHeart className="mx-2 " color={"#FF0000"} size={25}/>
                        <IoFastFood className="mx-2" color={"#228C22"} size={25}/>
                        <MdEmojiFoodBeverage color={"#964B00"} className="mx-2" size={25}/>
                      </div>
                </Cards>
             
            </Col>
          ))}
        </Row>
      </Container>
    </>
  );

  return <div>{renderCards}</div>;
}

export default HomePage;
