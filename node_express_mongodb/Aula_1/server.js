//import http from "http";

import "dotenv/config";
import app from "./src/app.js";
const PORT = 3000;





//? Parte do código que fui incluida quando não usavamos o EXPRESS
// const rotas ={
//   "/": "Curso de Node.js",
//   "/livros": "Entrei na rota livros",
//   "/autores":"Entrei na rota Autores",
// }

// const server = http.createServer((req, res)=>{
//   res.writeHead(200,{"Content-Type":"text/plain"});
//   res.end(rotas[req.url]);
// });
//? ------------

app.listen(PORT,()=>{
  console.log("servidor escutando!");
});