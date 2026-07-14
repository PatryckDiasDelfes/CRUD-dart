
import 'dart:io';

import 'Contatos/contato.dart';
import 'Contatos/contato_empresarial.dart';
import 'Contatos/contato_pessoal.dart';

class Agenda {

  final List<Contato> _contatos = [];


  bool indiceValido(int i) {
    return i >= 0 && i < _contatos.length;
  }

  void listarContatos() {

    if (_contatos.isEmpty) {
      print('⚠️ Nenhum contato cadastrado.');
      return;
    }

    for (int i = 0; i < _contatos.length; i++) {
      print('\nContato $i');
      _contatos[i].imprimirDetalhe();
    }
  }

 void criarContato() {

  stdout.write('Tipo (1-Pessoal | 2-Empresarial): ');
  String tipo = stdin.readLineSync() ?? '';

  stdout.write('Nome: ');
  String nome = stdin.readLineSync() ?? '';

  if (existe(nome)) {
    print('❌ Nome já cadastrado!');
    return;
  }

  String email = validarEmail();
  String telefone = validarTelefone();


  switch(tipo) {

    case '1':

      stdout.write('CPF: ');
      String cpf = stdin.readLineSync() ?? '';

      _contatos.add(
        ContatoPessoal(
          nome,
          email,
          telefone,
          cpf,
        )
      );

      return;


    case '2':

      stdout.write('CNPJ: ');
      String cnpj = stdin.readLineSync() ?? '';

      stdout.write('Nome Fantasia: ');
      String nomeFantasia = stdin.readLineSync() ?? '';

      _contatos.add(
        ContatoEmpresarial(
          nome,
          email,
          telefone,
          cnpj,
          nomeFantasia,
        )
      );

      return;


    default:

      print('❌ Tipo inválido.');
      return;
  }

  print('✅ Contato adicionado.');
}

  void editarContato() {

    listarContatos();

    stdout.write('Digite o índice: ');
    int indice = int.tryParse(stdin.readLineSync() ?? '') ?? -1;


    if (!indiceValido(indice)) {
      print('❌ Índice inválido.');
      return;
    }


    stdout.write('Novo nome: ');
    _contatos[indice].nome = stdin.readLineSync() ?? '';


    _contatos[indice].email = validarEmail();


    stdout.write('Novo telefone: ');
    _contatos[indice].telefone = stdin.readLineSync() ?? '';


    if (_contatos[indice] is ContatoPessoal) {

      var contato = _contatos[indice] as ContatoPessoal;

      stdout.write('Novo apelido: ');
      contato.nome = stdin.readLineSync() ?? '';

    }


    if (_contatos[indice] is ContatoEmpresarial) {

      var contato = _contatos[indice] as ContatoEmpresarial;

      stdout.write('Nova empresa: ');
      contato.nomeFantasia = stdin.readLineSync() ?? '';

    }


    print('✅ Atualizado com sucesso.');
  }

  void deletarContato() {

    listarContatos();

    stdout.write('Digite o índice: ');
    int indice = int.tryParse(stdin.readLineSync() ?? '') ?? -1;


    if (!indiceValido(indice)) {
      print('❌ Índice inválido.');
      return;
    }


    stdout.write('Confirma exclusão? (s/n): ');
    String resposta = stdin.readLineSync()?.toLowerCase() ?? '';


    if (resposta == 's') {

      _contatos.removeAt(indice);
      print('✅ Removido com sucesso.');

    } else {

      print('⚠️ Cancelado.');

    }

  }

  void buscarContato() {
    
  stdout.write('Buscar: ');
  String busca = stdin.readLineSync()?.toLowerCase() ?? '';

  bool encontrado = false;


  for (var contato in _contatos) {

    if (contato.nome.toLowerCase().contains(busca)) {

      contato.imprimirDetalhe();
      encontrado = true;

    }

  }


  if (!encontrado) {
    print('⚠️ Nenhum contato encontrado.');
  }

}

  bool existe(String nome) {

    return _contatos.any(
      (contato) =>
        contato.nome.toLowerCase() == nome.toLowerCase()
    );

  }

  String validarEmail() {

    while(true) {

      stdout.write('Email: ');
      String email = stdin.readLineSync() ?? '';


      if(RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
      ).hasMatch(email)) {

        return email;

      }


      print('❌ Email inválido.');

    }

  }

  String validarTelefone() {

    while(true) {

      stdout.write('Telefone: ');
      String telefone = stdin.readLineSync() ?? '';


      if(RegExp(
        r'^(?:\+55\s?)?(?:\(?\d{2}\)?\s?)?(?:9\d{4}[-\s]?\d{4}|\d{4}[-\s]?\d{4})$'
      ).hasMatch(telefone)) {

        return telefone;

      }


      print('❌ Telefone inválido.');

    }

  }

}