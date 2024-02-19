"use server"

import saveItemWithColor from "../lib/itemsWithColor.js"



export async function saveItem(itemWithColor) {
  // Certifique-se de que os campos do objeto correspondem aos campos esperados pela função saveItemWithColor
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