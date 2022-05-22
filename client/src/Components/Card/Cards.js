import React from "react";
import {IoStorefront} from "react-icons/io5"
import { Card, CardImg, CardTitle, Button, CardBody } from "reactstrap";

function Cards({ title, children }) {
 
  return (
    <div className="my-5">
      <Card className="shadow p-3" style={{backgroundColor:"#FDDB93"}}>
        <div className="text-center" >
            <h5 className=" fw-bold fst-italic text-capitalize">{title}</h5>
            <IoStorefront color="#FF5001" size={50} />
        </div>
        <CardBody>
          {children}
        </CardBody>
      </Card>
    </div>
  );
}

export default Cards;
