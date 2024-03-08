"use server"
import ItemCard from "@/components/molecules/ItemCard";
import { DefaultLayout } from "@/components/templates/DefaultLayout";
import { useItemColorContext } from "@/context/weaponsContext";
import { Box, Button, Card, Center, Divider, Grid, GridItem, HStack, Image, SimpleGrid, Skeleton, Text, VStack } from "@chakra-ui/react";
import Link from "next/link";
import { useEffect } from "react";
import { sendData } from "@/lib/actions.js"
import { IItemWithColor } from "@/types/types";
import ItemCardDb from "@/components/molecules/ItemCardDb";

export default function Home() {
  const { weaponFromDb, isLoading } = useItemColorContext();

  useEffect(() => {
    console.log(weaponFromDb)
  }, [weaponFromDb])


  function handleClick(itemWithColor: IItemWithColor[]) {
    for (var item of itemWithColor) {
      sendData(item);
    }
  }

  return (
    <>
      <Box my={10}>
        <Link href="/filter">Filtro de Cores</Link>
      </Box>

      {//<Button onClick={()=>handleClick(itemWithColor)}>Salvar no Banco</Button>
      }

      <Grid templateColumns="repeat(5,1fr)" gap={0}>
        {isLoading ? (<Skeleton w={200} h={300} />) :
          (
            weaponFromDb.map((skin) => (
              <GridItem id={skin.id} w="100%">
                <ItemCardDb skins={skin} />
              </GridItem>
            )))}
      </Grid>
      <Divider m="10px" />
    </>
  );
}

Home.getLayout = function getLayout(page: React.ReactElement) {
  return <DefaultLayout>{page}</DefaultLayout>;
};
