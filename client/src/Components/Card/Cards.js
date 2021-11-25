import React from 'react'
import {Card,CardImg,CardTitle,Button,CardBody } from 'reactstrap'


function Cards({title}) {
    return (
        <div>
             <Card>
    <CardImg
      alt={title}
      src="https://picsum.photos/318/180"
      top
      width="100%"
    />
    <CardBody>
      <CardTitle className='text-decoration-none text-dark' tag="h5">
        {title}
      </CardTitle>
    </CardBody>
  </Card>
        </div>
    )
}

export default Cards