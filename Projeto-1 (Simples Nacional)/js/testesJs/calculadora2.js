// const botao = document.querySelector("#botao-calcula")

// botao.addEventListener("click", function(event){
//     event.preventDefault();

//     var tabela = document.querySelector(".tabela__corpo")
//     var form = document.querySelector(".container__formulario");
//     var empresa = obtemEmpresa(form)

//         empresaTr = montaTr(empresa);

   

//    tabela.appendChild(empresaTr);

// })

// function obtemEmpresa(form){

//     var empresa = {
//         nome: form.empresa.value,
//         cnae: form.cnae.value,
//         faturamento: form.faturamentoAcumulado.value
//     }
//     return empresa;
// }




// function montaTr(empresa){
    
//     // var form = document.querySelector(".container__formulario");
//     // var empresa =obtemEmpresa(form);

//     var empresaTr = document.createElement("tr");
    
//     var nomeTd = montaTd(empresa.nome,"estilo-celula")
//     var cnaeTd = montaTd(empresa.cnae,"estilo-celula")
//     var faturamentoTd = montaTd(empresa.faturamento, "estilo-celula")
    
//     // nomeTd.textContent = empresa.nome;
//     // cnaeTd.textContent = empresa.cnae;
//     // faturamentoTd.textContent = empresa.faturamento;
    
//     var empresaTabela = document.querySelector(".tabela__corpo");
    
//     empresaTabela.appendChild(empresaTr);
//     empresaTr.appendChild(nomeTd);
//     empresaTr.appendChild(cnaeTd);
//     empresaTr.appendChild(faturamentoTd);


//     return empresaTr;
// }

// function montaTd(dado,classe){
//     var td = document.createElement("td");
//     td.textContent = dado;
//     td.classList.add(classe);

//     return td;
// }




