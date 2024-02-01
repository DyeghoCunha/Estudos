import ItemCard from "@/components/molecules/ItemCard";
import { DefaultLayout } from "@/components/templates/DefaultLayout";
import { useWeaponContext } from "@/context/weaponsContext";
import { Card, Center, Grid, GridItem, Image, Text } from "@chakra-ui/react";
import { useEffect } from "react";

export default function Home() {
  const { skins, setSkins } = useWeaponContext();


  useEffect(() => {
    console.log(skins);
  }, [skins]);

  return (
    <>
     <Grid templateColumns="repeat(5,1fr)" gap={0}>
     {skins.slice(0, 3).map((skin) => (
  <GridItem w="100%">
    <ItemCard skins={skin}/>   
  </GridItem>
))}

      </Grid>
    </>
  );
}

Home.getLayout = function getLayout(page: React.ReactElement) {
  return <DefaultLayout>{page}</DefaultLayout>;
};
