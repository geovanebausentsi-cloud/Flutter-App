import 'package:flutter_test/flutter_test.dart';
// metodos de lista

List<int> numeros = [1, 2, 3];
void main() {
  test('adcionar elemento', () {
    numeros.add(4);
    expect(numeros.contains(4), isTrue);
    print(numeros);
  });
  test('adcionar outra lista', () {
    numeros.addAll([5, 6]);
    expect(numeros.contains(5), isTrue);
    expect(
      numeros.contains(6),
      isTrue,
    ); //shif+alt+seta pra baixo = duplicar linha
    print(numeros);
  });

  test('adcionar na posição', () {
    numeros.insert(0, 0);
    expect(numeros.indexOf(0), 0);
    print(numeros);
  });

  test('remover elemento', () {
    numeros.remove(2); // [0, 2, 3, 4 ,5 ,6]

    expect(numeros.contains(2), isFalse);
    // essa linha serve para afirmar e garantir que o número
    // 2 não existe mais na lista numeros.
  });

  test('Remover na posição', () {
    numeros.removeAt(0);
    expect(numeros.contains(0), isFalse);
  });

  test('Testar tamanho', () {
    expect(numeros.length, 5);
  });

  test('Testar vazio e não vazio', () {
    expect(numeros.isEmpty, isFalse);
    expect(numeros.isNotEmpty, isTrue);
  });

  test('Testar ordenação', () {
    expect(numeros.reversed.toList(), [6, 5, 4, 3, 1]);
    expect(numeros, [1, 3, 4, 5, 6]);
    numeros = numeros.reversed.toList();
    expect(numeros, [6, 5, 4, 3, 1]);
    numeros.sort();
    expect(numeros, [1, 3, 4, 5, 6]);
  });

  test('testar percorrer lista', () {
    int soma = 0;
    for (int numero in numeros) {
      soma += numero;
    }
    expect(soma, 19);
    numeros = numeros.map((numero) => numero * 2).toList();
    //o map retornara um 'Iterable' conceito importante em dart
    //e a razão principal é a performance e a economia de memória.
    //o to list montara uma nova lista
    expect(numeros, [2, 6, 8, 10, 12]);
                      //filtro
    numeros = numeros.where((numero) => numero % 3 == 0).toList();
    expect(numeros, [6, 12]);
  });
}
