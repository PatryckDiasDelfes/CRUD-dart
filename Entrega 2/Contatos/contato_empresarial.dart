import 'contato.dart';

class ContatoEmpresarial extends Contato{

  String cnpj;
  String nomeFantasia;

  ContatoEmpresarial(
    super.nome,
    super.email,
    super.telefone,
    this.cnpj,
    this.nomeFantasia
  );

}
