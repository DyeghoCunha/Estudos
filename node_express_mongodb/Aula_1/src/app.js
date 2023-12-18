import express from "express";
import conectaNaDatabase from "./config/dbConnect.js";
import chalk  from "chalk";
import routes from "./routes/index.js";

const conexao = await conectaNaDatabase();

conexao.on("error",(erro)=>{console.error(chalk.red("\n---Erro de conexão---\n\n"), erro)});

const cor = "Core";
conexao.once("open",()=>{
  console.log(chalk.green("\n---Conexão com o banco feita com sucesso---\n\n ",));
});

const app = express();
routes(app);
// app.use(express.json());aaaa 

// app.get("/", (req, res) => {
//   res.status(200).send("Curso de Node.js");
// });

//?Separado nos arquivos livroController e livrosRoutes.
// app.get("/livros", async (req, res) =>  {
//   const listaLivros = await livro.find({});
//   res.status(200).json(listaLivros);
// });
//?___________________________________________________

app.get("/livros/:id", (req, res) => {
  const index = buscaLivro(req.params.id);
  res.status(200).json(livros[index]);
})

app.put("/livros/:id", (req, res) => {
  const index = buscaLivro(req.params.id);
  livros[index].titulo = req.body.titulo;
  res.status(200).json(livros);
})

app.post("/livros", (req, res) => {
  livros.push(req.body);
  res.status(201).send("livro cadastrado com sucesso");
});

app.delete("/livros/:id", (req, res) => {
  const index = buscaLivro(req.params.id);
  livros.splice(index, 1);
  res.status(200).send("Livro removido com sucesso");
});

export default app;


//