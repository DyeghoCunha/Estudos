// const botao = document.querySelector("#botao-calcula")

// botao.addEventListener("click" , (event) =>{
//     event.preventDefault();

//     var formulario = document.querySelector(".container__formulario")
//     var empresa = obtemEmpresa(formulario);
//     var empresaTr = montaTr(empresa);
//     var tabela = document.querySelector(".tabela__corpo");

//     tabela.appendChild(empresaTr);


// })

// function obtemEmpresa(formulario){

//     var empresaObj = {
//         nome: formulario.empresa.value,
//         cnae: formulario.cnae.value,
//         faturamento: formulario.faturamentoAcumulado.value
//     }

//     return empresaObj;

// }


// function montaTd(dados,classe){
//     var td = document.createElement("td");
//         td.textContent = dados;
//         td.classList.add(classe);

//         return td;
// }


// function montaTr(empresa){

   
//    var empresaTr = document.createElement("tr");

//    var nomeTd = montaTd(empresa.nome,"estilo-celula");
//    var cnaeTd = montaTd(empresa.cnae, "estilo-celula");
//    var faturamentoTd = montaTd(empresa.faturamento, "estilo-celula");

       
//    empresaTr.appendChild(nomeTd);
//    empresaTr.appendChild(cnaeTd);
//    empresaTr.appendChild(faturamentoTd);

//    return empresaTr;

// }