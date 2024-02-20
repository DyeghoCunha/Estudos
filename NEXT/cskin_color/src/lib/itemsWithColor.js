"use server"
import sql from "better-sqlite3"

const db = sql("itemsWithColor.db");

export async function getItens() {
  return db.prepare("SELECT * FROM itemsWithColor").all();
}

export function getItemByName(name) {
  return db.prepare("SELECT * FROM itemsWithColor WHERE name = ?").get(name)
}

export async function saveItemWithColor(itemWithColor) {
  const tableExists = db.prepare(`
    SELECT name FROM sqlite_master WHERE type='table' AND name='itemsWithColor';
  `).get();

  if (!tableExists) {
    db.prepare(`
      CREATE TABLE IF NOT EXISTS itemsWithColor (
        id TEXT PRIMARY KEY,
        name TEXT ,
        image TEXT ,
        color TEXT ,
        colorHsl TEXT ,
        colorName TEXT 
      )
    `).run();
  }

  db.prepare(`
    INSERT OR REPLACE INTO itemsWithColor (id,name,image,color,colorHsl,colorName)
    VALUES(
      @id,
      @name,
      @image,
      @color,
      @colorHsl,
      @colorName
    )
  `).run({
    id: itemWithColor.id,
    name: itemWithColor.name,
    image: itemWithColor.image,
    color: JSON.stringify(itemWithColor.color),
    colorHsl: JSON.stringify(itemWithColor.colorHsl),
    colorName: JSON.stringify(itemWithColor.colorName)
  });
}
