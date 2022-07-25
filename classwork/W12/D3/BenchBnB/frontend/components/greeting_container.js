import { connect } from "react-redux"
import Greeting from "./greeting"
import { logout } from "../actions/session_actions"


const matchStateToProps = (state) => {
  return {
    currentUser: state.entities.users[state.session.id]
  } 
}

const matchDispatchToProps = (dispatch) => {
  return {
    logout: () => dispatch(logout())
  }
}

export default connect(matchStateToProps, matchDispatchToProps)(Greeting)