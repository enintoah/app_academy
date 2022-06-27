import React from 'react'
import Tile from './tile'


class Board extends React.Component {
  constructor(props) {
    super(props)
  }

  render(){
      const tile = this.props.board.grid.map((row, idx)=> {
        return <div key={idx}>{row.map((el, idx1) => {
            return (<div key={idx1}> <Tile updateGame={this.props.updateGame} tile={el}/> </div>)
        })}</div>
      })

      return(
          <div>
            {tile}
          </div>
      )
  }
}

export default Board