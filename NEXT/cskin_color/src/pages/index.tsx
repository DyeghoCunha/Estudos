import ItemCard from "@/components/molecules/ItemCard";
import { DefaultLayout } from "@/components/templates/DefaultLayout";
import { useItemColorContext } from "@/context/weaponsContext";
import { Box, Card, Center, Divider, Grid, GridItem, HStack, Image, SimpleGrid, Text } from "@chakra-ui/react";
import { useEffect } from "react";

export default function Home() {
  const { skins, allColorsHEX, groupColorsFinal } = useItemColorContext();


  //useEffect(()=>{
  //console.log(weaponsWithColor)
  //},[weaponsWithColor])

  return (
    <>
      <Grid templateColumns="repeat(5,1fr)" gap={0}>
        {skins.slice(0, 10).map((skin) => (
          <GridItem id={skin.id} w="100%">
            <ItemCard skins={skin} />
          </GridItem>
        ))}
      </Grid>
      <Divider/>
      
  <SimpleGrid columns={6} spacing={1}>
    {Object.entries(groupColorsFinal).map(([groupName, colors]) => (
      <Box key={groupName}>
        <Box fontWeight="bold" mb={2}>{groupName}</Box>
        {colors.map((color, index) => (
          <Box key={index} w={35} h={35} bgColor={`hsl(${color.h}, ${color.s}%, ${color.l}%)`}></Box>
        ))}
      </Box>
    ))}
  </SimpleGrid>

    </>
  );
}

Home.getLayout = function getLayout(page: React.ReactElement) {
  return <DefaultLayout>{page}</DefaultLayout>;
};
