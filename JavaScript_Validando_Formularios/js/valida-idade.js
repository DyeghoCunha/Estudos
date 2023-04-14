export function ehMaiorDeIdade(campo){
    const dataNascimento = new Date(campo.value)
    if (!validaIdade(dataNascimento)){
        campo.setCustomValidity('O Usuario nao eh maior de Idade')
    }
   // console.log(`O Resultado de Valida Ideade eh ${validaIdade(dataNascimento)}`)
}

function validaIdade(data){
    const dataAtual = new Date()
    const dataMais18 = new Date(data.getUTCFullYear() + 18, data.getUTCMonth(), data.getUTCDate());

    //console.log(`A Data Atual eh: ${dataAtual}`)
   // console.log(`A data Mais 18 eh:  ${dataMais18}`)
    return dataAtual >= dataMais18;
}