import 'contato.dart';

class ContatoPessoal extends Contato {

  String cpf;

  ContatoPessoal(
    super.nome,
    super.email,
    super.telefone,
    this.cpf
  );


  @override
  void imprimirDetalhe() {
    print('''
      Nome: $nome
      Email: $email
      Telefone: $telefone
      CPF: $cpf
      ''');
  }
}