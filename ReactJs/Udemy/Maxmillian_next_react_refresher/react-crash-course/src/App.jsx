
import ImageDownloader from "./components/SalvaArquivos";
import ColorTest from "./components/ColorTest";
import imagem from "./assets/Image/usp.png"
import imagem1 from "./assets/Image/arma1.png"
import imagem2 from "./assets/Image/arma2.png"
import imagem3 from "./assets/Image/arma3.png"
import imagem4 from "./assets/Image/arma4.png"
import imagem5 from "./assets/Image/arma5.png"
import imagem6 from "./assets/Image/arma6.png"
import { Card, CardHeader, CardBody, CardFooter, Heading, Stack, StackDivider, Box, Text, HStack, Grid, GridItem, Button } from '@chakra-ui/react'
function App() {


const lista = [imagem, imagem1, imagem2,imagem3,imagem4,imagem5, imagem6]
  return (
 <>
    <Grid backgroundColor="grey" templateColumns="repeat(auto-fill, minmax(200px, 1fr))" gap={50}>
    {lista.map((img, index) => (
      <GridItem ml={10} key={index}>
        <ColorTest src={img} />
      </GridItem>
    ))}
  </Grid>

<Button onClick={ ()=>ImageDownloader("https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpoo6m1FBRp3_bGcjhQ09-jq5WYh8j3Jq_um25V4dB8teXA54vwxle2qRA4YzyiI46SIA45N1rSqFS9l-jpgsDqv5WcmCAyvCMh5X3cnBKpwUYblsbKgI4/")}>

</Button>
   
</>

  )
}

export default App;
