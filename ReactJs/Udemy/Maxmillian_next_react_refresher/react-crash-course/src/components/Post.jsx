import React from 'react'
import ColorThief from 'colorthief';


const names = ["Maximilian","Manuel"];



function Post() {
 const  chosenName= Math.random()> 0.5 ? names[0] : names[1];

 function loadImage(url) {
  return new Promise((resolve, reject) => {
    const img = new Image();
    img.crossOrigin = "Anonymous";
    img.onload = () => resolve(img);
    img.onerror = reject;
    img.src = url;
  });
}

// Função para extrair cores de uma imagem
async function getColors(imageUrl) {
  const colorThief = new ColorThief();
  const img = await loadImage(imageUrl);
  const colors = colorThief.getPalette(img);
  return colors;
}

// Uso da função
getColors('URL_DA_IMAGEM')
  .then(colors => console.log(colors))
  .catch(error => console.error(error));
 


  return (
    <div>
      <p>{chosenName}</p>
      <p>React.js Is Awesome !</p>
    </div>
  )
}

export default Post;