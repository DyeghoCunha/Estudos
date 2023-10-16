class Utilidades{

 static  String formatarNumeroComPontoVirgula(double numero) {
    String numeroString = numero.toStringAsFixed(2);
    List<String> partes = numeroString.split('.');

    String parteInteira = partes[0];
    String parteDecimal = partes.length > 1 ? partes[1] : '00';

    parteInteira = parteInteira.replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.');

    return '$parteInteira,$parteDecimal';
  }

}