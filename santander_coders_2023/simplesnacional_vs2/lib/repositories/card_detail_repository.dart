import '../model/card_detail.dart';

class CardDetailRepository {
  static Future<List<CardDetail>> get() async {
    await Future.delayed(Duration(seconds: 0));
    return  [
      CardDetail(
        id: "1",
        title: "Simule sua alíquota",
        url: "assets/images/logo.png",
        text:
        "Calcule seus impostos com o Simples Nacional!\n\nO Simples Nacional é um regime tributário simplificado no Brasil, ideal para pequenas e médias empresas. Ele unifica os impostos federais, estaduais e municipais em uma única guia de pagamento.\n\nComo funciona:\n\n1. Escolha o anexo adequado à sua atividade econômica.\n2. Com base no seu faturamento mensal, aplique a alíquota correspondente para calcular os impostos a pagar.\n3. Pague uma única guia de impostos, facilitando a gestão financeira.\n\nLembre-se: as alíquotas variam de acordo com a faixa de faturamento e a atividade da empresa. O Simples Nacional é uma excelente opção para simplificar sua vida empresarial e reduzir a carga tributária.",
      ),
      CardDetail(
        id: "2",
        title: "Outro Título",
        url: "assets/images/logo2.png",
        text: "Outra descrição aqui...",
      ),
      CardDetail(
        id: "3",
        title: "Outro Título",
        url: "assets/images/logo2.png",
        text: "Outra descrição aqui...",
      ),
      CardDetail(
        id: "4",
        title: "Outro Título",
        url: "assets/images/logo2.png",
        text: "Outra descrição aqui...",
      ),
      CardDetail(
        id: "5",
        title: "Outro Título",
        url: "assets/images/logo2.png",
        text: "Outra descrição aqui...",
      ),
      CardDetail(
        id: "6",
        title: "Outro Título",
        url: "assets/images/logo2.png",
        text: "Outra descrição aqui...",
      ),
      CardDetail(
        id: "7",
        title: "Outro Título",
        url: "assets/images/logo2.png",
        text: "Outra descrição aqui...",
      ),
      CardDetail(
        id: "8",
        title: "Outro Título",
        url: "assets/images/logo2.png",
        text: "Outra descrição aqui...",
      ),
      CardDetail(
        id: "9",
        title: "Outro Título",
        url: "assets/images/logo2.png",
        text: "Outra descrição aqui...",
      ),
      CardDetail(
        id: "10",
        title: "Outro Título",
        url: "assets/images/logo2.png",
        text: "Outra descrição aqui...",
      ),
      CardDetail(
        id: "11",
        title: "Outro Título",
        url: "assets/images/logo2.png",
        text: "Outra descrição aqui...",
      ),
      CardDetail(
        id: "12",
        title: "Outro Título",
        url: "assets/images/logo2.png",
        text: "Outra descrição aqui...",
      ),

    ];
  }
}
