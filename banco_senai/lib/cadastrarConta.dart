// import 'dart:io';

// import 'package:banco_senai/conta.dart';
// import 'package:banco_senai/contaCorrente.dart';
// import 'package:banco_senai/contaPoupanca.dart';

// void cadastrarConta(List<Conta> contas) {
//   print("\n--- Cadastro de Nova Conta ---");

//   stdout.write("Insira o nome do titular da conta: ");
//   String novoTitular = stdin.readLineSync()!;

//   stdout.write("É Pessoa Física (PF) ou Jurídica (PJ)? [PF/PJ]: ");
//   String tipoPessoa = stdin.readLineSync()!.toUpperCase();

//   String tipoConta;

//   if (tipoPessoa == 'PJ') {
//     print("Pessoa Jurídica só pode cadastrar Conta Corrente.");
//     tipoConta = 'CC';
//   } else {
//     stdout.write("Deseja Conta Corrente (CC) ou Poupança (CP)? [CC/CP]: ");
//     tipoConta = stdin.readLineSync()!.toUpperCase();

//     while (tipoConta != 'CC' && tipoConta != 'CP') {
//       print("Opção inválida. Tente novamente.");
//       stdout.write("Deseja Conta Corrente (CC) ou Poupança (CP)? [CC/CP]: ");
//       tipoConta = stdin.readLineSync()!.toUpperCase();
//     }
//   }

//   Conta? novaConta;
//   if (tipoConta == 'CC') {
//     novaConta = ContaCorrente(novoTitular, 0.0);
//   } else if (tipoConta == 'CP') {
//     novaConta = ContaPoupanca(novoTitular, 0.0);
//   }

//   if (novaConta != null) {
//     contas.add(novaConta);
//     print(
//       "\nConta de $novoTitular (${novaConta.runtimeType}) cadastrada com sucesso!",
//     );
//   } else {
//     print("\nErro ao cadastrar a conta. Operação cancelada.");
//   }
// }

// ** Funcional 1.2
// import 'dart:io';
// import 'package:banco_senai/conta.dart';
// import 'package:banco_senai/contaCorrente.dart';
// import 'package:banco_senai/contaPoupanca.dart';
// import 'package:banco_senai/pessoa.dart'; // Importa nova classe Pessoa
// import 'package:banco_senai/usuario.dart'; // Importa nova classe Usuario

// // Lista global para amazenar todos os usuários do sistema
// List<Usuario> usuarios = [];

// void cadastrarConta(List<Conta> contas) {
//   print("\n--- Cadastro de Nova Conta ---");

//   stdout.write("Insira o nome do titular da conta: ");
//   String novoTitular = stdin.readLineSync()!;

//   stdout.write("É Pessoa Física (PF) ou Jurídica (PJ)? [PF/PJ]: ");
//   String tipoPessoa = stdin.readLineSync()!.toUpperCase();
//   while (tipoPessoa != 'PF' && tipoPessoa != 'PJ') {
//     print("Opção inválida. Tente novamente.");
//     stdout.write("É Pessoa Física (PF) ou Jurídica (PJ)? [PF/PJ]: ");
//     tipoPessoa = stdin.readLineSync()!.toUpperCase();
//   }

//   String documento;
//   if (tipoPessoa == 'PF') {
//     stdout.write("Insira o CPF do titular: ");
//     documento = stdin.readLineSync()!;
//   } else {
//     stdout.write("Insira o CNPJ do titular: ");
//     documento = stdin.readLineSync()!;
//   }

//   // Cria um objeto Pessoa para o titular
//   Pessoa titular = Pessoa(novoTitular, tipoPessoa, documento);

//   // Validação: Verifica se o documento já existe
//   bool titularExiste = contas.any(
//     (conta) => conta.titular.toLowerCase() == titular.nome.toLowerCase(),
//   );
//   if (titularExiste) {
//     print(
//       "Já existe uma conta com este titular e documento. Por favor, utilize um nome diferente.",
//     );
//     return;
//   }

