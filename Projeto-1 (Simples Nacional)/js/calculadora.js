
const botao = document.querySelector("#botao-calcula");





botao.addEventListener("click", (event) =>{
    event.preventDefault();

    var tabelaEmpresa = document.querySelector(".tabela__corpo")
    var form = document.querySelector(".container__formulario");
    var empresa = obtemEmpresa(form);

   

    pacienteTr = montaTr(empresa);

   tabelaEmpresa.appendChild(pacienteTr);


})

function obtemEmpresa(form){
    
    var empresaObjeto = {
        nome: form.empresa.value,
        cnae: form.cnae.value,
        faturamento: form.faturamentoAcumulado.value
    }
    return empresaObjeto;
}


function montaTr(empresa){

    var empresaTr = document.createElement("tr");

    var nomeTd = montaTd(empresa.nome);
    var cnaeTd = montaTd(empresa.cnae);
    var faturamentoTd = montaTd(empresa.faturamento);

        nomeTd.textContent = empresa.nome;
        cnaeTd.textContent = empresa.cnae
        faturamentoTd.textContent = empresa.faturamento;

    var tabelaEmpresa = document.querySelector(".tabela__corpo")


    tabelaEmpresa.appendChild(empresaTr);
    
    empresaTr.appendChild(nomeTd);
    empresaTr.appendChild(cnaeTd);
    empresaTr.appendChild(faturamentoTd);


    return empresaTr

}



function montaTd(dado,classe){

    var td = document.createElement("td");
        td.textContent = dado;
        td.classList.add("estilo-celula")

        return td

}










    
   

