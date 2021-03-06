import * as sessionAPI from '../util/session_api_util'

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER"
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER"
export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS"

export const receiveCurrentUser = (currentUser) => {
  return {
    type: RECEIVE_CURRENT_USER,
    user: currentUser
  }
}

export const logoutCurrentUser = () => {
  return {
    type: LOGOUT_CURRENT_USER,
  }
}

export const receiveErrors = (errors) => {
  return {
    type: RECEIVE_SESSION_ERRORS,
    errors, 
  }
}

export const login = (user) => (dispatch) => {
  return sessionAPI.login(user)
    .then(value => dispatch(receiveCurrentUser(value)))
}

export const logout = () => (dispatch) => {
  return sessionAPI.logout()
    .then(value => dispatch(logoutCurrentUser()))
}

export const signup = (user) => (dispatch) => {
  return sessionAPI.signup(user)
    .then(value => dispatch(receiveCurrentUser(value)))
}