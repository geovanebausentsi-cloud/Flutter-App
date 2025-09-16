import 'package:flutter_test/flutter_test.dart';

// Função para verificar se um número é perfeito
bool isPerfect(int num) {
  if (num < 1) return false;
  int sum = 0;
  for (int i = 1; i <= num ~/ 2; i++) {
    if (num % i == 0) {
      sum += i;
    }
  }
  return sum == num;
}

void main() {
  group('Testes de Número perfeito', () {
    test('Número perfeito 6', () {
      print('Verificando se 6 é um número perfeito...'); 
      expect(isPerfect(6), isTrue);
    });

    test('Número negativo não deve ser perfeito', () {
      print('Verificando se - é um número perfeito...'); 
      expect(isPerfect(-6), isFalse);
    });
  });

  
}

