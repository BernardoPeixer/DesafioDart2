import 'dart:collection';

void main() {
  Queue<Carta> baralho = Queue<Carta>();

  Carta carta1 = Carta('A', 'paus');
  Carta carta2 = Carta('A', 'copas');
  Carta carta3 = Carta('A', 'espadas');
  Carta carta4 = Carta('A', 'ouros');

  empilharCarta(baralho, carta1);
  empilharCarta(baralho, carta2);
  empilharCarta(baralho, carta3);
  empilharCarta(baralho, carta4);
  mostrarBaralho(baralho);
  removerCartaDoBaralho(baralho);
}

class Carta {
  String valor;
  String naipe;

  Carta(this.valor, this.naipe);

  @override
  String toString() {
    return '$valor $naipe';
  }
}

void empilharCarta(Queue<Carta> baralho,Carta carta) {
  baralho.add(carta);
  print("A carta empilhada foi o ${carta.valor} de ${carta.naipe}");
}

void mostrarBaralho(Queue<Carta> baralho) {
  print("Cartas no baralho:");
  for(var carta in baralho) {
    print("${carta.valor} de ${carta.naipe}");
  }

}

  void removerCartaDoBaralho(Queue<Carta> baralho) {
    while (baralho.isNotEmpty) {
      Carta cartaRemovida = baralho.removeLast();
      print("Removendo carta do topo: $cartaRemovida");
    }
  }
