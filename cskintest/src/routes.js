
import PaginaInicial from './Paginas/PaginaInicial';
import './styles/estilosGlobais.scss'

import { BrowserRouter, Route, Routes } from 'react-router-dom';
export default function AppRoutes() {
  return (
    <BrowserRouter>
                 <Routes>
                  <Route path="/" element={<PaginaInicial />} />
                </Routes>
    </BrowserRouter>
  );
}
