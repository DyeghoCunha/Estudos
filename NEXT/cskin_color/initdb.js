"use server"
const sql = require('better-sqlite3');
const db = sql('itemsWithColor.db');

const dummyItemsWithColor = [
      {
         id: "skin-66720",
         name: "Desert Eagle | Meteorito",
         image: "https://raw.githubusercontent.com/ByMykel/counter-strike-image-tracker/main/static/panorama/images/econ/default_generated/weapon_deagle_am_crystallized_dark_light_png.png",
         color: [
            "#403E36",
            "#1C1813",
            "#110F0B"
         ],
         colorHsl: [
            {
               "h": 48,
               "s": 8.47,
               "l": 23.14
            },
            {
               "h": 33,
               "s": 19.15,
               "l": 9.22
            },
            {
               "h": 40,
               "s": 21.43,
               "l": 5.49
            }
         ],
         colorName: [
            "Amarelo",
            "Laranja",
            "Laranja"
         ]
      },
      {
         id: "skin-66848",
         name: "Desert Eagle | Canhão Portátil",
         image: "https://raw.githubusercontent.com/ByMykel/counter-strike-image-tracker/main/static/panorama/images/econ/default_generated/weapon_deagle_aq_handcannon_light_png.png",
         color: [
            "#536A5D",
            "#293631",
            "#192524"
         ],
         colorHsl: [
            {
               "h": 146,
               "s": 12.17,
               "l": 37.06
            },
            {
               "h": 157,
               "s": 13.68,
               "l": 18.63
            },
            {
               "h": 175,
               "s": 19.35,
               "l": 12.16
            }
         ],
         colorName: [
            "Verde",
            "Verde",
            "Azul"
         ]
      },
      {
         id: "skin-66924",
         name: "Desert Eagle | Piloto",
         image: "https://raw.githubusercontent.com/ByMykel/counter-strike-image-tracker/main/static/panorama/images/econ/default_generated/weapon_deagle_aq_pilot_deagle_light_png.png",
         color: [
            "#716F68",
            "#514532",
            "#363430"
         ],
         colorHsl: [
            {
               "h": 47,
               "s": 4.15,
               "l": 42.55
            },
            {
               "h": 37,
               "s": 23.66,
               "l": 25.69
            },
            {
               "h": 40,
               "s": 5.88,
               "l": 20
            }
         ],
         colorName: [
            "Amarelo",
            "Laranja",
            "Laranja"
         ]
      },
      {
         id: "skin-66940",
         name: "Desert Eagle | Conspiração",
         image: "https://raw.githubusercontent.com/ByMykel/counter-strike-image-tracker/main/static/panorama/images/econ/default_generated/weapon_deagle_cu_deagle_aureus_light_png.png",
         color: [
            "#5A574B",
            "#3E3C37",
            "#2A2A27"
         ],
         colorHsl: [
            {
               "h": 48,
               "s": 9.09,
               "l": 32.35
            },
            {
               "h": 43,
               "s": 5.98,
               "l": 22.94
            },
            {
               "h": 60,
               "s": 3.7,
               "l": 15.88
            }
         ],
         colorName: [
            "Amarelo",
            "Laranja",
            "Amarelo"
         ]
      },
      {
         id: "skin-67124",
         name: "Desert Eagle | Naga",
         image: "https://raw.githubusercontent.com/ByMykel/counter-strike-image-tracker/main/static/panorama/images/econ/default_generated/weapon_deagle_aq_deagle_naga_light_png.png",
         color: [
            "#6A6B62",
            "#3D372E",
            "#302E27"
         ],
         colorHsl: [
            {
               "h": 67,
               "s": 4.39,
               "l": 40.2
            },
            {
               "h": 36,
               "s": 14.02,
               "l": 20.98
            },
            {
               "h": 47,
               "s": 10.34,
               "l": 17.06
            }
         ],
         colorName: [
            "Amarelo",
            "Laranja",
            "Amarelo"
         ]
      },
      {
         id: "skin-67416",
         name: "Desert Eagle | Tempestade do Pôr do Sol 弐",
         image: "https://raw.githubusercontent.com/ByMykel/counter-strike-image-tracker/main/static/panorama/images/econ/default_generated/weapon_deagle_am_seastorm_shojo_light_png.png",
         color: [
            "#7B3C30",
            "#501B15",
            "#321412"
         ],
         colorHsl: [
            {
               "h": 10,
               "s": 43.86,
               "l": 33.53
            },
            {
               "h": 6,
               "s": 58.42,
               "l": 19.8
            },
            {
               "h": 4,
               "s": 47.06,
               "l": 13.33
            }
         ],
         colorName: [
            "Vermelho",
            "Vermelho",
            "Vermelho"
         ]
      },
      {
         id: "skin-67412",
         name: "Desert Eagle | Tempestade do Pôr do Sol 壱",
         image: "https://raw.githubusercontent.com/ByMykel/counter-strike-image-tracker/main/static/panorama/images/econ/default_generated/weapon_deagle_am_seastorm_blood_light_png.png",
         color: [
            "#7B3C30",
            "#511C15",
            "#331512"
         ],
         colorHsl: [
            {
               "h": 10,
               "s": 43.86,
               "l": 33.53
            },
            {
               "h": 7,
               "s": 58.82,
               "l": 20
            },
            {
               "h": 5,
               "s": 47.83,
               "l": 13.53
            }
         ],
         colorName: [
            "Vermelho",
            "Vermelho",
            "Vermelho"
         ]
      },
      {
         id: "skin-67236",
         name: "Desert Eagle | Decó Bronze",
         image: "https://raw.githubusercontent.com/ByMykel/counter-strike-image-tracker/main/static/panorama/images/econ/default_generated/weapon_deagle_am_bronze_sparkle_light_png.png",
         color: [
            "#5D5A52",
            "#3E2F1A",
            "#282622"
         ],
         colorHsl: [
            {
               "h": 44,
               "s": 6.29,
               "l": 34.31
            },
            {
               "h": 35,
               "s": 40.91,
               "l": 17.25
            },
            {
               "h": 40,
               "s": 8.11,
               "l": 14.51
            }
         ],
         colorName: [
            "Laranja",
            "Laranja",
            "Laranja"
         ]
      },
      {
         id: "skin-67408",
         name: "Desert Eagle | Tempestade da Meia-noite",
         image: "https://raw.githubusercontent.com/ByMykel/counter-strike-image-tracker/main/static/panorama/images/econ/default_generated/weapon_deagle_am_seastorm_light_png.png",
         color: [
            "#4C7072",
            "#273D3D",
            "#1B2828"
         ],
         colorHsl: [
            {
               "h": 237,
               "s": 20,
               "l": 37.25
            },
            {
               "h": 180,
               "s": 22,
               "l": 19.61
            },
            {
               "h": 180,
               "s": 19.4,
               "l": 13.14
            }
         ],
         colorName: [
            "Azul",
            "Azul",
            "Azul"
         ]
      },
      {
         id: "skin-67572",
         name: "Desert Eagle | Corintiano",
         image: "https://raw.githubusercontent.com/ByMykel/counter-strike-image-tracker/main/static/panorama/images/econ/default_generated/weapon_deagle_aq_deagle_corinthian_light_png.png",
         color: [
            "#564438",
            "#2D2017",
            "#221810"
         ],
         colorHsl: [
            {
               "h": 24,
               "s": 21.13,
               "l": 27.84
            },
            {
               "h": 25,
               "s": 32.35,
               "l": 13.33
            },
            {
               "h": 27,
               "s": 36,
               "l": 9.8
            }
         ],
         colorName: [
            "Laranja",
            "Laranja",
            "Laranja"
         ]
      }
];

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

export async function initData(itemWithColor) {
   const stmt = db.prepare(`
      INSERT INTO itemsWithColor VALUES (
         @id,
         @name,
         @image,
         @color,
         @colorHsl,
         @colorName
      )
   `);


   for (const skin of itemWithColor) {
      stmt.run({
         id: skin.id,
         name: skin.name,
         image: skin.image,
         color: JSON.stringify(skin.color),
         colorHsl: JSON.stringify(skin.colorHsl),
         colorName: JSON.stringify(skin.colorName)
      });
   }
}
//initData();