class SimplesNacionalAliquota {
  double alq = 0;
  double pd = 0;

  bool optante = true;
  String anexo = '';
  List<List<double>> _faixa = [];
  double rbt12 = 0;


  SimplesNacionalAliquota();

  double? funcCalculaAliqEfetiva(double rbt12, String anexo) {
    double? alqEfetiva;
    if(anexo=='Anexo I'){
      _faixa = [
        [180000, 3 / 100, 0],
        [360000, 6.3 / 100, 5939],
        [720000, 8.5 / 100, 13859],
        [1800000, 9.7 / 100, 22499],
        [3600000, 13.3 / 100, 87299],
        [4800000, 18 / 100, 377999]
      ];
    }else if(anexo=='Anexo II'){
      _faixa = [
        [180000, 4.5 / 100, 0],
        [360000, 7.8 / 100, 5940],
        [720000, 10 / 100, 13860],
        [1800000, 12.2 / 100, 22500],
        [3600000, 14.7 / 100, 85500],
        [4800000, 30 / 100, 720000]
      ];
    }else if(anexo=='Anexo III'){
      _faixa = [
        [180000, 6 / 100, 0],
        [360000, 11.2 / 100, 9360],
        [720000, 13.5 / 100, 17640],
        [1800000, 16 / 100, 35640],
        [3600000, 21 / 100, 125640],
        [4800000, 33 / 100, 648000]
      ];
    }else if(anexo=='Anexo IV'){
      _faixa = [
        [180000, 4.5 / 100, 0],
        [360000, 9 / 100, 8100],
        [720000, 10.2 / 100, 12420],
        [1800000, 14 / 100, 39780],
        [3600000, 22 / 100, 183780],
        [4800000, 33 / 100, 828000]
      ];
    }else if(anexo=='Anexo V'){
      _faixa = [
        [180000, 15.5 / 100, 0],
        [360000, 18 / 100, 4500],
        [720000, 19.5 / 100, 9900],
        [1800000, 20.5 / 100, 17100],
        [3600000, 23 / 100, 62100],
        [4800000, 30.5 / 100, 540000]
      ];
    } else {print('Erro nos Anexos');}

    for (int i = 0; i < _faixa.length; i++) {
      if (rbt12 < _faixa[i][0]) {
        alq = _faixa[i][1];
        pd = _faixa[i][2];
        alqEfetiva = (((rbt12 * alq)) - pd) / rbt12;
        return (alqEfetiva *100);
      }
    }
    return null;

  }
}