const arquivo = [];

function readFile() {
  const fileInput = document.getElementById('fileInput');
  const file = fileInput.files[0];

  
  if (file) {
    const reader = new FileReader();

    reader.onload = function(e) {
      const contents = e.target.result;
      console.log('Conteúdo do arquivo:', contents);

      let planilha = contents;
      arquivo.push({ planilha });
      console.log(arquivo);

      // Filtrar a linha com base no número e extrair o valor
      const padrao = /R\d+-\d+8109\d+M(\d+)/g;
      const matches = planilha.match(padrao);

      if (matches) {
        for (const match of matches) {
          const valor = match.slice(-13);
          const resultadoFinal = valor.slice(0,-4)
          console.log('Valor encontrado:', valor);
          const number = Number(resultadoFinal)/100
          console.log('Valor:',number)
        }
      } else {
        console.log('Nenhum match encontrado.');
      }
    };

    reader.readAsText(file);
  }
}