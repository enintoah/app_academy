import React from "react"
import ReactDOM from "react-dom"
import {fetchAllPokemon} from './util/api_util'
import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions'
import configureStore from './store/store'
import {selectAllPokemon} from './reducers/selectors'

window.addEventListener("DOMContentLoaded", ()=> {
    const rootEl = document.getElementById('root');
    ReactDOM.render(<h1>Pokedex</h1>, rootEl);
    const store = configureStore();
    window.store = store;
    window.fetchAllPokemon = fetchAllPokemon; 
    window.dispatch = store.dispatch; 
    window.receiveAllPokemon = receiveAllPokemon; 
    window.requestAllPokemon = requestAllPokemon;
    window.selectAllPokemon = selectAllPokemon; 
})