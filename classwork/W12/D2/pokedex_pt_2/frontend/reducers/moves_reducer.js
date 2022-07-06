import { RECEIVE_SINGLE_POKEMON } from "../actions/pokemon_actions";

const movesReducer = (state = {}, action) => {
  Object.freeze(state);
  const newState = Object.assign({}, state)
  switch (action.type){
  case RECEIVE_SINGLE_POKEMON:
    return Object.assign({}, action.payload.moves)
  default:
    return state;
  }
}
  
export default movesReducer;
