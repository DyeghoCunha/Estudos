import { Container, Flex } from "@chakra-ui/react";



interface IDefaultLayoutProps {
  p?: number;
  children: React.ReactNode;
}

export function DefaultLayout({ p, children }: IDefaultLayoutProps) {
  return (
    <Flex minH="100vh" direction="column">
    

      <Container
        maxW="full"
        flexGrow={1}
        px={{ base: 0, lg: p === undefined ? 120.1 : p }}
      >
        {children}
      </Container>

      
    </Flex>
  );
}
