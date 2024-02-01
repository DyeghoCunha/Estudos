import { Color, ColorList, Pixel, WeaponType } from '@/types/types';
import { createContext, useContext, useState, useEffect } from 'react';
import axios from "axios";


interface IWeaponContext {
  skins: WeaponType[];
  setSkins: React.Dispatch<React.SetStateAction<WeaponType[]>>;
buildPalette:any
 quantization:any;
 buildRgb:any;
 colorList:any;

}
const WeaponContext = createContext<IWeaponContext | undefined>(undefined);

export function WeaponProvider({ children }: { children: React.ReactNode }) {

  const [skins, setSkins] = useState<WeaponType[]>([]);


  useEffect(() => {
    async function getSkins() {
      try {
        const response = await axios.get(
          "https://bymykel.github.io/CSGO-API/api/pt-BR/skins.json"
        );
        const weaponTypes: WeaponType[] = response.data.map((skin: any) => ({
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
        
        setSkins(weaponTypes);

      } catch (error) {
        console.error(error);
      }
    }

    getSkins();
  }, []);

  //!!___ColorList

  const [colorList, setColorList] = useState<string[]>([])

  const buildPalette = (colorsList: Color[]) => {
    const orderedByColor = orderByLuminance(colorsList);
    let tempColors:any = []; // Variável temporária para armazenar as cores

    for (let i = 0; i < orderedByColor.length; i++) {
      // Se já tivermos 6 cores, interrompemos o loop
      if (tempColors.length >= 6) {
        break;
      }

      const hexColor:any = rgbToHex(orderedByColor[i]);

      const hslColors: Color[] = convertRGBtoHSL(orderedByColor)
        .map(color => ({
          h: color.h,
          s: parseFloat(color.s),
          l: parseFloat(color.l),
        }));

      if (i > 0) {
        const difference = calculateColorDifference(
          orderedByColor[i],
          orderedByColor[i - 1]
        );

        if (difference < 120) {
          continue;
        }
      }

      tempColors.push(hexColor); // Adicione a cor à variável temporária
    }
    setColorList(tempColors); // Atualize o estado uma vez após o loop
  };


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
      const satur: number = saturation * 100;
      const saturString: any = satur.toString;
      const lumin: number = luminance * 100;
      const luminString: any = lumin.toString;

      return {
        h: Math.round(hue) + 180,
        s: parseFloat(saturString).toFixed(2),
        l: parseFloat(luminString).toFixed(2),
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


  //!!____________


return (
  <WeaponContext.Provider value ={{skins,setSkins, buildPalette,buildRgb,quantization,colorList}}>
    {children}
  </WeaponContext.Provider>
)

}

export const useWeaponContext = () => {
  const context = useContext(WeaponContext);
  if (!context) {
    throw new Error("useWeaponContext deve ser utilizado dentro de um WeaponProvider");
  }
  return context;
};