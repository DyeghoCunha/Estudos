const botao = document.querySelector("#botao-calcula")
botao.addEventListener("click", (event)=>{
    event.preventDefault();
    var form = document.querySelector(".container__formulario");
    var empresa = empresaObj(form);
    var empresaTr = montaTr(empresa);
    var tabela = document.querySelector(".tabela__corpo");

    tabela.appendChild(empresaTr);  
})

function empresaObj(form){
    var empresa={
        nome: form.empresa.value,
        cnae: form.cnae.value,
        faturamento:form.faturamentoAcumulado.value,
        anexo:buscaAnexo();
    }
    return empresa;
}

function montaTd(dado,classe){
    var td = document.createElement("td")
        td.textContent = dado;
        td.classList.add(classe)
        return td;
}

function montaTr(empresa){

    var empresaTr = document.createElement("tr")  
    var nomeTd = montaTd(empresa.nome,"estilo-celula");
    var cnaeTd = montaTd(empresa.cnae,"estilo-celula");
    var faturamentoTd = montaTd(empresa.faturamento,"estilo-celula");
    var anexoTd = montaTd(empresa.anexo,"estilo-celula")
    empresaTr.appendChild(nomeTd);
    empresaTr.appendChild(cnaeTd);
    empresaTr.appendChild(faturamentoTd);
    empresaTr.appendChild(anexoTd);

    return empresaTr;
}



function buscaAnexo(){

    var anexoI = [10,100,1000];
    var anexoII= [20,200,2000];
    var anexoIII=[30,300,3000];
    var anexoIV= [40,400,4000];
    var anexoV=  [50,500,5000];

    var form = document.querySelector(".container__formulario");
    var empresa = empresaObj(form);
    var cnae = empresa.cnae;

    for(var i = 0; i <anexoI.length;i++){
        if(cnae==anexoI[i]){
            console.log("AnexoI")
            return "Anexo I"
        }   
    }
    for(var i = 0; i <anexoII.length;i++){
        if(cnae==anexoII[i]){
            console.log("AnexoII")
            return "Anexo II"
        }   
    }
    for(var i = 0; i <anexoIII.length;i++){
        if(cnae==anexoIII[i]){
            console.log("AnexoIII")
            return "Anexo III"
        }   
    }
    for(var i = 0; i <anexoIV.length;i++){
        if(cnae==anexoIV[i]){
            return "Anexo IV"
        }   
    }
    for(var i = 0; i <anexoV.length;i++){
        if(cnae==anexoV[i]){
            return "Anexo V"
        }   
    }



    

return cnae;

}


console.log(cnae)