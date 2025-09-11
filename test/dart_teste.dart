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

// Função para calcular o fatorial
int factorial(int n) {
  if (n < 0) throw ArgumentError('Número deve ser não negativo.');
  if (n == 0) return 1;
  int result = 1;
  int i = n;
  while (i > 1) {
    result *= i;
    i--;
  }
  return result;
}

// Função para verificar se um número é primo
bool isPrime(int number) {
  if (number <= 1) return false;
  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

//Função para calcular a soma dos dígitos
int sumOfDigits(int number) {
  if (number < 0) {
    throw ArgumentError('O número não pode ser negativo.');
  }
  int sum = 0;
  String numberStr = number.toString();
  for (int i = 0; i < numberStr.length; i++) {
    sum += int.parse(numberStr[i]);
  }
  return sum;
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

  group('Testes de Fatorial', () {
    test('Fatorial de 5', () {
      print('Verificando se raiz quadrada de 5 é um número perfeito...'); 
      expect(factorial(5), equals(120));
    });

    test('Fatorial de número negativo deve lançar erro', () {
      expect(() => factorial(-3), throwsArgumentError);
    });
  });

  group('Testes de Número primo', () {
    test('Número primo 7', () {
      expect(isPrime(7), isTrue);
    });

    test('Número não primo 10', () {
      expect(isPrime(10), isFalse);
    });
     test('Número 1 não é primo', () {
      expect(isPrime(1), isFalse);
    });
  });

  group('Testes de Soma dos dígitos', () {
    test('Soma dos dígitos de 123', () {
      expect(sumOfDigits(123), equals(6));
    });

    test('Soma dos dígitos de um número negativo deve lançar erro', () {
      expect(() => sumOfDigits(-123), throwsArgumentError);
    });
  });
}
