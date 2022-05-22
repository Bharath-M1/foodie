import React, { useEffect, useState } from "react";
import myaxios from "../utils/axios";
import { MdDelete, MdEdit } from "react-icons/md";
import { Card, Row, Col } from "reactstrap";
import { errorToast, successToast } from "../utils/toast";

function AddProducts() {
  const [stores, setStores] = useState([]);
  const [store, setStore] = useState();
  const [products, setProducts] = useState([]);
  const [product, setProduct] = useState();
  const [quantity, setQuantity] = useState();
  const [varient, setVarient] = useState();
  const [type, setType] = useState();
  const [category, setCategory] = useState();
  const [rate, setRate] = useState();

  useEffect(() => {
    myaxios
      .get("/store")
      .then((response) => {
        setStores(response.data);
      })
      .catch((err) => {
        console.log(err);
      });
  }, []);

  const handleSubmit = (event) => {
    event.preventDefault();
    myaxios
      .post("/product", {
        name: product,
        store: store,
        quantity: quantity,
        type: type,
        varient: varient,
        category: category,
        rate: rate,
      })
      .then((response) => {
        console.log(response.data);
        if (response.data.msg === "Product Added") {
          successToast("Product Added");
          setTimeout(() => {
            window.location = "/admin/addproducts";
          }, 1000);
        }

        if (response.data.msg === "problem while creating the product") {
          errorToast("Problem in creating the product");
          setTimeout(() => {
            window.location = "/admin/addproducts";
          }, 1000);
        }
      })
      .catch((err) => {
        console.log(err);
      });
  };

  const getProducts = (id) => {
    setStore(id);
    myaxios
      .get(`/getProductsfromSingleStore/${id}`)
      .then((response) => {
        setProducts(response.data);
      })
      .catch((err) => {
        alert("Bad Request Try again later");
      });
  };

  const deleteProduct = (id) => {
    myaxios.delete(`/product/${id}`).then((response) => {
      if (response.data === "Product Deleted") {
        errorToast("Product Deleted");
        setTimeout(() => {
          window.location = "/admin/addproducts";
        }, 1000);
      }
    });
  };

  
  const renderStores = stores.map((value) => (
    <option value={value._id}>{value.storeName}</option>
  ));

  const renderStor = products.map((product) => (
    <tr>
      <Card className="p-3 my-2 rounded-lg shadow w-lg-25 w-md-50 w-100 ">
        <Row>
          <Col lg={4} md={4} sm={12}>
            <h6 className="w-3">{product.productName}</h6>
          </Col>
          <Col lg={4} md={4} sm={12} className="text-lg-center">
            <div className="w-5 align-self-center">
              <MdDelete onClick={()=>deleteProduct(product._id)}/>
            </div>
          </Col>
          <Col lg={4} md={4} sm={0} className="text-lg-center">
            <div>
              <MdEdit />
            </div>
          </Col>
        </Row>
      </Card>
    </tr>
  ));

  return (
    <div className="my-5 mx-5 p-4">
      <Card className="pb-5 p-3 shadow ">
        <Row>
          <Col lg={6}>
            <div className="my-5 mx-5 p-4">
              <h5 className="text-center h3 my-1">ADD PRODUCTS</h5>
              <Card className="border-0">
              <form className="mx-auto"> 
                <div className="my-3">
                  <label className="d-block fw-bold my-1">Store Name</label>
                  <select
                    className="form-control"
                    name="store"
                    placeholder="Select Store"
                    defaultValue={store}
                    onChange={(e) => getProducts(e.target.value)}
                    required
                  >
                    <option> </option>
                    {renderStores}
                  </select>
                </div>
                <div className="my-3">
                  <label className="d-block fw-bold my-1">Product Name</label>
                  <input
                    type="text"
                    className="form-control"
                    name="product"
                    value={product}
                    onChange={(e) => setProduct(e.target.value)}
                    required
                  />
                </div>
                <div className="my-3">
                  <label className="d-block fw-bold my-1">Type</label>
                  <select
                    className="form-control"
                    value={type}
                    onChange={(e) => setType(e.target.value)}
                    name="type"
                  >
                    <option> </option>
                    <option value="Eatables">Eatables</option>
                    <option value="drinks">drinks</option>
                  </select>
                </div>
                <div className="my-3">
                  <label className="d-block fw-bold my-1">Quantity</label>
                  <input
                    type="number"
                    className="form-control"
                    name="quantity"
                    value={quantity}
                    onChange={(e) => setQuantity(e.target.value)}
                    required
                  />
                </div>
                <div className="my-3">
                  <label className="d-block fw-bold my-1">Varient</label>
                  <select
                    className="form-control"
                    value={varient}
                    onChange={(e) => setVarient(e.target.value)}
                    name="varient"
                  >
                    <option> </option>
                    <option value="Hot">Hot</option>
                    <option value="Cold">Cold</option>
                  </select>
                  
                </div>
                <div className="my-3">
                  <label className="d-block fw-bold my-1">Category</label>
                  <select
                    className="form-control"
                    value={category}
                    onChange={(e) => setCategory(e.target.value)}
                    name="category"
                  >
                    <option> </option>
                    <option value="veg">Veg</option>
                    <option value="non-veg">Non-Veg</option>
                  </select>
                </div>
                <div className="my-3">
                  <label className="d-block fw-bold my-1">Rate</label>
                  <input
                    type="number"
                    value={rate}
                    className="form-control"
                    onChange={(e) => setRate(e.target.value)}
                    name="rate"
                  />
                </div>
                <button
                  className="btn bg-primary text-white fw-bold my-3"
                  onClick={(e) => handleSubmit(e)}
                >
                  Create Product
                </button>
              </form>
              </Card>
            </div>
          </Col>
          <Col lg={6} className="p-4">
            <h5 className="mx-3">Products</h5>
            <table style={{ width: "100%", height: "50%" }}>{products.length===0?<div className="text-center"><img  src="/images/empty.png"/><p className="text-center">No Products in this store</p></div>:renderStor}</table>
          </Col>
        </Row>
      </Card>
    </div>
  );
}

export default AddProducts;
