import React from 'react'
import ReactDOM from 'react-dom'
import Game from './game'


document.addEventListener("DOMContentLoaded", ()=> {
  const game = document.getElementById('game')
  ReactDOM.render(
    <Game />, game
  )
})