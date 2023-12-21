import React from 'react'
import ColorThief from 'colorthief';


const names = ["Maximilian","Manuel"];



function Post() {
 const  chosenName= Math.random()> 0.5 ? names[0] : names[1];


  return (
    <div>
      <p>{chosenName}</p>
      <p>React.js Is Awesome !</p>
    </div>
  )
}

export default Post;