import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state={}, action) => {
  Object.freeze(state)
  const newState = Object.assign({}, state)
  switch(action.type) {
  case RECEIVE_ALL_POKEMON:
    // action.pokemon.forEach(el => {
    //   newState[el.id] = el
    // })
    // return newState
    return Object.assign(newState, action.pokemon)
  default: 
    return state
  }
}


export default pokemonReducer;