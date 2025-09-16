import 'package:flutter_test/flutter_test.dart';

//  Classe Abstrata Pessoa
abstract class Pessoa {
  late int _id;
  String nome;

  Pessoa(this.nome);

  int get id => _id;

  set id(int id) {
    if (id > 0) {
      _id = id;
    } else {
      throw ArgumentError('Identificador não pode ser negativo');
    }
  }
}

mixin Ano {
  late int _ano;

  int get ano => _ano;

  set ano(int ano) {
    if (ano > 0) {
      _ano = ano;
    } else {
      throw ArgumentError('Ano não pode ser negativo');
    }
  }
}

//  Classe Aluno
class Aluno extends Pessoa with Ano {
  Aluno(super.nome, int ano) {
    this.ano = ano;
  }
}

// Classe Disciplina
class Disciplina {
  String nome;
  Disciplina(this.nome);
}

// Classe Professor
class Professor extends Pessoa {
  Professor(super.nome);
}

// Classe Turma (Alterada para incluir Professor)
class Turma with Ano {
  Disciplina disciplina;
  Professor professor; // Atributo do tipo Professor
  final List<Aluno> _alunos = [];

  // Construtor atualizado para receber um Professor
  Turma(this.disciplina, this.professor, int ano) {
    this.ano = ano;
  }

  void matricular(Aluno aluno) {
    if (aluno.ano == ano) {
      _alunos.add(aluno);
    } else {
      throw ArgumentError('O ano do aluno deve ser o mesmo da turma.');
    }
  }
}

//  Classe Histórico (Alterada para verificar aprovação)
class Historico extends Turma {
  Map<Aluno, List<double>> notas = {};

  Historico(super.disciplina, super.professor, super.ano);

  @override
  void matricular(Aluno aluno) {
    super.matricular(aluno);
    notas[aluno] = []; // Inicializa a lista de notas do aluno
  }

  // Método para calcular a média de um aluno
  double media(Aluno aluno) {
    if (notas[aluno] == null || notas[aluno]!.isEmpty) {
      return 0.0;
    }
    double soma = 0;
    for (double nota in notas[aluno]!) {
      soma += nota;
    }
    return soma / notas[aluno]!.length;
  }

  // Método para verificar se o aluno está aprovado
  bool isAprovado(Aluno aluno) {
    return media(aluno) > 6.0;
  }
}

void main() {
  test('Testar matrícula de alunos e aprovação', () {
    // Criação dos objetos necessários
    Disciplina disciplina1 = Disciplina('Flutter');
    Professor professor1 = Professor('João'); // Objeto Professor
    Historico historico1 = Historico(disciplina1, professor1, 2023);

    // Cadastrar primeiro aluno
    Aluno aluno1 = Aluno('Maria', 2023);
    aluno1.id = 1;
    historico1.matricular(aluno1);
    expect(historico1.media(aluno1), 0.0);

    // Adicionar notas para a aluna Maria
    historico1.notas[aluno1]!.addAll([8.0, 9.0]);

    // Verificar a média e o status de aprovação
    expect(historico1.media(aluno1), 8.5);
    expect(historico1.isAprovado(aluno1), isTrue);

    // Cadastrar segundo aluno com ano diferente para gerar erro
    Aluno aluno2 = Aluno('Paula', 2022);
    try {
      aluno2.id = 0;
    } catch (error) {
      expect(error, isA<ArgumentError>());
    }
    try {
      historico1.matricular(aluno2);
    } catch (error) {
      expect(error, isA<ArgumentError>());
    }

    // Testar aluno reprovado
    Aluno aluno3 = Aluno('Carlos', 2023);
    aluno3.id = 2;
    historico1.matricular(aluno3);
    historico1.notas[aluno3]!.addAll([5.0, 6.0]);
    expect(historico1.media(aluno3), 5.5);
    expect(historico1.isAprovado(aluno3), isFalse);
  });
}
