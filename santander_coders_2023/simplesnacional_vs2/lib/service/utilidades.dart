
import 'package:intl/intl.dart';

class Utilidades {

  Utilidades();

  static String formatarNumeroComPontoVirgula(double numero) {
    String numeroString = numero.toStringAsFixed(2);
    List<String> partes = numeroString.split('.');

    String parteInteira = partes[0];
    String parteDecimal = partes.length > 1 ? partes[1] : '00';

    parteInteira =
        parteInteira.replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.');

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
    cnpjFormatado =
    "${cnpjFormatado.substring(0, 2)}.${cnpjFormatado.substring(2, 5)}.${cnpjFormatado.substring(
        5, 8)}/${cnpjFormatado.substring(8, 12)}-${cnpjFormatado.substring(12, 14)}";

    return cnpjFormatado;
  }


  static int calcularDiferencaDias(String dataAbertura) {
    DateTime data = DateTime.parse(dataAbertura);
    DateTime dataAtual = DateTime.now();
    Duration diferenca = data.difference(dataAtual);
    int diferencaDias = diferenca.inDays;
    return diferencaDias;
  }


  static String dataDDMMYYYY(String data) {
    DateTime dataConvertida = DateTime.parse(data);
    String resultado = DateFormat('dd/MM/yyyy').format(dataConvertida);
    return resultado;
  }

  static String verificaDataParaInclusaoSimples(String dataAbertura) {
    DateTime data = DateTime.parse(dataAbertura).toLocal(); // Converte para a hora local (caso necessário).
    DateTime dataLimite = data.add(const Duration(days: 60));

    String resultado = DateFormat('dd/MM/yyyy').format(data);
    String resposta;

    int diferencaDias = calcularDiferencaDias(dataAbertura);

    DateTime dataAtual = DateTime.now();

    String _retornaString() {
      if (diferencaDias.abs() > 60 && dataAtual.month != 1) {
        return "Você ultrapassou a data limite para o enquadramento no Simples Nacional.\nPoderá optar "
            "em 01/01/${dataAtual.year + 1}";
      } else if (diferencaDias.abs() > 60 && dataAtual.month == 1) {
        return "Como estamos em ${DateFormat('dd/MM/yyyy').format(dataAtual)} você ainda pode optar pelo "
            "Simples Nacional ";
      } else {
        return "Você ultrapassou a data limite para o enquadramento no Simples Naiconal";
      }
    }

    if (dataAtual.isBefore(dataLimite)) {
      return resposta =
      "Você ainda tem $diferencaDias dias para optar pelo Simples Nacional";

    } else {
      return _retornaString();
    }
  }
}










