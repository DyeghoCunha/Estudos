import React, { useContext, useEffect } from 'react'
import styles from './PaginaInicial.module.scss'
import CardOffice from '../../components/Card/CardMain/CardOffice';
import Arma from "../../components/Card/CardMain/CardOffice/image/arma.png"

export default function PaginaInicial() {


  useEffect(() => {
    window.scrollTo(0, 300);
  }, [])
  //console.log("Pagina Inicial: ", objetos)
  return (
    <>

      <div className={styles.container}>
          <>
   <CardOffice frase={"Teste"} nome={"Teste 2"} imagem={Arma}/>
          </>
      </div>
    </>
  )
}
