import { combineReducers } from 'redux';
import session from './session_reducer';
import session_reducer from './errors_reducer';

const RootReducer = combineReducers({
  session, 
  errors: session_reducer
});

export default RootReducer;