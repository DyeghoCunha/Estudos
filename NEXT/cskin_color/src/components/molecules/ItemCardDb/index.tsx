import React, { useEffect, useRef } from 'react'
import { Box, Card, CardBody, CardFooter, CardHeader, Center, CircularProgress, Flex, HStack, Heading, Skeleton, Text, VStack } from '@chakra-ui/react'
import { Image as ChakraImage } from "@chakra-ui/react";
import { useItemColorContext } from '@/context/weaponsContext';




export default function ItemCardDb({ skins }: any) {

const {isLoading} = useItemColorContext()


  return (
<Center m="10px">
      {isLoading ? (
        <Skeleton w="250px" h="380px" /> // mostra o Skeleton se isLoading é true
      ) : (
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
            <VStack>
              <VStack>
                {/*
                { skins.colorHsl.map((color, index) =>
                  <VStack key={index}>
                    <Text fontSize={10}>- h: {color.h!==null? color.h.toFixed(0):0} s: {color.s.toFixed(0)} l: {color.l.toFixed(0)}- </Text>
                  </VStack>
                )}*/
                }
              </VStack>
              <HStack>
                {skins.colorName.map((color, index) =>
                  <VStack key={index}>
                    <Text>{color}</Text>
                  </VStack>
                )}
              </HStack>

            </VStack>

            <HStack px={5} gap={2}>
              {skins.color.map((color, index) =>
                  <Box id={index} w={35} h={35} bgColor={color}></Box>
               
              )}
            </HStack>
          </VStack>
        </CardFooter>
        </Card>
      )}
    </Center>
  )
}
