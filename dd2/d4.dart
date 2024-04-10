import 'dart:math' as math;

void main() {
  // Definindo o comparador de formas
  final comparador = ComparadorFormasGeometricas();

  // Definindo as formas geométricas
  final circuloA = Circulo('Circulo A', 3);
  final circuloB = Circulo('Circulo B', 8);
  final retanguloA = Retangulo('Retângulo A', 4, 3);
  final retanguloB = Retangulo('Retângulo B', 19, 11);
  final trianguloEquilateroA = TrianguloEquilatero('Triângulo Equilátero A', 5);
  final trianguloEquilateroB = TrianguloEquilatero('Triângulo Equilátero B', 8);
  final trianguloRetanguloA = TrianguloRetangulo('Triângulo Retângulo A', 3, 4, 5);
  final trianguloRetanguloB = TrianguloRetangulo('Triângulo Retângulo B', 5, 12, 13);
  final pentagonoRegularA = PentagonoRegular('Pentágono Regular A', 4);
  final pentagonoRegularB = PentagonoRegular('Pentágono Regular B', 6);
  final hexagonoRegularA = HexagonoRegular('Hexágono Regular A', 6);
  final hexagonoRegularB = HexagonoRegular('Hexágono Regular B', 8);

  // Encontrando formas com maior área
  FormaGeometrica formaMaiorArea = comparador.formaDeMaiorArea([
    circuloA,
    circuloB,
    retanguloA,
    retanguloB,
    trianguloEquilateroA,
    trianguloEquilateroB,
    trianguloRetanguloA,
    trianguloRetanguloB,
    pentagonoRegularA,
    pentagonoRegularB,
    hexagonoRegularA,
    hexagonoRegularB,
  ]);

  // Encontrando formas com maior perímetro
  FormaGeometrica formaMaiorPerimetro = comparador.formaDeMaiorPerimetro([
    circuloA,
    circuloB,
    retanguloA,
    retanguloB,
    trianguloEquilateroA,
    trianguloEquilateroB,
    trianguloRetanguloA,
    trianguloRetanguloB,
    pentagonoRegularA,
    pentagonoRegularB,
    hexagonoRegularA,
    hexagonoRegularB,
  ]);

  // Imprimindo os resultados
  print('A maior área pertence a ${formaMaiorArea.nome} com área de ${formaMaiorArea.calcularArea().toStringAsFixed(2)}');
  print('O maior perímetro pertence a ${formaMaiorPerimetro.nome} com perímetro de ${formaMaiorPerimetro.calcularPerimetro().toStringAsFixed(2)}');
}

/// Representa uma forma geométrica genérica
abstract class FormaGeometrica {
  FormaGeometrica(this.nome);
  String nome;
  double calcularArea();
  double calcularPerimetro();
}

/// Representa a forma geométrica "círculo"
class Circulo extends FormaGeometrica {
  double raio;
  String nome;

  Circulo(this.nome,this.raio): super(nome);

  @override
  double calcularArea() => math.pi * math.pow(raio, 2);

  @override
  double calcularPerimetro() => 2 * math.pi * raio;
}

/// Representa a forma geométrica "retângulo"
class Retangulo extends FormaGeometrica {
  double base;
  double altura;
  String nome;

  Retangulo(this.nome, this.base, this.altura): super(nome);

  @override
  double calcularArea() => base * altura;

  @override
  double calcularPerimetro() => 2 * (base + altura);
}

/// Representa a forma geométrica "triângulo equilátero"
class TrianguloEquilatero extends FormaGeometrica {
  double lado;
  String nome;

  TrianguloEquilatero(this.nome, this.lado): super(nome);

  @override
  double calcularArea() => (math.sqrt(3) / 4) * math.pow(lado, 2);

  @override
  double calcularPerimetro() => 3 * lado;
}

/// Representa a forma geométrica "triângulo retângulo"
class TrianguloRetangulo extends FormaGeometrica {
  double catetoA;
  double catetoB;
  double hipotenusa;
  String nome;

  TrianguloRetangulo(this.nome, this.catetoA, this.catetoB, this.hipotenusa): super(nome);

  @override
  double calcularArea() => (catetoA * catetoB) / 2;

  @override
  double calcularPerimetro() => catetoA + catetoB + hipotenusa;
}

/// Representa a forma geométrica "pentágono regular"
class PentagonoRegular extends FormaGeometrica {
  double lado;
  int numLados = 5;
  String nome;

  PentagonoRegular(this.nome, this.lado): super(nome);

  @override
  double calcularArea() => (0.25 * numLados * math.pow(lado, 2)) / (math.tan(math.pi / numLados));

  @override
  double calcularPerimetro() => numLados * lado;
}

/// Representa a forma geométrica "hexágono regular"
class HexagonoRegular extends FormaGeometrica {
  double lado;
  int numLados = 6;
  String nome;

  HexagonoRegular(this.nome, this.lado): super(nome);

  @override
  double calcularArea() => (1.5 * math.sqrt(3) * math.pow(lado, 2));

  @override
  double calcularPerimetro() => numLados * lado;
}

/// Compara características de formas geométricas
class ComparadorFormasGeometricas {
  FormaGeometrica formaDeMaiorArea(List<FormaGeometrica> formas) {
    FormaGeometrica formaMaiorArea = formas.first;

    for (var forma in formas) {
      if (forma.calcularArea() > formaMaiorArea.calcularArea()) {
        formaMaiorArea = forma;
      }
    }

    return formaMaiorArea;
  }

  FormaGeometrica formaDeMaiorPerimetro(List<FormaGeometrica> formas) {
    FormaGeometrica formaMaiorPerimetro = formas.first;

    for (var forma in formas) {
      if (forma.calcularPerimetro() > formaMaiorPerimetro.calcularPerimetro()) {
        formaMaiorPerimetro = forma;
      }
    }

    return formaMaiorPerimetro;
  }
}
