import 'dart:io';
import 'agenda.dart';
import 'Contatos/contato.dart';

List<Contato> _contatos = [];

void main() {

  Agenda agenda = Agenda();

  while (true) {
    print('''
    ==== AGENDA ====
    1 -Adcionar  
    2 -Listar  
    3 -Editar  
    4 -Deletar  
    5 -Buscar  
    6 -Sair
    '''
    );

    String opcao = stdin.readLineSync() ?? '';

    switch (opcao) {
      case '1':{
        agenda.criarContato();
      }
      case '2': {
        agenda.listarContatos();
      }
      case '3': {
        agenda.editarContato();
      }
      case '4': {
        agenda.deletarContato();
      }
      case '5': {
        agenda.buscaContato();
      }
      case '6': {
        print('Até breve! ✌ ');
        return;
      }
      default: {
        print('❌ Opção inválida, tente novamente');
      }
    }

  }

}