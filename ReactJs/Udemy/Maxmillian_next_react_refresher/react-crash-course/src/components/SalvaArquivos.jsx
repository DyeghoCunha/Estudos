import React, { useEffect } from 'react';
import axios from 'axios';
import fs from 'fs';
import path from 'path';

function ImageDownloader({ url }){
  useEffect(() => {
    const downloadImage = async () => {
      try {
        const response = await axios.get(url, { responseType: 'arraybuffer' });
        const buffer = Buffer.from(response.data, 'binary');
        fs.writeFileSync(path.resolve('D:/Documentos/GitHub/Estudos/ReactJs/Udemy/Maxmillian_next_react_refresher/react-crash-course/src/assets/Image', 'Imagem10.png'), buffer);
      } catch (error) {
        console.error('Erro ao baixar a imagem:', error);
      }
    };

    downloadImage();
  }, [url]);

  return console.log("Arquivo Salvo");
};

export default ImageDownloader;
