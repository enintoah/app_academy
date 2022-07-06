import { connect } from 'react-redux';
import { requestSinglePokemon } from './../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';
import { selectPokemonMovesNames } from './../../reducers/selectors';
import { selectAllPokemon } from './../../reducers/selectors';


const mapStateToProps = (state, ownProps) => ({
  moves: selectPokemonMovesNames(state),
  pokemon: state.entities.pokemon[ownProps.match.params.pokemonId],
  items: Object.values(state.entities.items)
})

const mapDispatchToProps = dispatch => ({
    requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
})

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail)