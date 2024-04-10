// Importa a biblioteca 'dart:math' para utilizar a classe Random.
import 'dart:math';

// Classe que define uma Figura.
class Figura {
  String nome; // Nome da figura.
  int codigo; // Código único da figura.

  // Construtor da classe Figura.
  Figura(this.nome, this.codigo);
}

// Classe que define um Pacote de Figuras.
class PacoteDeFiguras {
  List<Figura> pacote = []; // Lista de figuras no pacote.

  // Construtor da classe PacoteDeFiguras.
  PacoteDeFiguras(List<Figura> figuras) {
    pacote = []; // Inicializa a lista de figuras no pacote.
    var random = Random(); // Cria uma instância da classe Random para gerar números aleatórios.

    // Loop para adicionar 4 figuras aleatórias no pacote.
    for (var i = 0; i < 4; i++) {
      var figuraAleatoria = figuras[random.nextInt(figuras.length)]; // Seleciona uma figura aleatória da lista de figuras.
      pacote.add(figuraAleatoria); // Adiciona a figura selecionada ao pacote.
    }
  }
}

// Função principal.
void main() {
  // Lista contendo todas as figuras disponíveis.
  List<Figura> figuras = [
    Figura("Figura 1", 1),
    Figura("Figura 2", 2),
    // Adicione mais figuras conforme necessário.
  ];

  var album = <Figura>[]; // Lista para armazenar as figuras do álbum.
  var figurasRepetidas = <Figura>[]; // Lista para armazenar as figuras repetidas.

  // Loop para preencher o álbum até que todas as figuras estejam incluídas.
  while (album.length < figuras.length) {
    var pacote = PacoteDeFiguras(figuras); // Cria um novo pacote de figuras.

    // Loop para processar cada figura no pacote.
    for (var figura in pacote.pacote) {
      // Verifica se a figura já está no álbum.
      if (!album.contains(figura)) {
        album.add(figura); // Adiciona a figura ao álbum se não estiver presente.
      } else {
        figurasRepetidas.add(figura); // Adiciona a figura à lista de figuras repetidas se já estiver no álbum.
      }
    }
  }

  // Imprime o número de figuras repetidas.
  print('Número de figuras repetidas: ${figurasRepetidas.length}');

  // Loop para imprimir as figuras coladas no álbum.
  for (var figura in album) {
    print('${figura.codigo}: ${figura.nome}');
  }
}
