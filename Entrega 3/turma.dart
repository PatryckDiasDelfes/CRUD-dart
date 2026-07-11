import 'nota/nota.dart';
import 'aluno.dart';

class Turma {
  final List<Aluno> _alunos = [];

  void cadastrarAluno(String nome) {

    _alunos.add(Aluno(nome));
    print('Aluno adcionado!');

  }

  void lancarNota(int i, Nota n) {

    _alunos[i].adicionarNota(n);

  }

  void listar() {

    if (_alunos.isEmpty) {
      print('Nenhum aluno encontrado!');
      return;
    }
    for (var i = 0; i < _alunos.length; i++) {
      print('$i - ${_alunos[i].nome} - Média: ${_alunos[i].media}');
    }

  }

  int get totalAlunos => _alunos.length;
}