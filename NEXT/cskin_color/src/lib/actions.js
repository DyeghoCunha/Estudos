"use server"
import connectDB from './db';
import WeaponSkin from './itemsColorSchema';

export async function saveItem(itemWithColor) {
  const item = {
    id: itemWithColor.get("id"),
    name: itemWithColor.get("name"),
    image: itemWithColor.get("image"),
    color: itemWithColor.get("color"),
    colorHsl: itemWithColor.get("colorHsl"),
    colorName: itemWithColor.get("colorName"),
  }

  await saveItemWithColor(item);
}

export default async function saveAllItemWithColor(itemWithColor) {
  if (itemWithColor) {
    try {
      const promises = itemWithColor.map(saveItem);
      await Promise.all(promises);
      console.log('Todos os itens foram salvos com sucesso!');
    } catch (error) {
      console.error('Ocorreu um erro ao salvar os itens:', error);
    }
  }
}


export async function sendData(itemWithColor) {

  const response = await fetch('/api/saveData', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(itemWithColor),
  });

  if (response.ok) {
    console.log('Dados enviados com sucesso!');
  } else {
    console.error('Erro ao enviar dados:', response.statusText);
  }
}


