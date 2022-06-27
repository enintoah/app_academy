import React from "react"
import * as Minesweeper from './../minesweeper'
import Board from './board'

class Game extends React.Component {
    constructor(props){
        super(props)
        this.state = {board: new Minesweeper.Board(9, 13)}
        this.updateGame = this.updateGame.bind(this)
    }

    updateGame(tile, boolean){
        if (boolean) {
            tile.toggleFlag()
        }
        else {
            tile.explore()
        }
        this.setState({board: this.state.board})
    }

    restartGame() {
        this.setState({board: new Minesweeper.Board(9, 13)})
    }

    render(){
        let message;
        if (this.state.board.won()) {
            const modal = document.getElementById('modal')
            modal.classList.add('is-open')
            const h1 = document.getElementById('message')
            h1.innerHTML = "";
            h1.innerHTML = "You win!"
        }
        else if (this.state.board.lost()) {
            const modal = document.getElementById('modal')
            modal.classList.add('is-open')
            const h1 = document.getElementById('message')
            h1.innerHTML = "";
            h1.innerHTML = "You Lose..."
        }
        return(
            <div>
                <Board board={this.state.board} updateGame={this.updateGame} />
                {message}
            </div>
        )
    }
}

export default Game