import React, { useEffect, useState } from "react";
import { Card } from "reactstrap";
import myaxios from "../utils/axios";
import { successToast } from "../utils/toast";
import Sidebar from "./Sidebar/Sidebar";

function Orders() {
  const [stores, setStores] = useState([]);
  const [orders, setOrders] = useState([]);
  const [store, setStore] = useState();

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

  const handleOrders = (id) => {
    console.log(id);
    myaxios
      .post("/getstoreorders", { id: id })
      .then((response) => {
        setOrders(response.data);
        console.log(response.data);
      })
      .catch((err) => {
        console.log(err);
      });
  };

  const handleStatus = (event, id) => {
    if (event.target.checked) {
      console.log(id);
      myaxios.put("/order", { id: id }).then((response) => {
        if (response.data === "Order Delivered") {
          successToast("Order Delivered");
        }
      });
    }
  };

  const renderStores = stores.map((value) => (
    <option value={value._id}>{value.storeName}</option>
  ));

  const renderCards = orders.map((order) =>
    order.status === "not_delivered" ? (
      <Card className="my-2 p-3">
        <p>
          <span className="fw-bold">Order ID</span>
          <span className="mx-1">:</span>
          <span>{order.orderId}</span>
        </p>
        <div className="d-flex justify-content-between">
          <h3>{order.products[0].productId.productName}</h3>
          <h5>&#8377; {order.billvalue}</h5>
        </div>
        <p>
          <span className="fw-bold">Store</span>
          <span className="mx-1">:</span>
          <span>{order.storeId.storeName}</span>
        </p>
        <p>
          <span className="fw-bold">Ordered by</span>
          <span className="mx-1">:</span>
          <span>{order.userId.name}</span>
        </p>

        <div class="form-check">
          <input
            class="form-check-input"
            type="checkbox"
            value="delivered"
            onClick={(e) => handleStatus(e, order._id)}
          />
          <label class="form-check-label" for="flexCheckDefault">
            Delivered
          </label>
        </div>
      </Card>
    ) : (
      "No Pending Orders"
    )
  );
  return (
    <Sidebar>
      <div className="my-5 mx-5 p-4">
        <h5>ORDER DELIVERY</h5>
        <div className="d-flex justify-content-between">
          <select
            className="form-control"
            name="store"
            defaultValue={store}
            onChange={(e) => handleOrders(e.target.value)}
            required
          >
            {renderStores}
          </select>
        </div>
        {renderCards}
      </div>
    </Sidebar>
  );
}

export default Orders;
