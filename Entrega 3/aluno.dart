import 'nota/nota.dart';

class Aluno {
  final String nome;
  final List<Nota> _notas = [];

  Aluno(this.nome);

  void adicionarNota(Nota nota) {
    _notas.add(nota);
  }

  double get media {
    if (_notas.isEmpty) return 0;

    double somaNotas = 0;
    double somaPeso = 0;

    for (var nota in _notas) {
      somaNotas += nota.valor * nota.peso;
      somaPeso += nota.peso;
    }
    return somaNotas / somaPeso;
  }

}