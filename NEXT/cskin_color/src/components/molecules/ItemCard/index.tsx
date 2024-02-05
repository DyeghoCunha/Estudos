import React, { useEffect, useRef, useState } from 'react'
import { useWeaponContext } from '@/context/weaponsContext';
import { Box, Card, CardBody, CardFooter, CardHeader, Center, CircularProgress, Divider, Flex, HStack, Heading, Text } from '@chakra-ui/react'
import { Image as ChakraImage } from "@chakra-ui/react";


export default function ItemCard({ skins }: any) {
  const { quantization, buildRgb, buildPalette, colorList, setWeaponWithSkin, weaponWithSkin, arrayColorList, weaponsFinal } = useWeaponContext()
  const canvasRef = useRef<HTMLCanvasElement>(null);

  useEffect(() => {
    const main = async (imageUrl: string) => {
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
    main(skins.image);
  }, []);

  const weapon = weaponsFinal.find(w => w.id === skins.id);
  const color = weapon && weapon.color ? weapon.color : 'Red';
  return (
    <Center id={skins.id} m="10px">
      <canvas ref={canvasRef} style={{ display: "none" }} />
      <Card justifyContent="center" alignItems="center" w="200px" h="280px">
        <CardHeader>
          <Heading textAlign="center" fontSize="12px">{skins.name}</Heading>
        </CardHeader>

        <CardBody justifyContent="center" alignItems="center" mb={0} pb={0}>
          <Flex m={0} p={0} justify="center" align="center">
            <ChakraImage src={skins.image} />
          </Flex>
        </CardBody >
        <CardFooter mt={0} px={5}>
          {weaponsFinal && weaponsFinal.length > 0 ?
            <HStack  px={5} gap={2}>
              <Box w={35} h={35} bgColor={color[0]}></Box>
              <Box w={35} h={35} bgColor={color[1]}></Box>
              <Box w={35} h={35} bgColor={color[2]}></Box>
              <Box w={35} h={35} bgColor={color[3]}></Box>
            </HStack> : <CircularProgress />
          }
        </CardFooter>

      </Card>
    </Center>
  )
}