//   // Lógica para o tipo de conta (agora com a opção de 'CC&CP')
//   String tipoConta;
//   if (tipoPessoa == 'PJ') {
//     print("Pessoa Jurídica só pode cadastrar Conta Corrente.");
//     tipoConta = 'CC';
//   } else {
//     stdout.write(
//       "Deseja Conta Corrente (CC), Poupança (CP) ou ambas (CC&CP)? [CC/CP/CC&CP]: ",
//     );
//     tipoConta = stdin.readLineSync()!.toUpperCase();
//     while (tipoConta != 'CC' && tipoConta != 'CP' && tipoConta != 'CC&CP') {
//       print("Opção inválida. Tente novamente.");
//       stdout.write(
//         "Deseja Conta Corrente (CC), Poupança (CP) ou ambas (CC&CP)? [CC/CP/CC&CP]: ",
//       );
//       tipoConta = stdin.readLineSync()!.toUpperCase();
//     }
//   }

//   // Bloco de código para criar as contas
//   if (tipoConta == 'CC') {
//     ContaCorrente novaConta = ContaCorrente(titular.nome, 0.0);
//     contas.add(novaConta);
//     print("\nConta Corrente de $novoTitular cadastrada com sucesso!");
//   } else if (tipoConta == 'CP') {
//     ContaPoupanca novaConta = ContaPoupanca(titular.nome, 0.0);
//     contas.add(novaConta);
//     print("\nConta Poupança de $novoTitular cadastrada com sucesso!");
//   } else if (tipoConta == 'CC&CP') {
//     ContaCorrente novaContaCorrente = ContaCorrente(titular.nome, 0.0);
//     ContaPoupanca novaContaPoupanca = ContaPoupanca(titular.nome, 0.0);
//     contas.add(novaContaCorrente);
//     contas.add(novaContaPoupanca);
//     print(
//       "\nContas (Corrente e Poupança) de $novoTitular cadastradas com sucesso!",
//     );
//   } else {
//     print("\nErro ao cadastrar a conta. Operação cancelada.");
//     return;
//   }

//   // Cria um usuário padrão para o novo cliente
//   print("\n--- Criação de Usuário ---");
//   stdout.write("Crie um nome de usuário para o titular: ");
//   String novoUsername = stdin.readLineSync()!;
//   stdout.write("Crie uma senha: ");
//   String novaSenha = stdin.readLineSync()!;

//   Usuario novoUsuario = Usuario(novoUsername, novaSenha, 'cliente');
//   usuarios.add(novoUsuario);

//   print("Usuário '${novoUsername}' com perfil de cliente criado com sucesso!");
// }

// // Uma função auxiliar para buscar um usuário, pode ser usada para login
// Usuario? buscarUsuario(String username, String senha) {
//   try {
//     return usuarios.firstWhere(
//       (user) => user.username == username && user.senha == senha,
//     );
//   } catch (e) {
//     return null;
//   }
// }
// *** Funcional 1.2

import 'dart:io';

import 'package:banco_senai/conta.dart';
import 'package:banco_senai/contaCorrente.dart';
import 'package:banco_senai/contaPoupanca.dart';
import 'package:banco_senai/menu.dart' as banco_senai show usuarios;
import 'package:banco_senai/pessoa.dart';
import 'package:banco_senai/pessoaFisica.dart';
import 'package:banco_senai/pessoaJuridica.dart';
import 'package:banco_senai/usuario.dart'; // Importa a lista de usuários do arquivo principal

