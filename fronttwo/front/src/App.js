import logo from './logo.svg';
import Login from './screens/login';
import Register from './screens/newregister';
import BuyerRegister from './screens/buyerRegister';
import SellerRegister from './screens/sellerRegister';
import {Route,Switch,Redirect} from 'react-router-dom';
import NavBar from './NavBar';
import './App.css';

function App() {
	const heading={
		color:"#fa9191",
		textTransform: "capitalize",
		textAlign:"center",
		fontWeight: "bold",
		textShadow:"0px 2px 4px #ffe9c5",
		margin: "70px 0",
		fontFamily: '"Josefin Sans",sans-serif'
	};
  return (
  	<>
  	<h1 style={heading}> BuzKart.pk </h1>
    <div className="App">
    <NavBar/>

    <Switch>
    	<Route exact path ='/'component={Login}/>
    	<Route exact path='/register' component={Register} />
    	<Route path='/register/buyer' component={BuyerRegister} />
    	<Route path='/register/seller' component={SellerRegister} />

     </Switch>

    </div>
    </>
  );
}

export default App;
