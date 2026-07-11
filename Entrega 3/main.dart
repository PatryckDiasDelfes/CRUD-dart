import 'dart:io';

import 'turma.dart';
import 'nota/notaProva.dart';
import 'nota/notaTrabalho.dart';

void main() {
  
  Turma turma = Turma();

  while(true) {
    print('\n --- Sistema da Turma ---');
    print('1 - Cadastrar aluno');
    print('2 - Lançar nota');
    print('3 - Listar alunos');
    print('0 - sair');

    stdout.write('Escolha sua opção: ');
    String opcao = stdin.readLineSync() ?? '';

    switch (opcao){
      case '1':
        stdout.write('Nome do aluno: ');
        String nome = stdin.readLineSync() ?? '';

        turma.cadastrarAluno(nome);
        break;

      case '2':
        stdout.write('Indice do aluno: ');
        int indice = int.parse(stdin.readLineSync() ?? '0');

        if (indice < 0 || indice >= turma.totalAlunos) {
          print('Aluno não encontrado!');
          break;
        }

        stdout.write('Qual nota (1 - Prova | 2 - Trabalho): ');
        String confirmacao = stdin.readLineSync() ?? '';

        if (confirmacao == '1') {

          stdout.write('Nota: ');
          double valorProva = double.parse(stdin.readLineSync() ?? '0');

          turma.lancarNota(indice, NotaProva(valorProva));
          print('Nota lançada!');
          break;
        } else if (confirmacao == '2') {

          stdout.write('Nota: ');
          double valorTrabalho = double.parse(stdin.readLineSync() ?? '0');

          turma.lancarNota(indice, NotaTrabalho(valorTrabalho));
          print('Nota lançada');
          break;
        } else {
        print('Tipo de nota inválido');
}

      case '3':
        turma.listar();
        break;

      case '0':
        print('Encerrado');
        return;

    default:
      print('Opção invalida');

    }
  }

}