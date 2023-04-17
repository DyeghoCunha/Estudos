import './Colaborador.css'



//Desta Forma fica Desestruturado - eu achei mais facil de entender o codigo assim
const Colaborador = ({nome,imagem,cargo,corPrimaria}) =>{
 const css = { backgroundColor: corPrimaria}
  return(
    <div className='colaborador' >
      <div className='cabecalho'style={css}>
        <img src={imagem}alt={nome}/> 
      </div>
        <div className='rodape'>
        <h4>{nome}</h4>
        <h5>{cargo}</h5>
      </div>
    </div>

  )

}




/* const Colaborador = (props) =>{
  return(
    <div className='colaborador'>
      <div className='cabecalho'>
        <img src={props.imagem}alt=''/> 
      </div>
      <div className='rodape'>
        <h4>{props.nome}</h4>
        <h5>{props.cargo}</h5>
      </div>
    </div>

  )

}
 */

export default Colaborador