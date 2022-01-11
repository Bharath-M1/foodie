import React, { useEffect, useState } from "react";
import { Card, Row, Col } from "reactstrap";
import jwt_decode from "jwt-decode";
import axios from "axios";

function Cart() {
  const [cartData, setCartData] = useState([]);

  useEffect(() => {
    getCart();
  }, []);

  const getCart = () => {
    const loggedUser = localStorage.getItem("user");
    const decodeUser = jwt_decode(loggedUser);

    console.log(decodeUser.id);
    axios
      .post("/getCart", { user: decodeUser.id })
      .then((cart) => {
        // setCartData(cart);
        console.log(cart);
      })
      .catch((err) => {
        console.log(err);
      });
  };

  const removeFromCart = (id) => {};

  const renderProducts =
    cartData.length === 0 ? (
      <h1 className="fw-bold text-center fs-4">Your Cart is Empty</h1>
    ) : (
      cartData.map((product, index) => (
        <Card className="p-2 my-3">
          <Row>
            <Col lg={3}></Col>
            <Col lg={9}>
              <div className="d-flex justify-content-between">
                <h4>{product.productName}</h4>
                <h4
                  style={{
                    color: product.category === "veg" ? "green" : "red",
                  }}
                >
                  {product.category}
                </h4>
                <h4>&#8377; {product.rate}</h4>
              </div>
              <p>
                <span className="fw-bold">Type</span>
                <span className="mx-1">:</span>
                <span>{product.type}</span>
              </p>
              <p>
                <span className="fw-bold">Available Quantity</span>
                <span className="mx-1">:</span>
                <span>{product.quantity}</span>
              </p>
              <p>
                <span className="fw-bold">Varient</span>
                <span className="mx-1">:</span>
                <span>{product.varient}</span>
              </p>
              <p>
                <span className="fw-bold">Ingredients</span>
                <span className="mx-1">:</span>
                <span>
                  {product.ingredients.map((ingredient) => (
                    <span className="mx-1">{ingredient}</span>
                  ))}
                </span>
              </p>
              <button className="btn btn-success mx-1">Order</button>
              <button
                className="btn btn-danger mx-1"
                onClick={() => removeFromCart(product._id)}
              >
                Remove
              </button>
            </Col>
          </Row>
        </Card>
      ))
    );

  return (
    <div className="my-5">
      <h1>CART</h1>
      {renderProducts}
    </div>
  );
}

export default Cart;
