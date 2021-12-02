import React from 'react'
import {RiAdminFill} from 'react-icons/ri'


function AdminHeader() {
    return (
        <div className='d-flex justify-content-between px-4 py-3 text-white fw-bold fs-5' style={{backgroundColor:'#7f000e'}}>
            <div className='d-flex align-content-center '>
                <RiAdminFill size={30} />
                <div className='mx-4'>Admin</div>
            </div>
            <div>
                Logout
            </div>
        </div>
    )
}

export default AdminHeader
