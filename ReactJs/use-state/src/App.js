import logo from './logo.svg';
import './App.css';
import { useState } from 'react';

function App() {

  const [endereco, setEndereco] = useState({});

  const [enderecos, setEnderecos] = useState([])

  function manipularEndereco(evento) {

    const cep = evento.target.value;

    setEndereco({ cep })

    if (cep && cep.lenght === 8) {
      //obter o cep
      fetch(`https://viacep.com.br/ws/${cep}/json/`)
        .then(resposta => resposta.json())
        .then(dados => {

          setEnderecos(lista=>[...lista, endereco])
          setEndereco(enderecoAntigo => ({
            ...enderecoAntigo,
            rua: dados.logradouro,
            bairro: dados.bairro,
            cidade: dados.localidade,
            estado: dados.uf
          }
          ))

        })
    } console.log(endereco.rua)
  }
  return (
    <div className="App">
      <header className="App-header">
        <input type='text' placeholder='Digite o Cep' onChange={manipularEndereco} />
        <ul>
          <li>CEP: {endereco.cep} </li>
          <li>Bairro: {endereco.bairro} </li>
          <li>Cidade: {endereco.cidade} </li>
          <li>Estado: {endereco.estado} </li>
        </ul>
      </header>
    </div>
  );
}

export default App;





/// Exemplo dois, usando apenas o CEP como STRING
/* function App() {

  const [cep, setCep] = useState('');

    return (
      <div className="App">
        <header className="App-header">
        <input type='text' placeholder='Digite o Cep' onChange={evento => setCep(evento.target.value)}/>
        <ul>
          <li>CEP: {cep} </li>
        </ul>
        </header>
      </div>
    );
  }

  export default App; */


///Exemplo inicial de como usar o useState
/* function App() {

  //const [estado, funcAtualizaEstado] = useState('')  
  
  const [nome, setNome] = useState('Dyegho')
  
  //let nome= 'Dyegho'
  
  function alterarNome(){
    setNome('Dyegho Moraes Costa Gama Cunha')
    //nome = 'Dyegho Moraes Costa Gama Cunha'
    console.log(nome)
  }
  
    return (
      <div className="App">
        <header className="App-header">
          <h1>{nome}</h1>
          <button onClick={alterarNome}>Mudar para Nome Completo</button>
        </header>
      </div>
    );
  }
  
  export default App;
 */
