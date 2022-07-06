export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon)
}
  
export const selectPokemonMovesNames = (state) => {
  
  let arr = Object.values(state.entities.moves)
  return arr.map(el => {
    return el.name 
  })
}