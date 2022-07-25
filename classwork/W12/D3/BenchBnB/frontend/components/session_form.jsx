import React from "react";
import { Link, Redirect } from "react-router-dom";

class SessionForm extends React.Component {
  constructor(props) {
    super(props)
    
    this.state = {
      username: "",
      password: ""
    }

    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleSubmit(e) {
    e.preventDefault()
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  render() {
    let url = (this.props.formType === 'Login') ? '/signup' : '/login'
    let opposite = (this.props.formType === 'Login') ? 'Signup' : 'Login'

    return (
      <div>
        <h2>{this.props.formType}</h2>
        <Link to={url}>{opposite}</Link>
        <ul>
          {this.props.errors.map((el, idx) => {
            return <li key={idx}>{el}</li>
          })}
        </ul>
      </div>
    )
  }
}

export default SessionForm