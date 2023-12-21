import React, { useEffect, useRef, useState } from 'react'
import { Card, CardHeader, CardBody, CardFooter, Heading, Stack, StackDivider, Box, Text, HStack, Grid, GridItem } from '@chakra-ui/react'
import ColorThief from 'colorthief'

const listaDeLinks = [
  "https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou6rwOANf1OD3fC0X09qzh5SCgfb4DL_Dn3tu5cB1g_zMyoD0mlOx5UY-ZGunJdOTIwQ8aQyFr1fqwe6805S-tZXIzXswsyR35HqOyUOzgE1SLrs4jFj6slg/",
  "https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou6rwOANf1OD3fC0X09qzh5SCgfb4DL_Dn3tu5cB1g_zMyoD0mlOx5UY-ZGunJdOTIwQ8aQyFr1fqwe6805S-tZXIzXswsyR35HqOyUOzgE1SLrs4jFj6slg/",
  "https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXA6Q1NL4kmrAlOA0_FVPCi2t_fUkRxNztUoreaLAJu1_LafDhQ5dmJgoGZnvb6J7-fkGhTsJFwi7vDrN-ijVXnr0c_Nj-hJYOXcA9oNVnX-1i9xu7r05e87YOJlyV49g3fNA/",
  "https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXA6Q1NL4kmrAlOA0_FVPCi2t_fUkRxNztUoreaLAJu1_LafDhQ5dmJgoGZnvb6J7-fkGhTsJFwi7vDrN-ijVXnr0c_Nj-hJYOXcA9oNVnX-1i9xu7r05e87YOJlyV49g3fNA/",
  "https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopbuyLgNv1fX3cih9_92hkYSEkfHLN77HmX5D7ddOh-zF_Jn4t1i1uRQ5fW-mLIWTdFQ8NV6G-QO4xLy8jcPqtZXOwHBrvnZw43fVyRDkiRFKarFxxavJcF3kHwA/",
  "https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopbuyLgNv1fX3cih9_92hkYSEkfHLN77HmX5D7ddOh-zF_Jn4t1i1uRQ5fW-mLIWTdFQ8NV6G-QO4xLy8jcPqtZXOwHBrvnZw43fVyRDkiRFKarFxxavJcF3kHwA/"
];

function ColorTest({ src }) {
  const imgRef = useRef(null)
  const [colors, setColors] = useState([])
  const [dominantColor, setDominantColor] = useState();

  useEffect(() => {
    if (imgRef.current) {
      const colorThief = new ColorThief()
      const img = imgRef.current
      img.crossOrigin = 'Anonymous'
      img.onload = () => {
        const palette = colorThief.getPalette(img, 3)
        const dominant = colorThief.getColor(img)

        const dominantHexColor = '#' + ((dominant[0] << 16) + (dominant[1] << 8) + dominant[2]).toString(16).padStart(6, '0');

        const hexColors = palette.map(
          ([r, g, b]) => '#' + ((r << 16) + (g << 8) + b).toString(16).padStart(6, '0')
        )


        setColors(hexColors)
        console.log(dominant)
        setDominantColor(dominantHexColor)
      }
    }
  }, [src])

  return (

    <Card border="2px" w="250px" h="300px" p={0} m={2}>
      <CardBody >
        <Grid
          templateRows='repeat(5, 1fr)'
          templateColumns='repeat(5, 1fr)'
          gap={0}

        >
          <GridItem border="2px"  rowSpan={5} colSpan={5} m={0} p={0} >
            <img ref={imgRef} src={src} alt="Image" />
          </GridItem>
          <GridItem  rowSpan={2} colSpan={5} style={{height: '10px', }} />
          <GridItem  rowSpan={1} colSpan={1} key={dominantColor} style={{ backgroundColor: dominantColor,borderRadius:"20px", width: '50px', height: '50px', }} />
          <GridItem  rowSpan={1} colSpan={1}  />
          {colors.map((color) => (
            <GridItem borderRadius="10px" mr={1} rowSpan={1} colSpan={1} key={color} style={{ backgroundColor: color }} />
          ))}


        </Grid>
      </CardBody>
    </Card>
  )

}

export default ColorTest