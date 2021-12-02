import React, { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { Row, Col, Container } from 'reactstrap'
import Cards from '../Card/Cards';
import axios from '../utils/axios';


function HomePage() {
    const [stores, setStores] = useState([])

    useEffect(() => {
        axios.get('/store')
            .then((response) => {
                setStores(response.data)
            }).catch((err) => {
                console.log(err)
            })
    }, [])

    console.log(stores);

    const renderCards = stores.map((store) =>
        < Col lg={3} className='my-3' >
            <Link className='text-decoration-none' to={`/stores/${store._id}`}>
                <Cards title={store.name} />
            </Link>
        </Col>
    )


    return (
        <div >
            <Row>
                {renderCards}
            </Row>
        </div>
    )
}

export default HomePage
