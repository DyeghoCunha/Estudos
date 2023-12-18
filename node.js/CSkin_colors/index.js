// index.js
const express = require('express');
const app = express();
const port = 3000;

const listaDeLinks = [
  "https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou6rwOANf1OD3fC0X09qzh5SCgfb4DL_Dn3tu5cB1g_zMyoD0mlOx5UY-ZGunJdOTIwQ8aQyFr1fqwe6805S-tZXIzXswsyR35HqOyUOzgE1SLrs4jFj6slg/",
  "https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou6rwOANf1OD3fC0X09qzh5SCgfb4DL_Dn3tu5cB1g_zMyoD0mlOx5UY-ZGunJdOTIwQ8aQyFr1fqwe6805S-tZXIzXswsyR35HqOyUOzgE1SLrs4jFj6slg/",
  "https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXA6Q1NL4kmrAlOA0_FVPCi2t_fUkRxNztUoreaLAJu1_LafDhQ5dmJgoGZnvb6J7-fkGhTsJFwi7vDrN-ijVXnr0c_Nj-hJYOXcA9oNVnX-1i9xu7r05e87YOJlyV49g3fNA/",
  "https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXA6Q1NL4kmrAlOA0_FVPCi2t_fUkRxNztUoreaLAJu1_LafDhQ5dmJgoGZnvb6J7-fkGhTsJFwi7vDrN-ijVXnr0c_Nj-hJYOXcA9oNVnX-1i9xu7r05e87YOJlyV49g3fNA/",
  "https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopbuyLgNv1fX3cih9_92hkYSEkfHLN77HmX5D7ddOh-zF_Jn4t1i1uRQ5fW-mLIWTdFQ8NV6G-QO4xLy8jcPqtZXOwHBrvnZw43fVyRDkiRFKarFxxavJcF3kHwA/",
  "https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopbuyLgNv1fX3cih9_92hkYSEkfHLN77HmX5D7ddOh-zF_Jn4t1i1uRQ5fW-mLIWTdFQ8NV6G-QO4xLy8jcPqtZXOwHBrvnZw43fVyRDkiRFKarFxxavJcF3kHwA/"
];

const axios = require('axios');
const ColorThief = require('color-thief-node');
const fs = require('fs');
const url = listaDeLinks[0]; // Substitua pelo seu link
const path = 'D:\\Documentos\\GitHub\\Estudos\\node.js\\CSkin_colors\\imagens\\image.png' // Substitua pelo caminho onde você quer salvar a imagem

 axios({
  url,
  responseType: 'stream',
})
  .then(
    response =>
      new Promise((resolve, reject) => {
        response.data
          .pipe(fs.createWriteStream(path))
          .on('finish', () => resolve())
          .on('error', e => reject(e));
      }),
  )
  .then(() => {
    ColorThief.getColor(path)
      .then(color => { 
          console.log(color);
      })
      .catch(err => {
          console.log('Erro ao obter cor:', err);
      });
  })
  .catch(err => console.error(err));

 ColorThief.getColor(path)
  .then(color => { 
      console.log("A cord é", color);
  })
  .catch(err => {
      console.log('Erro ao obter cor:', err);
  });


app.get('/', (req, res) => {
  res.send('Olá, mundo!');
});

app.listen(port, () => {
  console.log(`Aplicação rodando em http://localhost:${port}`);

});