const express = require('express');
const axios = require('axios');
const fs = require('fs');

const app = express();
const port = 3001;

app.get('/downloadImage', async (req, res) => {
  const imageUrl = req.query.imageUrl;

  try {
    const response = await axios.get(imageUrl, { responseType: 'arraybuffer' });
    const buffer = Buffer.from(response.data, 'binary');
    const filePath = `D://Documentos//GitHub//Estudos//ReactJs//Udemy//Maxmillian_next_react_refresher//react-crash-course//src//assets//Arma${req.query.index}.png`;
    fs.writeFileSync(filePath, buffer);

    console.log('Imagem salva com sucesso!');
    res.sendFile(filePath);
  } catch (error) {
    console.error('Erro ao baixar a imagem:', error);
    res.status(500).send('Internal Server Error');
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
