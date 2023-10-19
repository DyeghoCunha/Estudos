class Utilidades{

 static  String formatarNumeroComPontoVirgula(double numero) {
    String numeroString = numero.toStringAsFixed(2);
    List<String> partes = numeroString.split('.');

    String parteInteira = partes[0];
    String parteDecimal = partes.length > 1 ? partes[1] : '00';

    parteInteira = parteInteira.replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.');

    return '$parteInteira,$parteDecimal';
  }

 static String primeiraMaiuscula(String frase) {
   List<String> palavras = frase.split(' ');
   List<String> palavrasMaiusculas = palavras.map((palavra) {
     if (palavra.isEmpty) {
       return '';
     } else {
       return palavra[0].toUpperCase() + palavra.substring(1).toLowerCase();
     }
   }).toList();

   String fraseComAPrimeiraLetraMaiuscula = palavrasMaiusculas.join(' ');

   return fraseComAPrimeiraLetraMaiuscula;
 }

 static String formatarCNPJ(String cnpj) {
   String cnpjFormatado = cnpj.replaceAll(RegExp(r'\D'), '');

   if (cnpjFormatado.length != 14) {
     throw FormatException('CNPJ deve conter 14 dígitos.');
   }
   cnpjFormatado = "${cnpjFormatado.substring(0, 2)}.${cnpjFormatado.substring(2, 5)}.${cnpjFormatado.substring(5, 8)}/${cnpjFormatado.substring(8, 12)}-${cnpjFormatado.substring(12, 14)}";

   return cnpjFormatado;
 }

}