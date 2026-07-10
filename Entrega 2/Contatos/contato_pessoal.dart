import 'contato.dart';

class ContatoPessoal extends Contato {
  String cpf;

  ContatoPessoal(
    super.nome,
    super.email,
    super.telefone,
    this.cpf,
  );

}