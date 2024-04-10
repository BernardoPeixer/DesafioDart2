

void main() {
  Itens item1 = Itens("Desodorante", 4.50, 20);
  Itens item2 = Itens("Chocolate", 3.40, 13);
  Itens item3 = Itens("Energético", 12.80, 43);
  Itens item4 = Itens("Bolacha", 2.50, 1);
  Itens item5 = Itens("Pão", 8.90, 5);
  Itens item6 = Itens("Refrigerante", 6.70, 0);
  Itens item7 = Itens("Amaciante", 32.40, 9);
  Itens item8 = Itens("Sabonete", 1.00, 20);
  Itens item9 = Itens("Papel Higiênico", 23.99, 24);
  Itens item10 = Itens("Esponja", 3.49, 12);

  List<Itens> itensDesejados = [];
  List<Itens> itensComprados = [];

  ControleDeItens controleDeItens = new ControleDeItens();
  print("----- Lista de desejos -----");
  controleDeItens.incluirItensDesejados(itensDesejados, item10, 3);
  controleDeItens.incluirItensDesejados(itensDesejados, item3, 3);
  controleDeItens.incluirItensDesejados(itensDesejados, item4, 3);
  print("----- Itens comprados -----");
  controleDeItens.comprarItens(itensComprados, item3, 7);
  controleDeItens.comprarItens(itensComprados, item10, 13);
  controleDeItens.comprarItens(itensComprados, item9, 5);
}

class Itens {
  String nome;
  double preco;
  int quantidade;
  Itens(this.nome, this.preco, this.quantidade);

  
}

class ControleDeItens{
 

  /// Inclui itens na lista de desejos
  void incluirItensDesejados(List<Itens> itensDesejados, Itens item, int quantidade) {
    if(item.quantidade > quantidade) {
    itensDesejados.add(Itens(item.nome, item.preco, quantidade));
    print("----------------------------");
    print("${item.nome} incluído na lista de desejos!");
    for(var item in itensDesejados) {
      print("Item: ${item.nome}, Preço: ${item.preco}, Quantidade: ${quantidade}");
    }
    } else {
      print("Quantidade indisponível!");
      print("Temos somente ${item.quantidade} itens no estoque");
    }
  }

  /// Inclui itens na lista de comprados
  void comprarItens(List<Itens> itensComprados, Itens item, int quantidadeComprada) {

    if(item.quantidade >= quantidadeComprada) {
      print("Compra realizada");
      item.quantidade -= quantidadeComprada;
      itensComprados.add(Itens(item.nome, item.preco, item.quantidade));
      for(var item in itensComprados) {
      print("Item: ${item.nome}, Preço: ${item.preco}");
      print("----------------------------");
    }
    } else {
      print("Quantidade indisponível!");
      print("Temos somente ${item.quantidade} itens no estoque");
    }
  }

  ControleDeItens();
}