import 'dart:collection';
import 'dart:math';

void main() {
  // Cria uma fila de atendimento
  final fila = FilaDeAtendimento();

  // Adiciona 10 pessoas à fila
  for (int i = 0; i < 10; i++) {
    final pessoa = Pessoa(fila.gerarNomeAleatorio());
    fila.entrarNaFila(pessoa); // Adiciona a pessoa à fila
    print('${pessoa.nome} entrou na fila');
  }

  // Atende as pessoas na fila
  while (!fila.estaVazia()) {
    final pessoaAtendida = fila.atenderProximaPessoa();
    print('${pessoaAtendida.nome} foi atendido(a)');
  }
}

// Classe que representa uma fila de atendimento
class FilaDeAtendimento {
  final _fila = Queue<Pessoa>(); // Utiliza a classe Queue

  // Gera um nome aleatório para uma pessoa
  String gerarNomeAleatorio() {
    final nomes = ['Fulano', 'Beltrano', 'Ciclano', 'Sicrano', 'Zezinho'];
    final sobrenomes = ['Silva', 'Santos', 'Oliveira', 'Almeida', 'Costa'];

    Random random = Random();
    int randomIndice = random.nextInt(nomes.length);

    return '${nomes[randomIndice]} ${sobrenomes[randomIndice]}';
  }

  // Adiciona uma pessoa à fila
  void entrarNaFila(Pessoa pessoa) {
    _fila.addLast(pessoa);
  }

  // Verifica se a fila está vazia
  bool estaVazia() {
    return _fila.isEmpty;
  }

  // Atende a próxima pessoa na fila e a remove
  Pessoa atenderProximaPessoa() {
    return _fila.removeFirst();
  }
}

// Classe que representa uma pessoa
class Pessoa {
  final String nome;

  Pessoa(this.nome);
}