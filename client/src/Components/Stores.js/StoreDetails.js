import axios from '../utils/axios'
import React, { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { Row, Col, Card } from 'reactstrap'

function StoreDetails() {
    const { id } = useParams()
    const [products, setProducts] = useState([])
    // console.log(storeId, id, "this");

    useEffect(() => {
        // console.log("hai");
        axios.get(`/getProductsfromSingleStore/${id}`)
            .then((response) => {
                console.log(response.data);
                setProducts(response.data)
            }).catch((err) => {
                console.log(err)
            })

    }, [])

    const renderProducts = products.map((product) =>
        <Card className='my-4 p-4'>
            <Row>
                <Col lg={4}>
                </Col>
                <Col lg={8}>
                    <h4>{product.name}</h4>
                    <h6>&#8377; {product.rate}</h6>
                </Col>
            </Row>
        </Card>)

    return (
        <div>
            <div className='bg-dark p-5'>
                <h2 className='text-white text-center'>Store Name</h2>
                <div className='d-flex text-white justify-content-between float-start fw-bold fs-4'>
                    <p className='mx-1'>Seating</p>
                    <p className='mx-1'>:</p>
                    <p className='mx-1'>50</p>
                </div>
                <span className='clearfix'></span>
            </div>
            <div>
                {renderProducts}
            </div>

        </div>
    )
}

export default StoreDetails
