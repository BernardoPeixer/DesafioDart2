  // Função para imprimir informações no console
void imprimirInformacoesNoConsole(List<Musica> listaDeMusicas) {

  int duracaoTotalEmSegundos = 0;

  print("----Lista de músicas cadastradas----");

  for(var musica in listaDeMusicas) {
  print("Título: ${musica.tituloDaMusica}");
  print("Artista: ${musica.nomeDoArtista}");
  print("Nome do álbum: ${musica.nomeDoAlbum}");
  print("Duração: ${(musica.duracaoEmSegundos ~/ 60)}:${(musica.duracaoEmSegundos % 60)}"); // Convertendo segundos para minutos
  print("--------------------------------------------");
  duracaoTotalEmSegundos += musica.duracaoEmSegundos;
  }

  int horas = duracaoTotalEmSegundos ~/ 3600;
  int minutos = (duracaoTotalEmSegundos % 3600) ~/ 60;
  int segundos = duracaoTotalEmSegundos % 60;

  print("${listaDeMusicas.length} músicas na biblioteca - ${horas.toString()}:$minutos:$segundos Horas");
  print("--------------------------------------------");

   


}

  // Convertendo segundos para horas
void converterSegundosParaHoras(int duracaoEmSegundos) {
  int horas = duracaoEmSegundos ~/ 3600;
  int minutos = (duracaoEmSegundos % 3600) ~/ 60;
  int segundos = duracaoEmSegundos % 60;

  print("$horas:$minutos:$segundos");
}

  // Musica
class Musica {
  String tituloDaMusica;
  String nomeDoArtista;
  String nomeDoAlbum;
  int duracaoEmSegundos;

  // Construtor
  Musica(
    this.tituloDaMusica,
    this.nomeDoArtista,
    this.nomeDoAlbum,
    this.duracaoEmSegundos
    );
}

  // Biblioteca de musicas
class BibliotecaDeMusica{
  
  
  // Lista instanciada de Musicas
  var musicasDisponiveis = <Musica> [
    Musica("Welcome To The Jungle", "Guns N' Roses", "Appetite For Destruction", 272),
    Musica("Song For Someone", "U2", "Song For Someone - Single", 230),
    Musica("Where The Streets Have No Name", "U2", "The Joshua Tree", 338),
    Musica("Hotel California - 2013", "Eagles", "TCGH", 391),
    Musica("I'm Gonna Be (500 Miles)", "The Proclaimers", "Finest", 219),
  ];

  // Método de pesquisa por título
  List<Musica> buscarPorTitulo(String titulo) {
    List<Musica> musicasEncontradas = [];
    for (var musica in musicasDisponiveis) {
      if (musica.tituloDaMusica == titulo) {
        musicasEncontradas.add(musica);
      }
    }
    return musicasEncontradas;
  }

  // Método de pesquisa por artista
  List<Musica> buscarPorArtista(String artista) {
    List<Musica> musicasEncontradas = [];
    for (var musica in musicasDisponiveis) {
      if (musica.nomeDoArtista == artista) {
        musicasEncontradas.add(musica);
      }
    }
    return musicasEncontradas;
  }

  // Método de pesquisa por álbum
  List<Musica> buscarPorAlbum(String album) {
    List<Musica> musicasEncontradas = [];
    for (var musica in musicasDisponiveis) {
      if (musica.nomeDoAlbum == album) {
        musicasEncontradas.add(musica);
      }
    }
    return musicasEncontradas;
  }

}

void main() {
  // Instância de biblioteca
  var bibliotecaDeMusicas = BibliotecaDeMusica();
  // Criando instâncias para a função buscar
  var buscaPorTitulo = bibliotecaDeMusicas.buscarPorTitulo("I'm Gonna Be (500 Miles)");
  var buscaPorArtista = bibliotecaDeMusicas.buscarPorArtista("U2");
  var buscarPorAlbum = bibliotecaDeMusicas.buscarPorAlbum("TCGH");

  // Imprime as informações das músicas no console
  imprimirInformacoesNoConsole(bibliotecaDeMusicas.musicasDisponiveis);

  // Percorre cada música para verificar a pesquisa
  print("Música encontrada pelo título:");
  for(var musica in buscaPorTitulo) {
  print("Nome: ${musica.tituloDaMusica}, artista: ${musica.nomeDoArtista}, nome do álbum: ${musica.nomeDoAlbum}, duração: ${(musica.duracaoEmSegundos ~/ 60)}:${(musica.duracaoEmSegundos % 60)}");
  }
  print("--------------------------------------------");

  // Percorre cada música para verificar a pesquisa
  print("Músicas encontradas por artista:");
  for (var musica in buscaPorArtista) {
    print("Título: ${musica.tituloDaMusica}, Artista: ${musica.nomeDoArtista}, Álbum: ${musica.nomeDoAlbum}");
  }
  print("--------------------------------------------");

  // Percorre cada música para verificar a pesquisa
  print("Músicas encontradas por álbum:");
  for (var musica in buscarPorAlbum) {
    print("Título: ${musica.tituloDaMusica}, Artista: ${musica.nomeDoArtista}, Álbum: ${musica.nomeDoAlbum}");
  }
  print("--------------------------------------------");
}