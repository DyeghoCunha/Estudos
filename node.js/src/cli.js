import pegaArquivo from "./index.js";
import fs from "fs";
import chalk from "chalk";


const caminho = process.argv;

function imprimeLista(resultado, identificador = "") {
  console.log(
    chalk.yellow("Lista de Links"),
    chalk.black.bgGreen(identificador),
    resultado);
}

async function preocessaTexto(argumentos) {
  const caminho = argumentos[2];

  try {
    fs.lstatSync(caminho);
  } catch (erro) {
    if (erro.code === "ENOENT") {
      console.log(chalk.red("\nArquivo ou Diretório não existe\n"))
      return;
    }
  }

  if (fs.lstatSync(caminho).isFile()) {
    const resultado = await pegaArquivo(caminho);
    imprimeLista(resultado);
  } else if (fs.lstatSync(caminho).isDirectory()) {
    const arquivos = await fs.promises.readdir(caminho)
    arquivos.forEach(async (nomeDeArquivo) => {
      const lista = await pegaArquivo(`${caminho}/${nomeDeArquivo}`);
      imprimeLista(lista, nomeDeArquivo);
    })
  }


}

preocessaTexto(caminho)
