export class WeaponType {
  id: string;
  name: string;
  name_original: string;
  description: string;
  weapon: string;
  pattern: string;
  min_float: number;
  max_float: number;
  rarity: string;
  stattrak: boolean;
  image: string;
  color: string[]

  constructor(id: string, name: string, name_original: string, description: string, weapon: string, pattern: string, min_float: number, max_float: number, rarity: string,
    stattrak: boolean, image: string, color: string[]) {
    this.id = id;
    this.name = name;
    this.name_original = name_original;
    this.description = description;
    this.weapon = weapon;
    this.pattern = pattern;
    this.min_float = min_float;
    this.max_float = max_float;
    this.rarity = rarity;
    this.stattrak = stattrak;
    this.image = image;
    this.color = color
  }
}




export type Color = {
  h: number;
  s: number;
  l: number;
};

export type Pixel = {
  r: number;
  g: number;
  b: number;
};


export class ColorList {
  colorList: string[];

  constructor(colorList: string[]) {
    this.colorList = colorList;
  }
}