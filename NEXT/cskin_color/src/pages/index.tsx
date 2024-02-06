import ItemCard from "@/components/molecules/ItemCard";
import { DefaultLayout } from "@/components/templates/DefaultLayout";
import { useItemColorContext } from "@/context/weaponsContext";
import { Card, Center, Divider, Grid, GridItem, Image, Text } from "@chakra-ui/react";
import { useEffect } from "react";

export default function Home() {
  const { skins} = useItemColorContext();


//useEffect(()=>{
//console.log(weaponsWithColor)
//},[weaponsWithColor])

  return (
    <>
      <Grid templateColumns="repeat(5,1fr)" gap={0}>
        {skins.slice(0,10).map((skin) => (
          <GridItem id={skin.id} w="100%">
            <ItemCard   skins={skin} />
          </GridItem>
        ))}
      </Grid>
    </>
  );
}

Home.getLayout = function getLayout(page: React.ReactElement) {
  return <DefaultLayout>{page}</DefaultLayout>;
};
