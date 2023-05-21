  
  const { carrinho, setCarrinho } = useContext(CarrinhoContext);

  // Parametro para conferir e adicionar novo produto 
  function adicionarProduto(novoProduto) {

    const temOProduto = carrinho.some(itemDoCarrinho => itemDoCarrinho.id === novoProduto.id); //Verifica se o Produto ja Existe

    if (!temOProduto) {

      novoProduto.quantidade = 1;

      return setCarrinho(carrinhoAnterior =>
        [...carrinhoAnterior, novoProduto]
      );
    }
    setCarrinho(carrinhoAnterior => carrinhoAnterior.map(itemDoCarrinho => {
      if (itemDoCarrinho.id === novoProduto.id) itemDoCarrinho.quantidade += 1;
      return itemDoCarrinho;
    }))
  }