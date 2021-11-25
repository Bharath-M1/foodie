import React, { useState,useEffect } from 'react' 
import {Link} from 'react-router-dom'
import Axios from 'axios'
import {Row,Col,Container } from 'reactstrap'
import Cards from '../Card/Cards';


function HomePage() {
    // const [stores,setStores]=useState([])


    // useEffect(() => {
    //     Axios.get('http:localhost:5000/product')
    //     .then((response)=>{
    //         setStores(response.data)
    //     }).catch((err)=>{
    //         console.log(err)
    //     })
        
    // })

    const stores=[
        {
            "id":1,
            "store":"ABC Canteen",
            "seating":"50"
    },{
        "id":2,
        "store":"EFG Hotel ",
        "seating":"50"
    },{
        "id":3,
        "store":"HIJ Snack Parlour",
        "seating":"50"
    },{
        "id":4,
        "store":"LMN Bar",
        "seating":"50"
    },
    {
        "id":5,
        "store":"OPQ Paradise",
        "seating":"50"
    }

]

    const renderCards=stores.map((store)=>
    <Col lg={3} className='my-3'>
      
           <Link className='text-decoration-none' to={`/stores/${store.id}`}> <Cards title={store.store} /></Link>
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
