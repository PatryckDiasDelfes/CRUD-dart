import 'dart:io';
import 'agenda.dart';
import 'Contatos/contato.dart';

void main() {

  Agenda agenda = Agenda();

  while (true) {

    print('''
================ AGENDA ================
1 - Adicionar
2 - Listar
3 - Editar
4 - Deletar
5 - Buscar
6 - Sair
========================================
''');


    stdout.write('Escolha uma opção: ');
    String opcao = stdin.readLineSync() ?? '';


    switch (opcao) {

      case '1':
        agenda.criarContato();
        break;

      case '2':
        agenda.listarContatos();
        break;

      case '3':
        agenda.editarContato();
        break;

      case '4':
        agenda.deletarContato();
        break;

      case '5':
        agenda.buscarContato();
        break;

      case '6':
        print('Até breve! ✌');
        return;

      default:
        print('❌ Opção inválida!');
    }

  }

}