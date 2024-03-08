"use server"

import {IItemType} from "../types/types"
import axios from 'axios';

export async function getSkins() {
  try {
    const response = await axios.get(
      "https://bymykel.github.io/CSGO-API/api/pt-BR/stickers.json"
    );
    const skin: IItemType[] = response.data.map((skin: any) => ({
      id: skin.id,
      name: skin.name,
      name_original: skin.name_original,
      description: skin.description,
      weapon: skin.weapon,
      pattern: skin.pattern,
      min_float: skin.min_float,
      max_float: skin.max_float,
      rarity: skin.rarity,
      stattrak: skin.stattrak,
      image: skin.image,
    }));

    return skin;
  } catch (error) {
    console.error(error);
    return [];
  }
}
