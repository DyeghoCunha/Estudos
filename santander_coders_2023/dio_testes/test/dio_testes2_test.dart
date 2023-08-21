import 'package:dio_testes/dio_testes.dart' as app;
import 'package:test/test.dart';

void main() {
  test('Calcula o valor do produto sem porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), 850);
  });
  test('Calcula o valor do produto sem porcentagem passando o valor do produto zerado', () {
    expect(()=> app.calcularDesconto(0, 150, false), throwsA(TypeMatcher<ArgumentError>()));
  });
  test('Calcula o valor do produto com desconto zerado com porcentagem', () {
    expect(()=> app.calcularDesconto(1000, 0, false), throwsA(TypeMatcher<ArgumentError>()));
  });
  test('Calcula o valor do produto com porcentagem', () {
    expect(app.calcularDesconto(1000, 15, true), 850);
  });

}
