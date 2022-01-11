import axios from "../utils/axios";
import React, { useState, useEffect } from "react";
import jwt_decode from "jwt-decode";
import { useParams } from "react-router-dom";
import { Row, Col, Card, Toast } from "reactstrap";
import { successToast } from "../utils/toast";

function StoreDetails() {
  const { id } = useParams();
  const [store, setStore] = useState({});
  const [products, setProducts] = useState([]);
  const [cart, setCart] = useState([]);
  const [user, setUser] = useState();
  // console.log(storeId, id, "this");

  useEffect(() => {
    // console.log("hai");
    axios
      .get(`/getProductsfromSingleStore/${id}`)
      .then((response) => {
        console.log(response.data);
        setProducts(response.data);
      })
      .catch((err) => {
        console.log(err);
      });

    getStore();
  }, []);

  const getStore = () => {
    console.log("Hello");
    const loggedUser = localStorage.getItem("user");
    const decodeUser = jwt_decode(loggedUser);
    setUser(decodeUser.id);
    axios
      .post("/getOne", {
        id,
      })
      .then((response) => {
        console.log(response.data);
        setStore(response.data);
      })
      .catch((err) => console.log(err));
  };

  const addToCart = (product) => {
    console.log(product);
    axios
      .post("/cart", { user: user, product: product._id })
      .then((response) => {
        console.log(response);
        successToast(response.data);
      })
      .catch((err) => {
        console.log(err);
      });
  };

  const renderProducts = products.map((product) => (
    <Card className="my-4 p-4">
      <Row>
        <Col lg={4}></Col>
        <Col lg={8}>
          <div className="d-flex justify-content-between">
            <h4>{product.productName}</h4>
            <h4 style={{ color: product.category === "veg" ? "green" : "red" }}>
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
          <button className="btn w-5 mx-1 bg-success text-white">Order</button>
          <button
            onClick={() => addToCart(product)}
            className="btn w-5 mx-1 bg-primary text-white"
          >
            Add to Cart
          </button>
        </Col>
      </Row>
    </Card>
  ));

  return (
    <div>
      <div className="bg-dark p-5">
        <h2 className="text-white text-center">{store.storeName}</h2>
        <div className="d-flex text-white justify-content-between float-start fw-bold fs-4">
          <p className="mx-1">Seating</p>
          <p className="mx-1">:</p>
          <p className="mx-1">{store.seating}</p>
        </div>
        <span className="clearfix"></span>
      </div>
      <div>{renderProducts}</div>
    </div>
  );
}

export default StoreDetails;
