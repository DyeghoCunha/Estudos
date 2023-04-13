import { conectaApi } from "./conectaApi.js";
import { constroiCard } from "./mostrarVideos.js";

async function buscarVideo(evento){
    evento.preventDefault();
    
    const dadosDePesquisa = document.querySelector("[data-pesquisa]").value;
    const busca = await conectaApi.buscaVideo(dadosDePesquisa);
    const lista = document.querySelector("[data-lista]")


    //deleta todos os itens da lista, porque o filtro adiciona as coisas filtradas no final da lista, assim apagando todas as coisas do inicio
    //ficamos apenas com a lista nova
    while(lista.firstChild){
    busca.forEach(elemento => lista.appendChild(constroiCard(elemento.titulo,elemento.descricao,elemento.url,elemento.imagem)))
    console.log(busca)
    }
}

const botaoDePesquisa = document.querySelector("[data-botao-pesquisa]");

botaoDePesquisa.addEventListener('click', evento => buscarVideo(evento))