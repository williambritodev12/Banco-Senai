import 'dart:io';

import 'package:banco_senai/pessoaFisica.dart';
import 'package:banco_senai/pessoaJuridica.dart';
import 'package:banco_senai/usuario.dart';

void cadastrarUsuario(List<Usuario> usuarios) {
  print("\n--- Cadastro de Novo Usuário ---");

  stdout.write("Insira o nome completo: ");
  String novoTitular = stdin.readLineSync()!;

  stdout.write("É Pessoa Física (PF) ou Jurídica (PJ)? [PF/PJ]: ");
  String tipoPessoa = stdin.readLineSync()!.toUpperCase();
  while (tipoPessoa != 'PF' && tipoPessoa != 'PJ') {
    print("Opção inválida. Tente novamente.");
    stdout.write("É Pessoa Física (PF) ou Jurídica (PJ)? [PF/PJ]: ");
    tipoPessoa = stdin.readLineSync()!.toUpperCase();
  }

  String documento;
  if (tipoPessoa == 'PF') {
    stdout.write("Insira o CPF do titular: ");
    documento = stdin.readLineSync()!;
    PessoaFisica pessoa = PessoaFisica(novoTitular, documento);
    // Aqui você poderia guardar essa pessoa para uso posterior
  } else {
    stdout.write("Insira o CNPJ do titular: ");
    documento = stdin.readLineSync()!;
    PessoaJuridica pessoa = PessoaJuridica(novoTitular, documento);
    // Aqui você poderia guardar essa pessoa para uso posterior
  }

  // Verifica se o username já existe
  String novoUsername;
  bool usernameExistente = true;
  do {
    stdout.write("Crie um nome de usuário: ");
    novoUsername = stdin.readLineSync()!;
    if (usuarios.any((user) => user.username == novoUsername)) {
      print("Nome de usuário já existe. Por favor, escolha outro.");
    } else {
      usernameExistente = false;
    }
  } while (usernameExistente);

  stdout.write("Crie uma senha: ");
  String novaSenha = stdin.readLineSync()!;

  // Cria um novo usuário com o perfil de 'cliente'
  Usuario novoUsuario = Usuario(novoUsername, novaSenha, 'cliente');
  usuarios.add(novoUsuario);

  print("Usuário '${novoUsername}' criado com sucesso!");
}
