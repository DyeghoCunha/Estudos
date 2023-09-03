import 'dart:io';

void main() {
  final scanner = stdin;

    final entrada = scanner.readLineSync()!;
    final partes = entrada.split(',');

    final data = partes[0];
    final hora = partes[1];
    final descricao = partes[2];
    final valor = double.tryParse(partes[3]) ?? 0.0;
    final transacao = Transacao(data, hora, descricao, valor);
    transacao.imprimir();

}

class Transacao {
  final String data;
  final String hora;
  final String descricao;
  final double valor;

  Transacao(this.data, this.hora, this.descricao, this.valor);

  void imprimir() {
    print(descricao);
    print(data);
    print(hora);  // Utilizando uma função auxiliar para formatar a hora
    print(valor.toStringAsFixed(2));
    print('');
  }

  String _formatHora(String hora) {
    // Dividindo a hora em partes (horas, minutos e segundos)
    final partesHora = hora.split(':');

    // Formatando cada parte para ter 2 dígitos com zero à esquerda
    final horaFormatada = partesHora[0].padLeft(2, '0');
    final minutosFormatados = partesHora[1].padLeft(2, '0');
    final segundosFormatados = partesHora[2].padLeft(2, '0');

    // Combinando as partes formatadas novamente
    return '$horaFormatada:$minutosFormatados:$segundosFormatados';
  }
}
