import React from "react"
import Item from "../items/items"

class PokemonDetail extends React.Component {
    constructor(props){
        super(props)
    }

    componentDidMount() {
      let pokemonId = this.props.match.params.pokemonId
      this.props.requestSinglePokemon(pokemonId)
    }

    componentDidUpdate(prevProps) {
      if (prevProps.match.params.pokemonId !== this.props.match.params.pokemonId) {
        this.props.requestSinglePokemon(this.props.match.params.pokemonId)
      }
    }

    render(){
      if (this.props.pokemon === undefined) return null
      console.log(this.props.items)
      const pokeId = this.props.match.params.pokemonId

        return (
          <>
            <img src={this.props.pokemon.imageUrl} />
            <h1>{this.props.pokemon.name}</h1>
            <ul>
            {this.props.moves.map(el => {
              return <li>{el}</li>
            })}
            </ul>
            <ul>
              {this.props.items.map(el => {
                return <Item key={el.id} item={el}/> 
              })}
            </ul>
          </>
        )
    }
}

export default PokemonDetail