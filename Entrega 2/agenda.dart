import 'dart:io';
import 'contato.dart';


class Agenda {

  List<Contato> contatos = [];
  
  bool IndiceValido(int i) {
  return (i >= 0 && i < contatos.length);
}

  void listarContatos() {

    if(contatos.isEmpty) {
    print('Não possui contado a ser listado');
    return;
    } for (int i = 0; i < contatos.length; i++) {
    print(
        '$i - ${contatos[i].nome} | ${contatos[i].email} | ${contatos[i].telefone}'
    );
    }

  }

  void criarContato(){

    stdout.write('Qual seu nome? ');
  String nome = stdin.readLineSync() ?? '';

    if(existe(nome)) {
        print('❌ Nome já cadastrado!');
        return;
    }

  String email = validarEmail();

  stdout.write('Qual seu telefone? ');
  String telefone = validarTelefone();

    contatos.add(
        Contato(nome, email, telefone)
    );

  print('✅ Contato adcionado.');

}

  void editarContato() {

    listarContatos();

    stdout.write('Digite: ');
    int indice = int.tryParse(stdin.readLineSync() ?? '') ?? - 1;

    if (!IndiceValido(indice)) {
        print('❌ Invalido');
        return;
    }

    stdout.write('Novo nome: ');
    String nome = stdin.readLineSync() ?? '';

    String email = validarEmail();

    stdout.write('Telefone novo: ');
    String telefone = stdin.readLineSync() ?? '';

    contatos[indice].nome = nome;
    contatos[indice].email = email;
    contatos[indice].telefone = telefone;

    print('✅ Atualizado com sucesso!');

}

  void deletarContato() {

    listarContatos();

    stdout.write('Digite: ');
    int indice = int.tryParse(stdin.readLineSync() ?? '') ?? - 1;

    if (!IndiceValido(indice)) {
        print('❗Invalido');
        return;
    }

    stdout.write('Certeza que deseja deletar? ( s/n ) ');
    String confirmacao = (stdin.readLineSync() ?? '').toLowerCase();

    if (confirmacao != 's') {
        print('⚠️  Exclusão cancelada');
        return;

    }

    contatos.removeAt(indice);

    print('✅ Removido com sucesso');

}

  void buscaContato() {

        stdout.write('Busque contato: ');
    String busca = (stdin.readLineSync() ?? '').toLowerCase();

    bool achou = false;

    for (int i = 0; i < contatos.length; i++) {

        if  (contatos[i].nome.toLowerCase().contains(busca)){

        print('$i - ${contatos[i].nome}  |  ${contatos[i].email}  |  ${contatos[i].telefone}');

        achou = true;
        }
    }

    if (!achou){
        print('⚠️ Nenhum registro encontrado');
    }
    

}

  bool existe(String nome) {

    for (int i = 0; i < contatos.length; i++) {

        if (contatos[i].nome.toLowerCase() == nome.toLowerCase()) {
            return true;
        }
    }

    return false;
}

  String validarEmail() {
  String email = '';
  bool emailValido = false;
 
  while (!emailValido) {
    stdout.write('Email: ');
    email = stdin.readLineSync() ?? '';
 
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email)) {
      print('❌ E-mail inválido');
      continue;
    }
    emailValido = true;
  }
  return email;

}

  String validarTelefone() {

    while(true) {

    stdout.write('Digite o telefone: ');
    String telefone = stdin.readLineSync() ?? '';

    if (!RegExp(
        ''
    ).hasMatch(telefone)) {

        print('❌ Telefone inválido');
        continue;
    }

    return telefone;

    }


  }
}