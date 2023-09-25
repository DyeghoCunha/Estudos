class FaturamentoAnual {
  final Map<int, Map<String, double>> anos;

  FaturamentoAnual({required this.anos});

  void adicionarFaturamento(int ano, String mes, double faturamento) {
    // Verifique se o ano já existe na estrutura de dados
    if (anos.containsKey(ano)) {
      // O ano já existe, verifique se o mês já existe para esse ano
      final anoData = anos[ano]!;
      if (anoData.containsKey(mes)) {
        // O mês já existe, atualize o valor do faturamento
        anoData[mes] = faturamento;
      } else {
        // O mês não existe, adicione o mês com o faturamento
        anoData[mes] = faturamento;
      }
    } else {
      // O ano não existe, crie um novo ano com o mês e o faturamento
      anos[ano] = {mes: faturamento};
    }
  }
}