void cadastrarConta(List<Conta> contas, List<Usuario> usuarios) {
  print("\n--- Cadastro de Nova Conta ---");

  stdout.write("Insira o nome do titular da conta: ");
  String novoTitular = stdin.readLineSync()!;

  stdout.write("É Pessoa Física (PF) ou Jurídica (PJ)? [PF/PJ]: ");
  String tipoPessoa = stdin.readLineSync()!.toUpperCase();
  while (tipoPessoa != 'PF' && tipoPessoa != 'PJ') {
    print("Opção inválida. Tente novamente.");
    stdout.write("É Pessoa Física (PF) ou Jurídica (PJ)? [PF/PJ]: ");
    tipoPessoa = stdin.readLineSync()!.toUpperCase();
  }

  // A partir daqui, as alterações são aplicadas
  Pessoa titular;
  String documento;

  if (tipoPessoa == 'PF') {
    stdout.write("Insira o CPF do titular: ");
    documento = stdin.readLineSync()!;
    // Cria uma instância de PessoaFisica
    titular = PessoaFisica(novoTitular, documento);
  } else {
    stdout.write("Insira o CNPJ do titular: ");
    documento = stdin.readLineSync()!;
    // Cria uma instância de PessoaJuridica
    titular = PessoaJuridica(novoTitular, documento);
  }

  // Validação: Verifica se o documento já existe
  bool documentoExiste = contas.any(
    (conta) => conta.titular.toLowerCase() == titular.nome.toLowerCase(),
  );
  if (documentoExiste) {
    print(
      "Já existe uma conta com este documento. Por favor, utilize um nome diferente.",
    );
    return;
  }

  String tipoConta;
  if (tipoPessoa == 'PJ') {
    print("Pessoa Jurídica só pode cadastrar Conta Corrente.");
    tipoConta = 'CC';
  } else {
    stdout.write(
      "Deseja Conta Corrente (CC), Poupança (CP) ou ambas (CC&CP)? [CC/CP/CC&CP]: ",
    );
    tipoConta = stdin.readLineSync()!.toUpperCase();
    while (tipoConta != 'CC' && tipoConta != 'CP' && tipoConta != 'CC&CP') {
      print("Opção inválida. Tente novamente.");
      stdout.write(
        "Deseja Conta Corrente (CC), Poupança (CP) ou ambas (CC&CP)? [CC/CP/CC&CP]: ",
      );
      tipoConta = stdin.readLineSync()!.toUpperCase();
    }
  }

  if (tipoConta == 'CC') {
    ContaCorrente novaConta = ContaCorrente(titular.nome, 0.0);
    contas.add(novaConta);
    print("\nConta Corrente de ${titular.nome} cadastrada com sucesso!");
  } else if (tipoConta == 'CP') {
    ContaPoupanca novaConta = ContaPoupanca(titular.nome, 0.0);
    contas.add(novaConta);
    print("\nConta Poupança de ${titular.nome} cadastrada com sucesso!");
  } else if (tipoConta == 'CC&CP') {
    ContaCorrente novaContaCorrente = ContaCorrente(titular.nome, 0.0);
    ContaPoupanca novaContaPoupanca = ContaPoupanca(titular.nome, 0.0);
    contas.add(novaContaCorrente);
    contas.add(novaContaPoupanca);
    print(
      "\nContas (Corrente e Poupança) de ${titular.nome} cadastradas com sucesso!",
    );
  } else {
    print("\nErro ao cadastrar a conta. Operação cancelada.");
    return;
  }

  print("\n--- Criação de Usuário ---");
  stdout.write("Crie um nome de usuário para o titular: ");
  String novoUsername = stdin.readLineSync()!;
  stdout.write("Crie uma senha: ");
  String novaSenha = stdin.readLineSync()!;

  // Acessa a lista de usuários do arquivo principal
  banco_senai.usuarios.add(Usuario(novoUsername, novaSenha, 'cliente'));

  print("Usuário '${novoUsername}' com perfil de cliente criado com sucesso!");
}

// Funcional ***
//   stdout.write("Insira o nome do titular da conta: ");
//   String novoTitular = stdin.readLineSync()!;

//   // Validação: Verifica se já existem contas com esse nome.
//   bool titularExiste = contas.any(
//     (conta) => conta.titular.toLowerCase() == novoTitular.toLowerCase(),
//   );
//   if (titularExiste) {
//     print(
//       "Já existe uma conta com este titular. Por favor, utilize um nome diferente.",
//     );
//     return;
//   }

