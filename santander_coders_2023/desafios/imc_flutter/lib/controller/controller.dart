import '../model/model.dart';

class CalculaImc{
    resultado(double peso, double altura){
   return  (peso / (altura * altura))*10000;
  }

    String faixaImc(double imc) {
      if (imc < 18.5) {
        return "Abaixo do peso";
      } else if (imc >= 18.5 && imc <= 24.9) {
        return "com o Peso normal";
      } else if (imc >= 25 && imc <= 29.9) {
        return "com Sobrepeso";
      } else if (imc >= 30 && imc <= 34.9) {
        return "com Obesidade grau I";
      } else if (imc >= 35 && imc <= 39.9) {
        return "com Obesidade grau II";
      } else if (imc >= 40) {
        return "com Obesidade grau III";
      } else {
        return "com Faixa de IMC desconhecida";
      }
    }







}