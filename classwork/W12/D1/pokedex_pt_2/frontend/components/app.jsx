import { Route } from 'react-router-dom'
import PokemonIndexContainer from './pokemon/pokemon_index_container'
import React from 'react'
import PokemonDetailContainer from './pokemon/pokemon_detail_container'

export const App = () => (
    <div>
        <Route path="/" component={PokemonIndexContainer} />,
    </div>
) 