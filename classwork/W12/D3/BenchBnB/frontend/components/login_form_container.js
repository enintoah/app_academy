import { connect } from "react-redux"
import SessionForm from "./session_form"
import { login } from "../actions/session_actions"

const matchStateToProps = (state, ownProps) => {
  return {
    formType: 'Login',
    errors: state.errors.session.errors
  } 
}

const matchDispatchToProps = (dispatch) => {
  return {
    processForm: (user) => dispatch(login(user))
  }
}

export default connect(matchStateToProps, matchDispatchToProps)(SessionForm)