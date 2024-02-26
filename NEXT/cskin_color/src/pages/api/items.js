import { initData } from "../../../initdb.js";
import { saveItemWithColor } from "../../lib/itemsWithColor.js"

export default async function handler(req, res) {
  if (req.method === 'POST') {
    try {
      const itemWithColor = req.body;
      await initData(itemWithColor)
      //await saveItemWithColor(itemWithColor);
      res.status(200).json({ message: 'Item salvo com sucesso!' });
    } catch (error) {
      console.error('Erro ao salvar o item:', error);
      res.status(500).json({ message: 'Erro ao salvar o item', error: error.message });
    }
  } else {
    res.status(405).json({ message: 'Método não permitido' });
  }
}
