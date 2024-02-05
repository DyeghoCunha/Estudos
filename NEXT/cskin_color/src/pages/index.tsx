import ItemCard from "@/components/molecules/ItemCard";
import { DefaultLayout } from "@/components/templates/DefaultLayout";
import { useWeaponContext } from "@/context/weaponsContext";
import { Card, Center, Divider, Grid, GridItem, Image, Text } from "@chakra-ui/react";
import { useEffect } from "react";

export default function Home() {
  const { skins, setSkins, weaponsFinal } = useWeaponContext();




  return (
    <>
      <Grid templateColumns="repeat(5,1fr)" gap={0}>
        {skins.slice(0,4).map((skin) => (
          <GridItem w="100%">
            <ItemCard id={skin.id} skins={skin} />
          </GridItem>
        ))}
      </Grid>
    </>
  );
}

Home.getLayout = function getLayout(page: React.ReactElement) {
  return <DefaultLayout>{page}</DefaultLayout>;
};
