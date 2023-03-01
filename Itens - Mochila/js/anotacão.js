const form = document.getElementById("novoItem");
const lista = document.getElementById("lista");
// Quando a informação do LocalStorage volta para o JS, deve converter de STRING com o JSON.parse
const itens = JSON.parse(localStorage.getItem("itens") )|| [];



itens.forEach ( (elemento) =>{
    criaElemento(elemento)
})


form.addEventListener("submit", (event)=>{
    event.preventDefault();
   
    
//Faz os itens aparecerem 
// console.log( event.target.elements['nome'].value);
// console.log( event.target.elements['quantidade'].value);


    var nome = event.target.elements['nome'];
    var quantidade = event.target.elements['quantidade'];

// Salvar em um Objeto toda vez que eu precise armazenar um grupo de objetos
const itemAtual = {
    "nome": nome.value,
    "quantidade": quantidade.value
}

    criaElemento(itemAtual); 
    //inserir o elemento no ARREY
itens.push(itemAtual)
//local Storage só lê STRING, entçao é preciso usar o JSON.stringigy, e tambem fazer um Array para ele não sobrescrever
localStorage.setItem("itens", JSON.stringify(itens))
//console.log(itens)
// Para verificar os dados salvos no LocalStorage usar a propriedade localStorage.getItens("itens") que esta escrita na CONSTANTE la linha 3


//esvazia o formulário
//event.target.elements['nome'].value = ""
//event.target.elements['quantidade'].value = ""

    nome.value = ""
    quantidade.value = ""


})

function criaElemento(item){


const novoItem= document.createElement("li");
novoItem.classList.add("item");

const numeroItem = document.createElement("strong");
     numeroItem.innerHTML = item.quantidade;
    // numeroItem.textContent = quantidade;

    novoItem.appendChild(numeroItem);
    novoItem.innerHTML += item.nome;


lista.appendChild(novoItem); 


/*----------------------Inicio de codigo pra salvar----------------------------------------------------*/



}
