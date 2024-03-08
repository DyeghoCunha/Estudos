import React, { useEffect, useRef } from 'react'
import { useItemColorContext } from '@/context/weaponsContext';
import { Box, Card, CardBody, CardFooter, CardHeader, Center, CircularProgress, Flex, HStack, Heading, Text, VStack } from '@chakra-ui/react'
import { Image as ChakraImage } from "@chakra-ui/react";
import { IItemCard, IItemWithColor } from '@/types/types';




export default function ItemCard({ skins }:IItemCard) {
  const { itemWithColor, loadImageFromCanvas } = useItemColorContext()
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const skinImage: string = skins.image


  useEffect(() => {
    loadImageFromCanvas(skinImage, canvasRef, skins);
  }, []);

  return (
    <Center m="10px">
      <canvas ref={canvasRef} style={{ display: "none" }} />
      <Card justifyContent="center" alignItems="center" w="250px" h="380px">
        <CardHeader>
          <Heading textAlign="center" fontSize="12px">{skins.name}</Heading>
        </CardHeader>

        <CardBody justifyContent="center" alignItems="center" mb={0} pb={0}>
          <Flex m={0} p={0} justify="center" align="center">
            <ChakraImage src={skins.image} />
          </Flex>
        </CardBody >
        <CardFooter mt={0} px={5}>
          <VStack>
          {itemWithColor && itemWithColor.length > 0 ?
            itemWithColor.map((weapon) => weapon.id === skins.id ?
            <VStack>
              <HStack>
                {weapon.colorHsl.slice(0, 3).map((color, index) =>
                  <HStack key={index}>
                    <Text fontSize={10}>- h: {color.h.toFixed(0)} s: {color.s.toFixed(0)} l: {color.l.toFixed(0)}- </Text>
                  </HStack>
                )}
                </HStack>
                <HStack>
                {weapon.colorName.slice(0, 3).map((color, index) =>
                  <VStack key={index}>
                    <Text>{color}</Text>
                  </VStack>
                )}
                </HStack>
             
               </VStack>: null

            ) : <CircularProgress />
          }

          {itemWithColor && itemWithColor.length > 0 ?
            itemWithColor.map((weapon) => weapon.id === skins.id ?

              <HStack px={5} gap={2}>
                {weapon.color.slice(0, 3).map((color, index) =>
                  <VStack key={index}>
                    <Text>{color}</Text>
                    <Box w={35} h={35} bgColor={color}></Box>
                  </VStack>
                )}
              </HStack> : null

            ) : <CircularProgress />
          }</VStack>
        </CardFooter>
      </Card>
    </Center>
  )
}
