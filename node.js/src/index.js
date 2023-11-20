import fs from "fs";
import chalk from "chalk";



function extraiLinks(texto) {
  const regex = /\[([^[\]]*?)\]\((https?:\/\/[^\s?#.].[^\s]*)\)/gm;
  const capturas = [...texto.matchAll(regex)];
  const resultados = capturas.map(captura => ({ [captura[1]]: captura[2] }));
  return resultados;
}

function trataErro(erro) {
  throw new Error(chalk.red(erro.code, "Não há arquivo no diretório"));
}

function toString(texto) {
  console.log(chalk.yellow("\n___________________________________________\n"))
  console.log(chalk.green(texto));
  console.log(chalk.yellow("\n_________________________________________\n"))
}


async function pegaArquivo(caminhoDoArquivo) {
  try {
    const encoding = "utf-8";
    const texto = await fs.promises.readFile(caminhoDoArquivo, encoding);
  console.log(extraiLinks(texto));
  } catch (erro) {
    trataErro(erro);
  }

}


pegaArquivo("./arquivos/texto.md");


