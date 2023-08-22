import 'package:desafio_imc/models/pessoa.dart';
import 'package:test/test.dart';

void main() {

    group('Pessoa', () {
      late Pessoa pessoa;

      setUp(() {
        pessoa = Pessoa('', 0, 0);
      });

      test('Verifica se pessoa.nome é atribuído corretamente', () {
        pessoa.nome = 'Alice';
        expect(pessoa.nome, 'Alice');
      });

      test('Calcula IMC corretamente', () {
        pessoa.peso = 70;
        pessoa.altura = 1.75;
        expect(pessoa.calculaImc(), closeTo(22.86, 0.01));
      });


      test('Verifica se pessoa.nome é atribuído corretamente', () {
        pessoa.nome = 'Alice';
        expect(pessoa.nome, 'Alice');
      });

      test('Calcula IMC corretamente', () {
        pessoa.peso = 70;
        pessoa.altura = 1.75;
        expect(pessoa.calculaImc(), closeTo(22.86, 0.01));
      });

      test('Não aceita peso negativo', () {
        pessoa.peso = -10;
        expect(pessoa.peso, equals(0));
      });

      test('Não aceita peso maior que 500', () {
        pessoa.peso = 600;
        expect(pessoa.peso, equals(0));
      });

      test('Não aceita peso menor que 30', () {
        pessoa.peso = 25;
        expect(pessoa.peso, equals(0));
      });

      test('Não aceita altura maior que 2.50', () {
        pessoa.altura = 2.80;
        expect(pessoa.altura, equals(0));
      });

      test('Não aceita altura menor que 0.9', () {
        pessoa.altura = 0.80;
        expect(pessoa.altura, equals(0));
      });

      test('Não aceita altura negativa', () {
        pessoa.altura = -1.75;
        expect(pessoa.altura, equals(0));
      });

      test('Não aceita nomes com números', () {
        pessoa.nome = 'João123';
        expect(pessoa.nome, equals(''));
      });

      test('Não aceita nomes com caracteres especiais', () {
        pessoa.nome = '!Alice@';
        expect(pessoa.nome, equals(''));
      });
    });

  }


