import sql from "better-sqlite3"
import fs from "node:fs"

const db = sql("itemsWithColor.db");

export async function getItens() {
  await new Promise((resolve) => setTimeout(resolve, 1000));
  return db.prepare("SELECT * FROM itemsWithColor").all();
}

export function getItemByName(name) {
  return db.prepare("SELECT * FROM itemsWithColor WHERE name = ?").get(name)
}

export async function saveItemWithColor(itemWithColor) {
   const fileName = `${itemWithColor.name}.png`

  const stream = fs.createWriteStream(`public/images/${fileName}`)
  const bufferedImage = await itemWithColor.image.arrayBuffer();
  stream.write(Buffer.from(bufferedImage), (error) => {
    if (error) {
      throw new Error("saving image failed!!")
    }
  });


  itemWithColor.image = `public/images/${fileName}`
  console.log(itemWithColor.image)
  db.prepare(`
  INSERT INTO itemsWithColor (id,name,image,color,colorHsl,colorName)
  VALUES(
    @id,
    @name,
    @image,
    @color,
    @colorHsl,
    @colorName
  )
  `).run(itemWithColor);
}