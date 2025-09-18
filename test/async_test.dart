import 'package:flutter_test/flutter_test.dart';

Future<int> process() async {
  await Future.delayed(Duration(seconds: 5));
  return 0;
}

Map<String, List<double>> alunos = {
  'Maria': [8.0, 9.0],
  'Bruna': [7.0, 7.0],
  'Carla': [10.0, 9.0],
};

Future<List<double>?> search(String key) async {
  return Future.delayed(Duration(seconds: 2), () {
    if (alunos.containsKey(key)) {
      return alunos[key]!;
    }
    throw ArgumentError('Aluno não encontrado.');
  });
}

Stream<int> count() async* {
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

Stream<double> media(List<String> nomes) async* {
  for (String nome in nomes) {
    try {
      List<double>? notas = await search(nome);

      if (notas != null && notas.isNotEmpty) {
        double soma = 0.0;
        for (double nota in notas) {
          soma += nota;
        }
        double media = soma / notas.length;
        yield media;
      }
    } catch (error) {
      print('Erro ao processar o aluno $nome: $error');
    }
  }
}

void main() {
  group('Testes de programação assíncrona', () {
    late Future<int> result;
    setUp(() => result = process());
    test('Aguardando...', () => expect(result, isNotNull));
    test('Testando o resultado', () async {
      int num = await result;
      expect(num, 0);
    });
    test('Testando busca sem erros em Future', () {
      search('Maria').then((notas) => expect(notas, [8.0, 9.0]));
    });
    test('Testando busca com erros em Future', () {
      search('Paula').then((notas) {}).catchError((error) {
        expect(error, isA<ArgumentError>());
      });
    });
    test('Testando contagem em Stream', () {
      List<int> resultados = [];
      count().listen(
        (resultado) {
          resultados.add(resultado);
        },
        onDone: () {
          expect(resultados, [1, 2, 3]);
        },
        onError: (error) => expect(error, isNotNull),
      );
    });

    test('deve emitir as médias corretas para alunos válidos', () async {
      final resultados = await media(alunos.keys.toList()).toList();
      expect(resultados, [8.5, 7.0, 9.5]);
    });

    test(
      'deve pular alunos inválidos e emitir as médias dos válidos',
      () async {
        //a lista com take e skip para inserir "Paula" no meio sem precisar escrever uma lista fixa.
        final nomes = [...alunos.keys.take(1), 'Paula', ...alunos.keys.skip(2)];
        final resultados = await media(nomes).toList();
        expect(resultados, [8.5, 9.5]);
      },
    );
  });
}
