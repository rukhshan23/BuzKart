import React, { useState, useEffect} from 'react';
import './login.css';
import axios from 'axios';
function Login ()
{
	const [username,setUsername] = useState('');
	const [password,setPassword] = useState('');
	useEffect(() => {
		async  function fetchData() {
			const request = await axios.get('http://localhost:4000/runtime/news')
			console.log(request.data)
			return request
		}
		fetchData()
	},[])
	const resetForm=()=>{
		
		setUsername("");
		setPassword("");
	}
	const handleClick = (evt) => {
		evt.preventDefault()
		async  function fetchData() {
			const request = await axios.post('http://localhost:4000/runtime/login', {
				'username' : username,
				'password':password
		})
			if(request &&!request.data.success)
			{

				alert("Some or all of the inputs are invalid. Please try again");
				resetForm();

			}
			else if (request &&request.data.success)
			{
				let msg= "Welcome "+request.data.username+"!";
				alert(msg)
			}
			return request
		}
		fetchData()
	}

	return (
		<div className= "loginForm">
		<form>
      	<input
	      	type='text'
	      	placeholder='Username'
	      	value={username}
	      	onChange={event => setUsername(event.target.value)}
      	/>
      	<input
	      	type='password'
	      	placeholder='Password'
	      	value={password}
	      	onChange={event => setPassword(event.target.value)}
      	/>

      	<button type='submit' onClick={handleClick}>Submit</button>

      	
      	</form>
      </div>

		);
} 
export default Login;
