"use server"
import connectDB from './db';
import WeaponSkin from './itemsColorSchema';
import { saveItemWithColor } from "../lib/itemsWithColor.js"

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

connectDB();

const saveData = (itemWithColor) => {
  // Crie uma nova instância do modelo WeaponSkin

  for(const item in itemWithColor){
      const weaponSkin = new WeaponSkin(item);

  // Salve a instância no banco de dados
  weaponSkin.save((error) => {
    if (error) {
      console.error('Erro ao salvar no MongoDB:', error);
    } else {
      console.log('Dados salvos com sucesso no MongoDB!');
    }
  });
  }

};

export  {saveData}