//   stdout.write("É Pessoa Física (PF) ou Jurídica (PJ)? [PF/PJ]: ");
//   String tipoPessoa = stdin.readLineSync()!.toUpperCase();

//   String tipoConta;

//   if (tipoPessoa == 'PJ') {
//     print("Pessoa Jurídica só pode cadastrar Conta Corrente.");
//     tipoConta = 'CC';
//   } else {
//     // Adicionamos a nova opção 'CC&CP' aqui
//     stdout.write(
//       "Deseja Conta Corrente (CC), Poupança (CP) ou ambas (CC&CP)? [CC/CP/CC&CP]: ",
//     );
//     tipoConta = stdin.readLineSync()!.toUpperCase();

//     // Atualizamos a validação para incluir a nova opção
//     while (tipoConta != 'CC' && tipoConta != 'CP' && tipoConta != 'CC&CP') {
//       print("Opção inválida. Tente novamente.");
//       stdout.write(
//         "Deseja Conta Corrente (CC), Poupança (CP) ou ambas (CC&CP)? [CC/CP/CC&CP]: ",
//       );
//       tipoConta = stdin.readLineSync()!.toUpperCase();
//     }
//   }

//   // Bloco de código para criar as contas
//   if (tipoConta == 'CC') {
//     ContaCorrente novaConta = ContaCorrente(novoTitular, 0.0);
//     contas.add(novaConta);
//     print("\nConta Corrente de $novoTitular cadastrada com sucesso!");
//   } else if (tipoConta == 'CP') {
//     ContaPoupanca novaConta = ContaPoupanca(novoTitular, 0.0);
//     contas.add(novaConta);
//     print("\nConta Poupança de $novoTitular cadastrada com sucesso!");
//   } else if (tipoConta == 'CC&CP') {
//     ContaCorrente novaContaCorrente = ContaCorrente(novoTitular, 0.0);
//     ContaPoupanca novaContaPoupanca = ContaPoupanca(novoTitular, 0.0);

//     contas.add(novaContaCorrente);
//     contas.add(novaContaPoupanca);

//     print(
//       "\nContas (Corrente e Poupança) de $novoTitular cadastradas com sucesso!",
//     );
//   } else {
//     print("\nErro ao cadastrar a conta. Operação cancelada.");
//   }
// }    //Funcional ****
//   String tipoConta;

//   if (tipoPessoa == 'PJ') {
//     print("Pessoa Jurídica só pode cadastrar Conta Corrente.");
//     tipoConta = 'CC';
//   } else {
//     stdout.write("Deseja Conta Corrente (CC) ou Poupança (CP)? [CC/CP]: ");
//     tipoConta = stdin.readLineSync()!.toUpperCase();

//     while (tipoConta != 'CC' && tipoConta != 'CP') {
//       print("Opção inválida. Tente novamente.");
//       stdout.write("Deseja Conta Corrente (CC) ou Poupança (CP)? [CC/CP]: ");
//       tipoConta = stdin.readLineSync()!.toUpperCase();
//     }
//   }

//   Conta? novaConta;
//   if (tipoConta == 'CC') {
//     novaConta = ContaCorrente(novoTitular, 0.0);
//   } else if (tipoConta == 'CP') {
//     novaConta = ContaPoupanca(novoTitular, 0.0);
//   }

//   if (novaConta != null) {
//     contas.add(novaConta);
//     print(
//       "\nConta de $novoTitular (${novaConta.runtimeType}) cadastrada com sucesso!",
//     );
//   } else {
//     print("\nErro ao cadastrar a conta. Operação cancelada.");
//   }
// }
// //   // Cria automaticamente a Conta Corrente e a Conta Poupança
// //   ContaCorrente novaContaCorrente = ContaCorrente(novoTitular, 0.0);
// //   ContaPoupanca novaContaPoupanca = ContaPoupanca(novoTitular, 0.0);

// //   contas.add(novaContaCorrente);
// //   contas.add(novaContaPoupanca);

// //   print(
// //     "\nContas (Corrente e Poupança) de '$novoTitular' cadastradas com sucesso!",
// //   );
// // }
