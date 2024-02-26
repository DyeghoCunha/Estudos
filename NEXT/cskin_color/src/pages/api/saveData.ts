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
  if (req.method === 'POST') {
    const itemWithColor = req.body;

    // Crie uma nova instância do modelo WeaponSkin
    
    const weaponSkin = new WeaponSkin(itemWithColor);

    // Salve a instância no banco de dados
    try {
      await weaponSkin.save();
      res.status(200).json({ message: 'Dados salvos com sucesso no MongoDB!' });
    } catch (error) {
      console.error('Erro ao salvar no MongoDB:', error);
      res.status(500).json({ message: 'Erro ao salvar no MongoDB.' });
    }
  } else {
    res.status(405).json({ message: 'Método não permitido.' });
  }
}
