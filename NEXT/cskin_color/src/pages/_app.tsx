import { ChakraProvider } from "@chakra-ui/react";
import type { NextPage } from "next";
import type { AppProps } from "next/app";
import { theme } from "../styles/theme";
import { ItemColorProvider } from "@/context/weaponsContext";
import { ColorListProvider } from "@/context/colorListContext";


export type NextPageWithLayout<P = {}, IP = P> = NextPage<P, IP> & {
  getLayout?: (page: React.ReactElement) => React.ReactNode;
};

type AppPropsWithLayout = AppProps & {
  Component: NextPageWithLayout;
};

export default function App({ Component, pageProps }: AppPropsWithLayout) {
  const getLayout = Component.getLayout || ((page) => page);


  return (
    <ChakraProvider theme={theme}>
      <ItemColorProvider>
       
        {getLayout(<Component {...pageProps} />)}
       
      </ItemColorProvider>
    </ChakraProvider>
  );
}
