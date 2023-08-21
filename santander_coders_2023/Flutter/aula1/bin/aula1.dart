void main(List<String> arguments) {
  print("${funcAnexo(faturamento: 185320.50, anexo: "Anexo IV")}%");
}

List<double> limiteReceitaPorFaixa = [180000.00, 360000.00, 720000.00, 1800000.00, 3600000.00, 4800000.00];

Map<int, List<double>> funcSeletorAnexo({String? anexo}){
  Map<int, List<double>> anexoEscolhido ={} ;

  switch(anexo) {
    case "Anexo I":
      anexoEscolhido = {
        1: [0.04, 0.00],
        2: [0.073, 5940.00],
        3: [0.095, 13860.00],
        4: [0.1070, 22500.00],
        5: [0.1430, 87300.00],
        6: [0.1900, 378000.00]
      };
      break;
    case "Anexo II":
      anexoEscolhido ={
        1: [0.045,0.00],
        2: [0.0780, 5940.00 ],
        3: [0.10, 13860.00],
        4: [0.1120, 22500.00],
        5: [0.1470, 85500.00],
        6: [0.3000, 720000.00]
      };
      break;
    case "Anexo III":
      anexoEscolhido ={
        1: [0.06,0.00],
        2: [0.1120, 9360.00 ],
        3: [0.1350, 17640.00],
        4: [0.1600, 35640.00],
        5: [0.2100, 125640.00],
        6: [0.3300, 648000.00]
      };
          break;
    case "Anexo IV":
      anexoEscolhido = {
        1: [0.045,0.00],
        2: [0.09, 8100.00 ],
        3: [0.1020, 12420.00],
        4: [0.1400, 39780.00],
        5: [0.2200, 183780.00],
        6: [0.3300, 828000.00] 
      };
      break;
    case "Anexo V":
      anexoEscolhido = {
        1: [0.015,0.00],
        2: [0.18, 4500.00 ],
        3: [0.1950, 9900.00],
        4: [0.2050, 17100.00],
        5: [0.2300, 62100.00],
        6: [0.3050, 540000.00]
      }; break;
          
  }
  return anexoEscolhido ;
}

double funcAnexo({double? faturamento, String? anexo}) {

  int _faixa = 0;
  double resultado = 0;
  Map<int, List<double>> anexoSelecionado = funcSeletorAnexo(anexo: anexo);

  if (faturamento == null) {
    return -1.0;
  }

  for (final receitaBruta in limiteReceitaPorFaixa) {
   _faixa++;
    if (faturamento <= receitaBruta) {
      return resultado = (((faturamento * anexoSelecionado[_faixa]![0]) - anexoSelecionado[_faixa]![1]) /
          faturamento) * 100;
    }
  }
  return resultado;
}
