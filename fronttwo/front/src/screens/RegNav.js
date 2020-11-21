import React from 'react';
import {NavLink} from 'react-router-dom';

function NavBar(){
	return(
		<div className="NavBar">

			<NavLink activeClassName="active_class" to="/register/buyer"> Create a Buyer Account</NavLink>
			<NavLink activeClassName="active_class" to="/register/seller"> Create a Seller Account</NavLink>

		</div>
		);
}
export default NavBar;