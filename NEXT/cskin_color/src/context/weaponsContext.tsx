"use server"
import { Color, ColorList, Pixel, IItemType, IItemWithColor, ColorName } from '@/types/types';
import { createContext, useContext, useState, useEffect } from 'react';
import axios from "axios";
import { lab } from 'd3-color';
import { Delaunay } from 'd3-delaunay';
import { getSkins } from '@/lib/steamDb';




interface IItemContext {
  skins: IItemType[];
  setSkins: React.Dispatch<React.SetStateAction<IItemType[]>>;
  itemWithColor: ItemWithColor[];
  buildPalette: any
  quantization: any;
  buildRgb: any;
  loadImageFromCanvas: Function;
  allColorsHEX: any
  groupColorsFinal: any;
  similarColors: any;
  sortedColorGroups: any;
  weaponFromDb:IItemWithColor[];
  isLoading:boolean;
}
const ItemContext = createContext<IItemContext | undefined>(undefined);



class WeaponWithColor implements IItemWithColor {

  id: string;
  name: string;
  image: string;
  color: Array<string>;
  colorHsl: Color[];
  colorName: string[];
  constructor(id: string, name: string, image: string, color: Array<string>, colorHsl: Color[], colorName: string[]) {
    this.id = id;
    this.name = name;
    this.image = image;
    this.color = color;
    this.colorHsl = colorHsl
    this.colorName = colorName
  }
}
export class ItemWithColor implements IItemWithColor {
  id: string;
  name: string;
  image: string;
  color: string[];
  colorHsl: Color[];
  colorName: ColorName[];
  constructor(id: string, name: string, image: string, color: string[], colorHsl: Color[], colorName: ColorName[]) {
    this.id = id,
      this.name = name;
    this.image = image;
    this.color = color;
    this.colorHsl = colorHsl
    this.colorName = colorName;
  }
}

