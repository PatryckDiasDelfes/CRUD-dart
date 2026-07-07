import 'dart:io';

/* Deixamos nossa List fora do main pois caso queiramos acessar fora dele temos como fazer isso,
Caso ele estivesse dentro do nosso main não poderiamos acessar ele fora do main, logo nosso
bool IndiceValido não iria funcionar. */
List <String> nomes = [];
List <String> emails = [];
List <String> telefones = [];

void main(){

  while (true) {
    print('''
     ⩶⩶⩶⩶⩶ AGENDA =======================
    1 -Adcionar  2 -Listar  3 -Editar  4 -Deletar  5 -Buscar  6 -Sair
    ''');

    String opcao = stdin.readLineSync() ?? '';

    switch (opcao) {
      case '1':{
        criarContato();
      }
      case '2': {
        listarContatos();
      }
      case '3': {
        editarContato();
      }
      case '4': {
        deletarContato();
      }
      case '5': {
        deletarContato();
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


/* A função IndiceValido verifica se o número informado corresponde a uma posição existente na lista, retornando true se existir e false se não existir. */
bool IndiceValido(int i) {
/*Se i for maior ou igual a 0 e menor que o tamanho da lista (nomes.length), significa que esse índice existe na lista,
então a função retorna true. Caso contrário, retorna false. */
  return (i >= 0 && i < nomes.length);
}


//A função listarContatos() percorre as listas de contatos e exibe, no terminal, as informações de cada contato cadastrado.
void listarContatos() {

//Se(if) nomes estiver vazio, ele retorna que não temos ninguem cadastrado
    if(nomes.isEmpty) {
    print('Não possui contado a ser listado');
  }
//O bloco do for é o código que será executado para cada contato da lista. Em cada repetição, i aponta para um contato diferente, permitindo acessar e mostrar suas informações.
  for (int i = 0; i < nomes.length; i++) {
//Em print ele ira pegar as iformações do indice, nome, email e telefone e me mostrara cada nome, email e telefone que corresponde ao indice.
    print('$i - ${nomes[i]} | ${emails[i]} | ${telefones[i]} ');
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

  nomes.add(nome);
  emails.add(email);
  telefones.add(telefone);

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

    nomes[indice] = nome;
    emails[indice] = email;
    telefones[indice] = telefone;

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

    nomes.removeAt(indice);
    emails.removeAt(indice);
    telefones.removeAt(indice);

    print('✅ Removido com sucesso');

}

void buscaContato() {

        stdout.write('Busca contato: ');
    String busca = (stdin.readLineSync() ?? '').toLowerCase();

    bool achou = false;

    for (int i = 0; i < nomes.length; i++) {

        if  (nomes[i].toLowerCase().contains(busca)){

        print('$i - ${nomes[i]}  |  ${emails[i]}  |  ${telefones[i]}');

        achou = true;
        }
    }

    if (!achou){
        print('⚠️ Nenhum registro encontrado');
    }
    

}

bool existe(String nome) {

    for (int i = 0; i < nomes.length; i++) {

        if (nomes[i].toLowerCase() == nome.toLowerCase()) {
            return true;
        }
    }

    return false;
}

//A função validarEmail() solicita um e-mail ao usuário e só finaliza quando ele digitar um e-mail válido, retornando esse valor.
String validarEmail() {
  String email = '';
  bool emailValido = false;
 
  while (!emailValido) {
    stdout.write('Email: ');
    email = stdin.readLineSync() ?? '';
 
//Aqui ele ira verificar se meu email é valido, por meio dos caracteres de validação
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email)) {
      print('❌ E-mail inválido');
      continue;
    }
    emailValido = true;
  }
  return email;

/*
O RegExp é uma ferramenta que verifica se um texto segue um formato específico, como o padrão de um e-mail.
O .hasMatch() verifica se um texto corresponde ao padrão definido em um RegExp, retornando true se corresponder e false se não corresponder.

Ou seja, nosso RegExp define um padrao e o hasMatch verifica se ele se encaixa no
*/

}

String validarTelefone() {

    while(true) {

    stdout.write('Digite o telefone: ');
    String telefone = stdin.readLineSync() ?? '';

    if (!RegExp(
        r'^(\+55\s?)?(\(\d{2}\)|\d{2})[\s-]?\d{4,5}[\s-]?\d{4}$'
    ).hasMatch(telefone)) {

        print('❌ Telefone inválido');
        continue;
    }

    return telefone;

    }
}   