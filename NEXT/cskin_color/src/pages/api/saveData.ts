// pages/api/saveData.ts
import type { NextApiRequest, NextApiResponse } from 'next'
import connectDB from '../../lib/db';
import WeaponSkin from '../../lib/itemsColorSchema';

// Conecte-se ao banco de dados
connectDB();
export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {

  if (req.method === 'GET') {
    try {
      const items = await WeaponSkin.find(); // busca todos os itens
      res.status(200).json(items); // retorna os itens
    } catch (error) {
      console.error('Erro ao buscar no MongoDB:', error);
      res.status(500).json({ message: 'Erro ao buscar no MongoDB.' });
    }
  } else {
    res.status(405).json({ message: 'Método não permitido.' });
  }

  if (req.method === 'POST') {
    const itemWithColor = req.body;

    // Atualize o documento existente ou crie um novo
    try {
      await WeaponSkin.findOneAndUpdate(
        { id: itemWithColor.id }, // encontre um documento com este id
        itemWithColor, // os dados para atualizar
        { upsert: true, new: true, runValidators: true } // opções
      );
      res.status(200).json({ message: 'Dados salvos com sucesso no MongoDB!' });
    } catch (error) {
      console.error('Erro ao salvar no MongoDB:', error);
      res.status(500).json({ message: 'Erro ao salvar no MongoDB.' });
    }
  } else {
    res.status(405).json({ message: 'Método não permitido.' });
  }
}

