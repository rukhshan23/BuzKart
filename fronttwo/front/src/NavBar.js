import React from 'react';
import {NavLink} from 'react-router-dom';

const Nav=()=>{
	return(
		<div className="Nav">

			<NavLink activeClassName="active_class" to="/">
				LogIn
			</NavLink>
			<NavLink activeClassName="active_class" to="/register">
				Signup
			</NavLink>

		</div>
		);
}
export default Nav;