import React, { useEffect, useRef, useState } from 'react'
import { useWeaponContext } from '@/context/weaponsContext';
import { Box, Card, CardBody, CardFooter, CardHeader, Center, Divider, Flex, HStack, Heading,  Text } from '@chakra-ui/react'
import { Image as ChakraImage } from "@chakra-ui/react";

export default function ItemCard({ skins }: any) {
  const {quantization,buildRgb,buildPalette,colorList} = useWeaponContext()


  const canvasRef = useRef<HTMLCanvasElement>(null);
  const [colors, setColors] = useState(["", "", "", ""]); // Inicializa o estado das cores

  useEffect(() => {
    const main = async (imageUrl: string) => { // torna a função assíncrona
      const image = new Image();
      image.crossOrigin = "anonymous"; 

      image.onload = async () => { // torna a função assíncrona
        const canvas = canvasRef.current;
        if (canvas) {
          const ctx = canvas.getContext('2d', { willReadFrequently: true });
          ctx!.drawImage(image, 0, 0, canvas.width, canvas.height); 
          const imageData = ctx!.getImageData(0, 0, canvas.width, canvas.height); 
          const rgbArray = buildRgb(imageData.data);
          const quantColors = quantization(rgbArray, 0);
          
          const paletteColors = await buildPalette(quantColors); // espera a função terminar

          // Atualiza o estado das cores depois de construir a paleta
          setColors(paletteColors);
        }
     
      };
      image.src = imageUrl;
    };
    main(skins.image); 
  }, [skins]);
  useEffect(()=>{

    console.log(colorList)
  },[colorList])
  return (
    <Center id={skins.id} m="10px">
      <canvas ref={canvasRef} style={{ display: "none" }} />
      <Card justifyContent="center" alignItems="center" w="200px" h="280px">
        <CardHeader>
          <Heading textAlign="center" fontSize="12px">{skins.name}</Heading>
        </CardHeader>

        <CardBody justifyContent="center" alignItems="center" mb={0}pb={0}>
          <Flex m={0} p={0} justify="center" align="center">
            <ChakraImage  src={skins.image} />
          </Flex>
        </CardBody >
        <Divider orientation='horizontal' color="red"></Divider>
        <CardFooter mt={0}pt={0}>
        {Array.isArray(colorList) && colorList.length > 0 && colorList[0] &&
  <HStack gap="10px" px="10px">
    <Box w="35px" h={35} bgColor={colorList[0]}></Box>
    <Box w="35px" h={35} bgColor={colorList[1]}></Box>
    <Box w="35px" h={35} bgColor={colorList[2]}></Box>
    <Box w="35px" h={35} bgColor={colorList[3]}></Box>
  </HStack>
}

          
        </CardFooter>
      </Card>
    </Center>
  )
}
