import React from 'react'

class Tile extends React.Component {
  constructor(props) {
    super(props)
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick(e) {
    e.preventDefault()
    const flagged = e.altKey ? true : false 
    console.log(flagged)
    this.props.updateGame(this.props.tile, flagged);
  }

  render() {
    let letter;
    if (this.props.tile.bombed && this.props.tile.explored) {
      letter = (
        <div className='tile bombed' onClick={this.handleClick}>💣</div>
      )
    }    
    else if (this.props.tile.explored && !this.props.tile.bombed) {
      letter = (
        <div className="tile explored" onClick={this.handleClick}>{this.props.tile.adjacentBombCount()}</div>
        )}
    else if (this.props.tile.flagged && !this.props.bombed) {
      letter = (<div className="tile flagged" onClick={this.handleClick}>🚩</div>)
    } 
    else {
      letter = (<div className="tile" onClick={this.handleClick}></div>)
    }

    return letter
  }
}


export default Tile