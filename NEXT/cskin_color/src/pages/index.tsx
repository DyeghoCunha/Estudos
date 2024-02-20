"use server"
import ItemCard from "@/components/molecules/ItemCard";
import { DefaultLayout } from "@/components/templates/DefaultLayout";
import { useItemColorContext } from "@/context/weaponsContext";
import { getItens } from "@/lib/itemsWithColor";
import { Box, Button, Card, Center, Divider, Grid, GridItem, HStack, Image, SimpleGrid, Text, VStack } from "@chakra-ui/react";
import Link from "next/link";
import { useEffect } from "react";
import saveAllItemWithColor from "@/lib/actions.js"

export default function Home() {
  const { skins, similarColors, groupColorsFinal, sortedColorGroups, itemWithColor } = useItemColorContext();

  let quantidade = 10;

  useEffect(() => {
    if(itemWithColor.length === 10){
    console.log(itemWithColor)
    }
  
  }, [itemWithColor])

  return (
    <>
    <Box my={10}> 
    <Link  href="/itensWithDb">Filtro de Cores</Link>
    </Box>

    <Button onClick={async () => {
      const response = await fetch('/api/items', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(itemWithColor),
      });

      if (!response.ok) {
        throw new Error('Erro ao salvar o item');
      }

      const data = await response.json();
      console.log(data.message);
    }}>Salvar no Banco</Button>

      <Grid templateColumns="repeat(5,1fr)" gap={0}>
        {skins.splice(0,10).map((skin) => (
          <GridItem id={skin.id} w="100%">
            <ItemCard skins={skin} />
          </GridItem>
        ))}
      </Grid>
      <Divider m="10px" />
    </>
  );
}

Home.getLayout = function getLayout(page: React.ReactElement) {
  return <DefaultLayout>{page}</DefaultLayout>;
};
