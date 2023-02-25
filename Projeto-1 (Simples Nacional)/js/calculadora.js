
var tabelaEmpresa = document.querySelectorAll(".tabela__corpo")


const botao = document.querySelector("#botao-calcula");

var form = document.querySelector(".container__formulario");

var empresa = obtemEmpresa(form);

// console.log(empresa.nome)
// console.log(empresa.cnae)
// console.log(empresa.faturamento)


function obtemEmpresa(form){
    
    var empresa = {
        nome: form.empresa.value,
        cnae: form.cnae.value,
        faturamento: form.faturamentoAcumulado.value
    }
    return empresa;
}

botao.addEventListener("click", (event) =>{
    event.preventDefault();

    adicionaTr();
   

})


function adicionaTr(empresa){

    var tabelaEmpresa = document.querySelectorAll(".tabela__corpo")

    var empresaTr = document.createElement("tr")
    var empresaTd = montaTd(empresa.nome)
        
    tabelaEmpresa.appendChield(empresaTr);



    empresaTr.appendChild(empresaTd)
}

function montaTd(dado){
    var td = document.createElement("td");
        td.textContent = dado;
    return td.value;
}