import { CgCloseR } from 'react-icons/cg'
import { IoMdCloseCircleOutline } from 'react-icons/io'
import { AiFillHeart, AiOutlineHeart } from 'react-icons/ai'


import './colaborador.css'

const Colaborador = ({ colaborador, corDeFundo, aoDeletar, corDoIcone, aoFavoritar }) => {
    const cor = { color: corDoIcone }
    function favoritar() {
        aoFavoritar(colaborador.id)
    }

    const propsfavorito = {
        size: 25,
        onClick: favoritar
    }




    return (<div className="colaborador">
        <CgCloseR
            size={25}
            className='deletar'
            style={cor}
            onClick={() => aoDeletar(colaborador.id)}
        />
        <div className="cabecalho" style={{ backgroundColor: corDeFundo }}>
            <img src={colaborador.imagem} alt={colaborador.nome} />
        </div>
        <div className="rodape">
            <h4>{colaborador.nome}</h4>
            <h5>{colaborador.cargo}</h5>
            <div className='favoritar'>
                {colaborador.favorito
                // {...propsfavorito} Esta eh a forma de passar um objeto como parametro, fazendo um SPREAD
                    ? <AiFillHeart {...propsfavorito} color={corDeFundo} />
                    : <AiOutlineHeart {...propsfavorito}/>
                }
            </div>
        </div>
    </div>)// alteracao de comiit

}

export default Colaborador