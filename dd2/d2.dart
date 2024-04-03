import 'dart:math';

void main() {
  // Instância random
  Random random = Random();

  

  // Indice random
  var indiceRandom = random.nextInt(5);
  // Lista fornecedores chamando classes
  List<Fornecedores> fornecedores = [FornecedorDeBebidas(), FornecedorDeBolos(), FornecedorDePetiscos(), FornecedorDeSaladas(), FornecedorDeSanduiches()];
  // Instância de pessoa
  final pessoa = Pessoa();
  // Fornecedor aleatório
  final fornecedorAleatorio = fornecedores[indiceRandom];
  
  // Consumindo produtos fornecidos
  for (var i = 0; i < 5; i++) {
    // Função para comer
    pessoa.refeicao(fornecedorAleatorio);
    // Contando refeições
    pessoa.contadorDeRefeicoes++;
  }
  // Imprime as informações da pessoa
  pessoa.informacoes();

  
}

class Produto{
  Produto(this.nome, this.calorias);

  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;
}

abstract class Fornecedores {
  // Função para fornecer comida
  Produto fornecer();
  // Função para fornecer produto aleatório
  Produto fornecerProdutoAleatorio();
}

class FornecedorDeBebidas extends Fornecedores{
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];

  // Retorna um produto que pode ser consumido por um consumidor
  @override
  Produto fornecerProdutoAleatorio() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }

  @override
  Produto fornecer() {
    return fornecerProdutoAleatorio();
  }
  
}

class FornecedorDeSanduiches extends Fornecedores{
  final _random = Random();
  final _sanduichesDisponiveis = <Produto>[
    Produto('sanduiche de frango', 240),
    Produto('sanduiche de calabresa', 480),
    Produto('sanduiche de oregano', 240),
    Produto('sanduiche de queijo', 300),
    Produto('sanduiche de margarina', 520),
    Produto('sanduiche de carne', 400)
  ];

   @override
  Produto fornecerProdutoAleatorio() {
    return _sanduichesDisponiveis[_random.nextInt(_sanduichesDisponiveis.length)];
  }

  @override
  Produto fornecer() {
    return fornecerProdutoAleatorio();
  }
  
}

class FornecedorDeBolos extends Fornecedores{
  final _random = Random();
  final _bolosDisponiveis = <Produto>[
    Produto('bolo de chocolate', 250),
    Produto('bolo de morango', 300),
    Produto('bolo de queijo', 280),
    Produto('bolo formigueiro', 340),
    Produto('bolo de laranja', 432),
    Produto('bolo de cenoura', 108)
  ];

   @override
  Produto fornecerProdutoAleatorio() {
    return _bolosDisponiveis[_random.nextInt(_bolosDisponiveis.length)];
  }

  @override
  Produto fornecer() {
    return fornecerProdutoAleatorio();
  }

}

class FornecedorDeSaladas extends Fornecedores{
  final _random = Random();
  final _saladasDisponiveis = <Produto>[
    Produto('salada de tomate', 240),
    Produto('salada americana', 123),
    Produto('salada de vinagrete', 124),
    Produto('salada de folhas', 361),
    Produto('salada de verão', 120),
    Produto('salada de pão italiana', 198)
  ];

   @override
  Produto fornecerProdutoAleatorio() {
    return _saladasDisponiveis[_random.nextInt(_saladasDisponiveis.length)];
  }

  @override
  Produto fornecer() {
    return fornecerProdutoAleatorio();
  }

}

class FornecedorDePetiscos extends Fornecedores{
  final _random = Random();
  final _petiscosDisponiveis = <Produto>[
    Produto('mandioca frita', 210),
    Produto('frango frito', 390),
    Produto('asa de frango', 142),
    Produto('batata frita', 270),
    Produto('pão de alho', 510),
    Produto('batata chips', 520)
  ];

   @override
  Produto fornecerProdutoAleatorio() {
    return _petiscosDisponiveis[_random.nextInt(_petiscosDisponiveis.length)];
  }

  @override
  Produto fornecer() {
    return fornecerProdutoAleatorio();
  }

}

class FornecedorDeUltraCaloricos extends Fornecedores{
  final _random = Random();
  final _ultraCaloricosDisponiveis = <Produto>[
    Produto('pasta de amendoim', 810),
    Produto('coco', 990),
    Produto('abacate', 742),
    Produto('tâmara seca', 1270),
    Produto('amêndoas', 910),
    Produto('batata-doce', 820)
  ];

   @override
  Produto fornecerProdutoAleatorio() {
    return _ultraCaloricosDisponiveis[_random.nextInt(_ultraCaloricosDisponiveis.length)];
  }

  @override
  Produto fornecer() {
    return fornecerProdutoAleatorio();
  }
  
}



class Pessoa {
  Random random = Random();
  // Acumulador de calorias
  int _caloriasConsumidas = 0;
  late int _caloriasIniciais;
  int contadorDeRefeicoes = 0;
  

  Pessoa() {
    _caloriasIniciais = random.nextInt(2500);
  }

  

  /// Imprime as informacoes desse consumidor
  void informacoes() {
    print("Caloria incial: ${_caloriasIniciais}");
    print('Calorias consumidas: $_caloriasConsumidas');
    statusDeCalorias(_caloriasConsumidas);
    bool precisaComer = _caloriasIniciais < 1800;
    print("Precisa comer? $precisaComer");
    print("Número de refeições: $contadorDeRefeicoes");
  }

  /// Consome um produto e aumenta o número de calorias
  void refeicao(Fornecedores fornecer) { 
    final produto = fornecer.fornecerProdutoAleatorio();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    (_caloriasConsumidas += produto.calorias); 
  }

  void statusDeCalorias(int _caloriasConsumidas) {
    if(_caloriasConsumidas <= 500) {
      print("Deficit extremo de calorias.");
    } else if(_caloriasConsumidas <= 1800) {
      print("Deficit de calorias.");
    } else if(_caloriasConsumidas <= 2500) {
      print("Satisfeito");
    } else {
      print("Excesso de calorias.");
    }
  }
}