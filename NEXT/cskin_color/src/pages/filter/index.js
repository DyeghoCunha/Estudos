import { useState, useEffect } from 'react';
import { Box, Center, Card, Text, VStack, Heading, Image, SimpleGrid } from '@chakra-ui/react';
import { SwatchesPicker } from 'react-color';

export default function ColorPicker() {
  const [color, setColor] = useState('#fff');
  const [items, setItems] = useState([]);

  useEffect(() => {
    fetch('/api/items')
      .then(response => response.json())
      .then(data => setItems(data));
  }, []);

  const handleChangeComplete = (color) => {
    setColor(color.hsl);
  };

  return (
    <>
      <Center>
        <VStack>
          <Text>Escolher a Cor</Text>
          <Box
            padding="5px"
            borderRadius="1px"
            boxShadow="0 0 0 1px rgba(0,0,0,.1)"
            display="inline-block"
            cursor="pointer"
          >
            <SwatchesPicker
              color={color}
              onChangeComplete={handleChangeComplete}
            />
          </Box>
          <SimpleGrid columns={3} spacing={10}>
            {Array.isArray(items) ? items.map(item => (
              <Card key={item.id}>
                <Heading size="md">{item.name}</Heading>
                <Image src={item.image} alt={item.name} />
                <Box>
                  {item.colorHsl.map((color, index) => (
                    <Box key={index} bg={`hsl(${color.h}, ${color.s}%, ${color.l}%)`} h="20px" />
                  ))}
                </Box>
              </Card>
            )) : <Card><Text>Deu MERDA</Text></Card>}
          </SimpleGrid>
        </VStack>
      </Center>
    </>
  );
}
