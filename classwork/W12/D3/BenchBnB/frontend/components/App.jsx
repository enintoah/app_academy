import React from "react";
import GreetingContainer from "./greeting_container";
import { Route } from "react-router-dom";
import LoginFormContainer from "./login_form_container";
import SignupFormContainer from "./signup_form_container";
import { AuthRoute } from "../util/route_util";

const App = () => (
  <div>
    <header>
      <h1>WELCOME TO BENCHBNB</h1>
      <GreetingContainer /> 
    </header>
    <AuthRoute path="/login" component={LoginFormContainer}/> 
    <AuthRoute path="/signup" component={SignupFormContainer}/>
  </div>
)

export default App;