export function ItemColorProvider({ children }: { children: React.ReactNode }) {

  const [skins, setSkins] = useState<IItemType[]>([]);
  const [weaponsWithColor, setWeaponsWithColor] = useState<WeaponWithColor[]>([]);
  const [itemWithColor, setItemWithColor] = useState<ItemWithColor[]>([]);
  const [colorList, setColorList] = useState<Array<ItemWithColor>>([]);//? é este o safadooo
  const [colorName, setColorName] = useState<ColorName[]>([])
  const [allColorsHSL, setAllColorsHSL] = useState<Array<Color>>([])
  const [allColorsHEX, setAllColorsHEX] = useState<Array<ItemWithColor>>([])
  const [groupColorsFinal, setGroupColorsFinal] = useState<{ [key: string]: HSLColor[] }>({})
  const [similarColors, setSimilarColors] = useState();
  const [sortedColorGroups, setSortedColorGroups] = useState({})
  const [isLoading, setIsLoading] = useState(true);
  const [weaponFromDb, setWeaponFromDb] = useState<IItemWithColor[]>([])

  useEffect(() => {
    async function fetchSkins() {
      const skins = await getSkins();
      setSkins(skins);
      //console.log(skins);
    }
    fetchSkins();
  }, []);

  useEffect(() => {
  fetch('/api/saveData')
    .then(response => response.json())
    .then(data => {setWeaponFromDb(data)
      console.log(data);
    setIsLoading(false)})
    .catch(error => console.error('Erro ao buscar no MongoDB:', error));
}, []);


  async function loadImageFromCanvas(imageUrl: string, canvasRef: React.RefObject<HTMLCanvasElement>, skins: any) {
    const image = new Image();
    image.crossOrigin = "anonymous";
    image.onload = async () => {
      const canvas = canvasRef.current;
      if (canvas) {
        const ctx = canvas.getContext('2d', { willReadFrequently: true });
        ctx!.drawImage(image, 0, 0, canvas.width, canvas.height);
        const imageData = ctx!.getImageData(0, 0, canvas.width, canvas.height);
        const rgbArray = buildRgb(imageData.data);
        const quantColors = quantization(rgbArray, 0);
        buildPalette(quantColors, skins);
      }
    };
    image.src = imageUrl;
  };

  const buildPalette = (colorsList: Color[], skins: any) => {
    const orderedByColor = orderByLuminance(colorsList);
    let tempColors: any = [];
    let _hslColors: Color[] = []
    let _colorName: ColorName[] = []
    for (let i = 0; i < orderedByColor.length; i++) {
      if (tempColors.length >= 3) {
        break;
      }

      const hexColor: any = rgbToHex(orderedByColor[i]);

      const hslColor: any = convertRGBtoHSL([orderedByColor[i]])[0];

      if (i > 0) {
        const difference = calculateColorDifference(
          orderedByColor[i],
          orderedByColor[i - 1]
        );

        if (difference < 120) {
          continue;
        }
      }

      // setAllColorsHSL(prev => [...prev, hslColor])
      setAllColorsHEX(prev => [...prev, hexColor])
      //TODO Refinar a função de Nomes para HSL
      tempColors.push(hexColor);
      _hslColors.push(hslColor);
      _colorName.push(colorNameFromHsl(hslColor.h, hslColor.s, hslColor.l)); // Adicionado esta linha
    }

    const newItemWithColor: any = new ItemWithColor(skins.id, skins.name, skins.image, tempColors, _hslColors, _colorName)
    setColorList(prevArray => [...prevArray, newItemWithColor]);
  };


  useEffect(() => {
    const uniqueItem = colorList.reduce((acc: ItemWithColor[], current: ItemWithColor) => {
      const isDuplicate = acc.find(item => item.id === current.id);
      if (!isDuplicate) {
        return acc.concat([current]);
      } else {
        return acc;
      }
    }, []);

    setItemWithColor(uniqueItem);
  }, [colorList]);

  const rgbToHex = (pixel: Pixel) => {
    const componentToHex = (c: number) => {
      const hex = c.toString(16);
      return hex.length == 1 ? "0" + hex : hex;
    };

    return (
      "#" +
      componentToHex(pixel.r) +
      componentToHex(pixel.g) +
      componentToHex(pixel.b)
    ).toUpperCase();
  };

  const convertRGBtoHSL = (rgbValues: Pixel[]) => {
    return rgbValues.map((pixel: Pixel) => {
      let hue = 0,
        luminance = 0;
      let saturation: number = 0

      let redOpposite = pixel.r / 255;
      let greenOpposite = pixel.g / 255;
      let blueOpposite = pixel.b / 255;
      const Cmax = Math.max(redOpposite, greenOpposite, blueOpposite);
      const Cmin = Math.min(redOpposite, greenOpposite, blueOpposite);
      const difference = Cmax - Cmin;
      luminance = (Cmax + Cmin) / 2.0;
      if (difference !== 0) {
        if (luminance <= 0.5) {
          saturation = difference / (Cmax + Cmin);
        } else if (luminance >= 0.5) {
          saturation = difference / (2.0 - Cmax - Cmin);
        }
      }
      const maxColorValue = Math.max(pixel.r, pixel.g, pixel.b);

      if (maxColorValue === pixel.r) {
        hue = (greenOpposite - blueOpposite) / difference;
      } else if (maxColorValue === pixel.g) {
        hue = 2.0 + (blueOpposite - redOpposite) / difference;
      } else {
        hue = 4.0 + (greenOpposite - blueOpposite) / difference;
      }

      hue = hue * 60;

      if (hue < 0) {
        hue = hue + 360;
      }


      return {
        h: Math.round(hue),
        s: parseFloat((saturation * 100).toFixed(2)),
        l: parseFloat((luminance * 100).toFixed(2)),
      };
    });
  };

  const orderByLuminance = (rgbValues: any) => {
    const calculateLuminance = (p: any) => {
      return 0.2126 * p.r + 0.7152 * p.g + 0.0722 * p.b;
    };

    return rgbValues.sort((p1: any, p2: any) => {
      return calculateLuminance(p2) - calculateLuminance(p1);
    });
  };

  const buildRgb = (imageData: any) => {
    const rgbValues = [];

    for (let i = 0; i < imageData.length; i += 4) {
      const rgb = {
        r: imageData[i],
        g: imageData[i + 1],
        b: imageData[i + 2],
      };

      rgbValues.push(rgb);
    }

    return rgbValues;
  };

  const calculateColorDifference = (color1: any, color2: any) => {
    const rDifference = Math.pow(color2.r - color1.r, 2);
    const gDifference = Math.pow(color2.g - color1.g, 2);
    const bDifference = Math.pow(color2.b - color1.b, 2);

    return rDifference + gDifference + bDifference;
  };

  const findBiggestColorRange = (rgbValues: any) => {

    let rMin = Number.MAX_VALUE;
    let gMin = Number.MAX_VALUE;
    let bMin = Number.MAX_VALUE;

    let rMax = Number.MIN_VALUE;
    let gMax = Number.MIN_VALUE;
    let bMax = Number.MIN_VALUE;

    rgbValues.forEach((pixel: any) => {
      rMin = Math.min(rMin, pixel.r);
      gMin = Math.min(gMin, pixel.g);
      bMin = Math.min(bMin, pixel.b);

      rMax = Math.max(rMax, pixel.r);
      gMax = Math.max(gMax, pixel.g);
      bMax = Math.max(bMax, pixel.b);
    });

    const rRange = rMax - rMin;
    const gRange = gMax - gMin;
    const bRange = bMax - bMin;

    const biggestRange = Math.max(rRange, gRange, bRange);
    if (biggestRange === rRange) {
      return "r";
    } else if (biggestRange === gRange) {
      return "g";
    } else {
      return "b";
    }
  };

  const quantization: any = (rgbValues: any, depth: any) => {
    const MAX_DEPTH = 4;

    // Base case
    if (depth === MAX_DEPTH || rgbValues.length === 0) {
      const color = rgbValues.reduce(
        (prev: any, curr: any) => {
          prev.r += curr.r;
          prev.g += curr.g;
          prev.b += curr.b;

          return prev;
        },
        {
          r: 0,
          g: 0,
          b: 0,
        }
      );

      color.r = Math.round(color.r / rgbValues.length);
      color.g = Math.round(color.g / rgbValues.length);
      color.b = Math.round(color.b / rgbValues.length);

      return [color];
    }

    const componentToSortBy = findBiggestColorRange(rgbValues);

    rgbValues.sort((p1: any, p2: any) => {
      return p1[componentToSortBy] - p2[componentToSortBy];
    });

    const mid = rgbValues.length / 2;
    return [
      ...quantization(rgbValues.slice(0, mid), depth + 1),
      ...quantization(rgbValues.slice(mid + 1), depth + 1),
    ];
  };


  function colorNameFromHsl(h: number, s: number, l: number): ColorName {
    if (l < 13) return "Preto";
    if (l > 80) return "Branco";
    if (s < 20) return "Cinza";

    if (h >= 0 && h < 15) return "Vermelho";
    else if (h >= 15 && h < 45) return "Laranja";
    else if (h >= 45 && h < 70) return "Amarelo";
    else if (h >= 70 && h < 170) return "Verde";
    else if (h >= 170 && h < 240) return "Azul";
    else if (h >= 240 && h < 280) return "Roxo";
    else if (h >= 280 && h < 320) return "Rosa";
    else if (h >= 320 && h < 360) return "Vermelho";

    if (h >= 15 && h < 50 && s > 0.2 && l < 0.5) return "Marrom";

    return "Cor não identificada";
  }


  class HSLColor implements Color {
    h: number;
    s: number;
    l: number;
    constructor(h: number, s: number, l: number) {
      this.h = h;
      this.s = s;
      this.l = l;
    }
  }
  /*
    function groupColors(hslColors: HSLColor[], hueThreshold: number, saturationThreshold: number, lightnessThreshold: number): { [key: string]: HSLColor[] } {
      let groups: { [key: string]: HSLColor[] } = {};
      for (let color of hslColors) {
        let addedToGroup = false;
        for (let groupName in groups) {
          let groupColor = groups[groupName][0];
          if (Math.abs(groupColor.h - color.h) < hueThreshold &&
            Math.abs(groupColor.s - color.s) < saturationThreshold &&
            Math.abs(groupColor.l - color.l) < lightnessThreshold) {
            // Verifique se a cor já existe no grupo
            if (!groups[groupName].some(groupColor => groupColor.h === color.h && groupColor.s === color.s && groupColor.l === color.l)) {
              groups[groupName].push(color);
            }
            addedToGroup = true;
            break;
          }
        }
        if (!addedToGroup) {
          let groupName = `Grupo ${Object.keys(groups).length + 1}`;
          groups[groupName] = [color];
        }
      }
      return groups;
    }
  
    /// Converte uma cor HSL para o espaço Lab
    function hslToLab(hsl: { h: number, s: number, l: number }) {
      const { h, s, l } = hsl;
      const color = `hsl(${h}, ${s}%, ${l}%)`;
      const { l: labL, a: labA, b: labB } = lab(color);
      return [labL, labA, labB];
    }
  
    // Agrupa cores semelhantes
    function groupSimilarColors(allColorsHSK: { h: number, s: number, l: number }[]) {
      // Converte todas as cores para o espaço Lab
      const labColors: any = allColorsHSK.map(hslToLab);
  
      // Cria uma triangulação de Delaunay com as cores
      const delaunay = Delaunay.from(labColors);
  
      // Agrupa cores semelhantes
      const groups = [];
      for (let i = 0; i < delaunay.triangles.length; i += 3) {
        const group = [
          allColorsHSK[delaunay.triangles[i]],
          allColorsHSK[delaunay.triangles[i + 1]],
          allColorsHSK[delaunay.triangles[i + 2]]
        ];
        groups.push(group);
      }
  
      return groups;
    }
  
    //!!______________________________________________________________________________________
    const [colorHSLArrays, setColorHSLArrays] = useState([]);
  
    useEffect(() => {
      const extractedColorHSL = itemWithColor.map(item => item.colorHsl);
      const flattenedColorHSL: any = extractedColorHSL.flat();
      setColorHSLArrays(flattenedColorHSL);
    }, [itemWithColor]);
  
    function removerArraysIdenticos(arr: any[]): any[] {
      return arr.filter((valor, indice, array) => {
        // Converte cada objeto para uma string JSON e verifica a ocorrência
        return array.findIndex(obj => JSON.stringify(obj) === JSON.stringify(valor)) === indice;
      });
    }
  
    //type Color = { h: number; s: number; l: number };
    type ColorGroup = { [key: string]: Color[] };
  
    function groupAndSortColors(colorArray: Color[]): ColorGroup {
      const colorNames = ["Vermelho", "Laranja", "Amarelo", "Verde claro", "Verde", "Verde-azulado", "Ciano", "Azul claro", "Azul", "Violeta", "Magenta", "Rosa"];
      const colorGroups: ColorGroup = {};
  
      // Agrupar cores por nome
      for (const color of colorArray) {
        const hue = color.h;
        const index = Math.floor(hue / 30);
        const colorName = colorNames[index];
  
        if (!colorGroups[colorName]) {
          colorGroups[colorName] = [];
        }
  
        colorGroups[colorName].push(color);
      }
  
      // Ordenar cada grupo do mais claro para o mais escuro
      for (const colorName in colorGroups) {
        colorGroups[colorName].sort((a, b) => b.l - a.l);
      }
  
      return colorGroups;
    }
  
   
  
  
  
    useEffect(() => {
      let hueThreshold = 20;  // Define o limiar de diferença de matiz para agrupar cores
      let saturationThreshold = 50;  // Define o limiar de diferença de saturação para agrupar cores
      let lightnessThreshold = 50;  // Define o limiar de diferença de luminosidade para agrupar cores
      let colorGroups = groupColors(colorHSLArrays, hueThreshold, saturationThreshold, lightnessThreshold);  // Define o limiar de diferença de matiz para agrupar cores
      setGroupColorsFinal(colorGroups)
      const groups: any = groupSimilarColors(colorHSLArrays);
      const fattenedGroups: any = groups.flat()
      const arraySemDuplicatas: any = removerArraysIdenticos(fattenedGroups)
      setSimilarColors(arraySemDuplicatas);
      const sortedColorGroup: any = groupAndSortColors(colorHSLArrays);
      setSortedColorGroups(sortedColorGroup)
  
     // console.log("___ColorHSLArrays___")
     // console.log(colorHSLArrays)
     // console.log("____________________\n\n")
    }, [colorHSLArrays])
  
  */




  return (
    <ItemContext.Provider value={{
      skins,
      setSkins,
      buildPalette,
      buildRgb,
      quantization,
      itemWithColor,
      loadImageFromCanvas,
      allColorsHEX,
      groupColorsFinal,
      similarColors,
      sortedColorGroups,
      weaponFromDb,
      isLoading,
    }}>
      {children}
    </ItemContext.Provider>
  )

}






export const useItemColorContext = () => {
  const context = useContext(ItemContext);
  if (!context) {
    throw new Error("useWeaponContext deve ser utilizado dentro de um WeaponProvider");
  }
  return context;
};