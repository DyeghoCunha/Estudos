import { useState } from "react";
import Banner from "./componentes/Banner";
import Formulario from "./componentes/Formulario";
import Rodape from "./componentes/Rodape";
import Time from "./componentes/Time";
import { v4 as uuidv4 } from 'uuid';

function App() {

  const [times, setTimes] = useState([
    {
      id: uuidv4(),
      nome: 'Programação',
      cor: '#57C278'
    },
    {
      id: uuidv4(),
      nome: 'Front-End',
      cor: '#82CFFA'
    },
    {
      id: uuidv4(),
      nome: 'Data Science',
      cor: '#A6D157'
    },
    {
      id: uuidv4(),
      nome: 'Devops',
      cor: '#E06B69'
    },
    {
      id: uuidv4(),
      nome: 'UX e Design',
      cor: '#DB6EBF'
    },
    {
      id: uuidv4(),
      nome: 'Mobile',
      cor: '#FFBA05'
    },
    {
      id: uuidv4(),
      nome: 'Inovação e Gestão',
      cor: '#FF8A29'
    },
  ])

  const inicial = [
    {
      id: uuidv4(),
      favorito:false,
      nome: 'DYEGHO CUNHA',
      cargo: 'Desenvolvedor React.Js',
      imagem: 'http://github.com/dyeghocunha.png',
      time: times[0].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'SAMUEL F DUARTE',
      cargo: 'Arquiteto JAVA na Lambda3',
      imagem: 'https://media.licdn.com/dms/image/C4D03AQEMTRbA7Ss9fQ/profile-displayphoto-shrink_800_800/0/1557338314922?e=1687392000&v=beta&t=7kZIkAXufLkCTaeE60Y7EmRkcAlMcudC5wAuRMbptpI',
      time: times[0].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'ERIC ARAUJO',
      cargo: 'Desenvolvedor Python',
      imagem: '	https://github.com/EricFAraujo.png',
      time: times[0].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'JONAS ALVES',
      cargo: 'Hacker e sem Foto',
      imagem: 'https://github.com/JonasAlv.png',
      time: times[0].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'DYEGHO CUNHA',
      cargo: 'Desenvolvedor React.Js',
      imagem: 'http://github.com/dyeghocunha.png',
      time: times[1].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'SAMUEL F DUARTE',
      cargo: 'Arquiteto JAVA na Lambda3',
      imagem: 'https://media.licdn.com/dms/image/C4D03AQEMTRbA7Ss9fQ/profile-displayphoto-shrink_800_800/0/1557338314922?e=1687392000&v=beta&t=7kZIkAXufLkCTaeE60Y7EmRkcAlMcudC5wAuRMbptpI',
      time: times[1].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'ERIC ARAUJO',
      cargo: 'Desenvolvedor Python',
      imagem: '	https://github.com/EricFAraujo.png',
      time: times[1].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'JONAS ALVES',
      cargo: 'Hacker e sem Foto',
      imagem: 'https://github.com/JonasAlv.png',
      time: times[1].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'DYEGHO CUNHA',
      cargo: 'Desenvolvedor React.Js',
      imagem: 'http://github.com/dyeghocunha.png',
      time: times[2].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'SAMUEL F DUARTE',
      cargo: 'Arquiteto JAVA na Lambda3',
      imagem: 'https://media.licdn.com/dms/image/C4D03AQEMTRbA7Ss9fQ/profile-displayphoto-shrink_800_800/0/1557338314922?e=1687392000&v=beta&t=7kZIkAXufLkCTaeE60Y7EmRkcAlMcudC5wAuRMbptpI',
      time: times[2].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'ERIC ARAUJO',
      cargo: 'Desenvolvedor Python',
      imagem: 'https://github.com/EricFAraujo.png',
      time: times[2].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'JONAS ALVES',
      cargo: 'Hacker e sem Foto',
      imagem: 'https://github.com/JonasAlv.png',
      time: times[2].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'DYEGHO CUNHA',
      cargo: 'Desenvolvedor React.Js',
      imagem: 'http://github.com/dyeghocunha.png',
      time: times[3].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'SAMUEL F DUARTE',
      cargo: 'Arquiteto JAVA na Lambda3',
      imagem: 'https://media.licdn.com/dms/image/C4D03AQEMTRbA7Ss9fQ/profile-displayphoto-shrink_800_800/0/1557338314922?e=1687392000&v=beta&t=7kZIkAXufLkCTaeE60Y7EmRkcAlMcudC5wAuRMbptpI',
      time: times[3].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'ERIC ARAUJO',
      cargo: 'Desenvolvedor Python',
      imagem: 'https://github.com/EricFAraujo.png',
      time: times[3].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'JONAS ALVES',
      cargo: 'Hacker e sem Foto',
      imagem: 'https://github.com/JonasAlv.png',
      time: times[3].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'DYEGHO CUNHA',
      cargo: 'Desenvolvedor React.Js',
      imagem: 'http://github.com/dyeghocunha.png',
      time: times[4].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'SAMUEL F DUARTE',
      cargo: 'Arquiteto JAVA na Lambda3',
      imagem: 'https://media.licdn.com/dms/image/C4D03AQEMTRbA7Ss9fQ/profile-displayphoto-shrink_800_800/0/1557338314922?e=1687392000&v=beta&t=7kZIkAXufLkCTaeE60Y7EmRkcAlMcudC5wAuRMbptpI',
      time: times[4].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'ERIC ARAUJO',
      cargo: 'Desenvolvedor Python',
      imagem: '	https://github.com/EricFAraujo.png',
      time: times[4].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'JONAS ALVES',
      cargo: 'Hacker e sem Foto',
      imagem: 'https://github.com/JonasAlv.png',
      time: times[4].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'DYEGHO CUNHA',
      cargo: 'Desenvolvedor React.Js',
      imagem: 'http://github.com/dyeghocunha.png',
      time: times[5].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'SAMUEL F DUARTE',
      cargo: 'Arquiteto JAVA na Lambda3',
      imagem: 'https://media.licdn.com/dms/image/C4D03AQEMTRbA7Ss9fQ/profile-displayphoto-shrink_800_800/0/1557338314922?e=1687392000&v=beta&t=7kZIkAXufLkCTaeE60Y7EmRkcAlMcudC5wAuRMbptpI',
      time: times[5].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'ERIC ARAUJO',
      cargo: 'Desenvolvedor Python',
      imagem: 'https://github.com/EricFAraujo.png',
      time: times[5].nome
    },
    {
      id: uuidv4(),
      favorito:false,
      nome: 'JONAS ALVES',
      cargo: 'Hacker e sem Foto',
      imagem: 'https://github.com/JonasAlv.png',
      time: times[5].nome
    },
  ]

  const [colaboradores, setColaboradores] = useState(inicial)

  function deletarColaborador(id) {
    setColaboradores(colaboradores.filter(colaborador => colaborador.id !== id))
  }

  function mudarCorDoTime(cor, id) {
    setTimes(times.map(time => {
      if (time.id === id) {
        time.cor = cor

      }
      return time
    }))
  }

  function cadastrarTime(novoTime){
    setTimes([...times,{...novoTime, id: uuidv4()}])

  }
  
  function resolverFavorito(id){
    setColaboradores(colaboradores.map (colaborador=>{
      if(colaborador.id === id) colaborador.favorito = !colaborador.favorito;
      return colaborador
    }))

  }


  return (
    <div>
      <Banner />
      <Formulario
        cadastrarTime ={cadastrarTime}
        times={times.map(time => time.nome)}
        aoCadastrar={colaborador => setColaboradores([...colaboradores, colaborador])}
      />
      <section className="times">
        <h1>Minha organização</h1>
        {times.map((time, indice) =>
          <Time
            aoFavoritar={resolverFavorito}
            mudarCor={mudarCorDoTime}
            key={indice}
            time={time}
            colaboradores={colaboradores.filter(colaborador => colaborador.time === time.nome)}
            aoDeletar={deletarColaborador}
          />
        )}
      </section>
      <Rodape />
    </div>
  );
}

export default App;
