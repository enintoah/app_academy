import React from "react";
import { Link } from "react-router-dom";

class Greeting extends React.Component {
  constructor(props) {
    super(props)

    this.handleClick = this.handleClick.bind(this)
  }

  handleClick(e) {
    e.preventDefault();
    this.props.logout()
  }

  render() {
    return this.props.currentUser ? (
      <div>
        <h2>hello {this.props.currentUser.username}!!!</h2>
        <button onClick={this.handleClick}>Logout...</button>
      </div>
    ) : ( 
    <div>
      <Link to="/signup">Signup</Link>
      <br />
      <Link to="/login">Login</Link>
    </div>)
  }
}

export default Greeting