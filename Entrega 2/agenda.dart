import 'dart:io';
import 'Contatos/contato.dart';
import 'Contatos/contato_empresarial.dart';
import 'Contatos/contato_pessoal.dart';

class Agenda {


  List<Contato> _contatos = [];
  

  bool IndiceValido(int i) {
  return (i >= 0 && i < _contatos.length);
  }

  void listarContatos() {

  if(_contatos.isEmpty) {
    print('Não possui contado a ser listado');
    return;
  }

  for (int i = 0; i < _contatos.length; i++) {

  print('$i - ');
  _contatos[i].imprimirDetalhe();

}

  }

  void criarContato(){

    stdout.write('Qual o tipo de contato? ( 1 - Pessoal | 2 - Empresarial): ');
    String tipo = stdin.readLineSync() ?? ""; 

    stdout.write('Qual seu nome? ');
    String nome = stdin.readLineSync() ?? '';

    if(existe(nome)) {
        print('❌ Nome já cadastrado!');
        return;
    }

  String email = validarEmail();
  stdout.write('Qual seu telefone? ');
  String telefone = validarTelefone();

  if (tipo == '1') {
    stdout.write('CPF: ');
    String cpf = stdin.readLineSync() ?? '';

    _contatos.add(
      ContatoPessoal(nome, email, telefone, cpf)
    );

    } else if (tipo == '2') {
      stdout.write('CNPJ: ');
      String cnpj = stdin.readLineSync() ?? '';
      
      stdout.write('Nome Fantasia: ');
      String nomeFantasia = stdin.readLineSync() ?? '';

      _contatos.add(
        ContatoEmpresarial(nome, email, telefone, cnpj, nomeFantasia)
    );
  } else {
    print('❌ Nome já cadastrado!');
  }

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
  String novoNome = stdin.readLineSync() ?? '';

  stdout.write('Novo email: ');
  String novoEmail = stdin.readLineSync() ?? '';

  stdout.write('Novo telefone: ');
  String novoTelefone = stdin.readLineSync() ?? '';

  _contatos[indice].nome = novoNome;
  _contatos[indice].email = novoEmail;
  _contatos[indice].telefone = novoTelefone;



    if(_contatos[indice] is ContatoPessoal) {
      ContatoPessoal contato = _contatos[indice] as ContatoPessoal;

      stdout.write('Novo CPF: ');
      String novoCPF = stdin.readLineSync() ?? '';

      contato.cpf = novoCPF;

    } else if(_contatos[indice] is ContatoEmpresarial) {
      ContatoEmpresarial contato = _contatos[indice] as ContatoEmpresarial;

      stdout.write('Novo nome fantasia: ');
      String novoNomeFantasia = stdin.readLineSync() ?? '';

      stdout.write('Novo CNPJ: ');
      String novoCnpj = stdin.readLineSync() ?? '';

      contato.nomeFantasia = novoNomeFantasia;
      contato.cnpj = novoCnpj;
  }
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

    _contatos.removeAt(indice);

    print('✅ Removido com sucesso');

}

  void buscaContato() {

        stdout.write('Busque contato: ');
    String busca = (stdin.readLineSync() ?? '').toLowerCase();

    bool achou = false;

    for (int i = 0; i < _contatos.length; i++) {

        if  (_contatos[i].nome.toLowerCase().contains(busca)){

        print('$i - ${_contatos[i].nome}  |  ${_contatos[i].email}  |  ${_contatos[i].telefone}');

        achou = true;
        }
    }

    if (!achou){
        print('⚠️ Nenhum registro encontrado');
    }
    

}

  bool existe(String nome) {

    for (int i = 0; i < _contatos.length; i++) {

        if (_contatos[i].nome.toLowerCase() == nome.toLowerCase()) {
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
      r'^(?:\+55\s?)?(?:\(?\d{2}\)?\s?)?(?:9\d{4}[-\s]?\d{4}|\d{4}[-\s]?\d{4})$'
    ).hasMatch(telefone)) {

        print('❌ Telefone inválido');
        continue;
    }

    return telefone;

    }


  }
  
}