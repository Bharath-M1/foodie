import React, { useEffect, useState } from "react";
import { Card, Row, Col } from "reactstrap";
import { useMutate } from 'restful-react'
import myaxios from "../utils/axios";
import axios from "axios"
import { errorToast, successToast } from "../utils/toast";
import { MdDelete, MdEdit } from "react-icons/md";

function AdminHome() {
  const [stores, setStores] = useState([]);
  const [name, setName] = useState();
  const [seating, setSeating] = useState();
  const [banner, setBanner] = useState();
  const [fileName, setFileName] = useState("");
  

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

  const handleSubmit = async(event) => {
    event.preventDefault();
    
      const formData =new FormData();
      formData.append('banner',banner)
      formData.append('name',name)
      formData.append('seating',seating)
      
      
      axios
        .post("http://localhost:5000/home/store",
        formData,
         )
        .then((response) => {
          if (response.data === "Added Successfully") {
            successToast("Store Created");
            setTimeout(() => {
              window.location = "/admin/home";
            }, 1000);
          }
        })
        .catch((err) => {
          console.log(err);
        });
    
  };

  const deleteStore = (id) => {
    myaxios.delete(`/store/${id}`).then((response) => {
      if (response.data === "Store Deleted") {
        errorToast("Store Deleted");
        setTimeout(() => {
          window.location = "/admin/home";
        }, 1000);
      }
    });
  };

  const renderStor = stores.map((store) => (
    <tr>
      <Card className="p-3 my-2 rounded-lg shadow w-lg-25 w-md-50 w-100 ">
        <Row>
          <Col lg={4} md={4} sm={12}>
            <h6 className="w-3 text-capitalize">{store.storeName}</h6>
          </Col>
          <Col lg={4} md={4} sm={12} className="text-lg-center">
            <div className="w-5 align-self-center">
              <MdDelete onClick={() => deleteStore(store._id)} />
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
            <div>
              <h5 className="text-center h3 my-1">Add Store</h5>
              <Card className="border-0">
                <form className="mx-auto">
                  <div className="my-3">
                    <label className="d-block fw-bold my-1">Store Name</label>
                    <input
                      className="form-control"
                      type="text"
                      name="name"
                      value={name}
                      required
                      onChange={(e) => setName(e.target.value)}
                    />
                  </div>
                  <div className="my-3">
                    <label className="d-block fw-bold my-1">Seating</label>
                    <input
                      className="form-control"
                      type="number"
                      name="seating"
                      value={seating}
                      required
                      onChange={(e) => setSeating(e.target.value)}
                    />
                  </div>
                  {/* <div>
                    <label className="d-block fw-bold my-1">Banner Image</label>
                    <input
                      className="form-control"
                      type="file"
                      name="seating"
                      accept=".jpg , .png , .jpeg"
                      // value={banner}
                      required
                      onChange={(e) => {setBanner(e.target.files[0]);setFileName(e.target.files[0].name)}}
                    />
                  </div> */}
                  <button
                  disabled={ !seating ||!name}
                    className="btn bg-primary text-white fw-bold my-3 mx-5"
                    onClick={(e) => handleSubmit(e)}
                  >
                    Create Store
                  </button>
                </form>
              </Card>
            </div>
          </Col>
          <Col lg={6}>
            <div>
              <h5 className="mx-3">Stores</h5>
              <table style={{ width: "100%", height: "50%" }}>
                {renderStor}
              </table>
            </div>
          </Col>
        </Row>
      </Card>
    </div>
  );
}

export default AdminHome;
