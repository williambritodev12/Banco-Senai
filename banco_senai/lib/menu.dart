// import 'dart:io';

// import 'package:banco_senai/cadastrarConta.dart';
// import 'package:banco_senai/conta.dart';
// import 'package:banco_senai/contaCorrente.dart';
// import 'package:banco_senai/contaPoupanca.dart';
// import 'package:banco_senai/filtrarConta.dart';
// import 'package:banco_senai/realizarTransferencia.dart';

// // Variável global para armazenar todas as contas
// List<Conta> contas = [];

// // Função principal que inicia o programa
// void main() {
//   print("___ Bem-vindo(a) ao SenaiBank ___");

//   // Exemplo de contas iniciais para testes
//   contas.add(ContaCorrente("Ercione", 10000));
//   contas.add(ContaPoupanca("Ana", 2000));

//   while (true) {
//     _exibirMenu();
//     String opcaoEscolhida = _obterOpcao();

//     if (opcaoEscolhida == '8') {
//       print("Obrigado por usar o SenaiBank! 👋");
//       break;
//     }

//     _lidarComOpcoes(opcaoEscolhida);
//     print("\nPressione Enter para continuar...");
//     stdin.readLineSync();
//   }
// }

// // Exibe o menu de opções
// void _exibirMenu() {
//   print("\n---------------------------");
//   print(" \n Selecione uma opção: \n");
//   print("---------------------------");
//   print(
//     "1. Cadastrar Nova Conta\n"
//     "2. Realizar Transferência Pix\n"
//     "3. Exibir Todas as Contas\n"
//     "4. Exibir Saldo de uma Conta\n"
//     "5. Sacar\n"
//     "6. Depositar\n"
//     "7. Simular Rendimento (Poupança)\n"
//     "8. Sair\n",
//   );
// }

// // Obtém e valida a opção do usuário
// String _obterOpcao() {
//   List<String> opcoesValidasMenu = ["1", "2", "3", "4", "5", "6", "7", "8"];
//   String? opcao;

//   do {
//     stdout.write("Digite uma opção válida: ");
//     opcao = stdin.readLineSync();
//     if (opcao == null || !opcoesValidasMenu.contains(opcao)) {
//       print("Opção inválida. Tente novamente!");
//     }
//   } while (opcao == null || !opcoesValidasMenu.contains(opcao));

//   return opcao;
// }

// // Lida com a opção escolhida pelo usuário
// void _lidarComOpcoes(String opcao) {
//   switch (opcao) {
//     case "1":
//       cadastrarConta(contas);
//       break;
//     case "2":
//       realizarTransferencia(contas);
//       break;
//     case "3":
//       _exibirContas();
//       break;
//     case "4":
//       _exibirSaldoConta(contas);
//       break;
//     case "5":
//       _sacarConta(contas);
//       break;
//     case "6":
//       _depositarConta(contas);
//       break;
//     case "7":
//       _simularRendimento(contas);
//       break;
//   }
// }

// // Função auxiliar para exibir as contas, pode ser movida para outro arquivo se necessário.
// void _exibirContas() {
//   if (contas.isEmpty) {
//     print("Nenhuma conta cadastrada.");
//     return;
//   }
//   print("\n--- Contas Cadastradas ---");
//   for (var conta in contas) {
//     print("Titular: ${conta.titular}");
//     print("Saldo: R\$${conta.saldo.toStringAsFixed(2)}");
//     print(
//       "Tipo: ${conta is ContaCorrente ? 'Conta Corrente' : 'Conta Poupança'}",
//     );
//     print("--------------------------");
//   }
// }

// // Função para exibir o saldo de uma conta específica
// void _exibirSaldoConta(List<Conta> contas) {
//   print("\n--- Exibir Saldo ---");
//   Conta? conta = filtrarConta(contas);
//   if (conta != null) {
//     print(
//       "Saldo da conta de ${conta.titular}: R\$${conta.saldo.toStringAsFixed(2)}",
//     );
//   }
// }

// // Função para sacar de uma conta
// void _sacarConta(List<Conta> contas) {
//   print("\n--- Sacar ---");
//   Conta? conta = filtrarConta(contas);
//   if (conta != null) {
//     stdout.write("Digite o valor a ser sacado: ");
//     double valorSaque = double.parse(stdin.readLineSync()!);
//     if (valorSaque <= 0) {
//       print("Valor de saque inválido.");
//       return;
//     }

//     if (conta is ContaCorrente) {
//       conta.sacarComChequeEspecial(valorSaque);
//     } else if (conta.saldo >= valorSaque) {
//       conta.saldo -= valorSaque;
//       print(
//         "Saque de R\$${valorSaque.toStringAsFixed(2)} realizado com sucesso!",
//       );
//       print("Novo saldo: R\$${conta.saldo.toStringAsFixed(2)}.");
//     } else {
//       print("Saldo insuficiente.");
//     }
//   }
// }

// // Função para depositar em uma conta
// void _depositarConta(List<Conta> contas) {
//   print("\n--- Depositar ---");
//   Conta? conta = filtrarConta(contas);
//   if (conta != null) {
//     stdout.write("Digite o valor a ser depositado: ");
//     double valorDeposito = double.parse(stdin.readLineSync()!);
//     if (valorDeposito > 0) {
//       conta.saldo += valorDeposito;
//       print(
//         "Depósito de R\$${valorDeposito.toStringAsFixed(2)} realizado com sucesso!",
//       );
//       print("Novo saldo: R\$${conta.saldo.toStringAsFixed(2)}.");
//     } else {
//       print("Valor de depósito inválido.");
//     }
//   }
// }

// // Função para simular rendimento
// void _simularRendimento(List<Conta> contas) {
//   print("\n--- Simular Rendimento ---");
//   print("Selecione a conta poupança para aplicar o rendimento:");
//   Conta? conta = filtrarConta(contas);
//   if (conta != null) {
//     if (conta is ContaPoupanca) {
//       stdout.write("Digite a taxa de juros mensal (ex: 0.005 para 0.5%): ");
//       double taxa = double.parse(stdin.readLineSync()!);
//       conta.simularRendimento(taxa);
//     } else {
//       print("A conta de ${conta.titular} não é uma Conta Poupança.");
//     }
//   }
// }

// import 'dart:io';
// import 'package:banco_senai/cadastrarConta.dart';
// import 'package:banco_senai/conta.dart';
// import 'package:banco_senai/contaCorrente.dart';
// import 'package:banco_senai/contaPoupanca.dart';
// import 'package:banco_senai/filtrarConta.dart'; // Importa a nova função
// import 'package:banco_senai/realizarTransferencia.dart';
// import 'package:banco_senai/usuario.dart';

// // Lista de contas de usuários
// List<Usuario> usuarios = [];

// // Variável global para armazenar todas as contas
// List<Conta> contas = [];

// void main() {
//   // void main() {
//   print("___ Bem-vindo(a) ao SenaiBank ___");

//   // Adiciona um usuário administrador padrão ao iniciar o programa
//   usuarios.add(Usuario('admin', 'admin123', 'admin'));
//   print("Usuário administrador padrão criado.");

//   // Exemplo de contas iniciais para testes (criando os dois tipos de conta)
//   contas.add(ContaCorrente("Ercione", 10000));
//   contas.add(ContaPoupanca("Ercione", 2000));
//   contas.add(ContaCorrente("Ana", 5000));
//   contas.add(ContaPoupanca("Ana", 1500));

//   while (true) {
//     _exibirMenu();
//     String opcaoEscolhida = _obterOpcao();

//     if (opcaoEscolhida == '8') {
//       print("Obrigado por usar o SenaiBank! 👋");
//       break;
//     }

//     _lidarComOpcoes(opcaoEscolhida);
//     print("\nPressione Enter para continuar...");
//     stdin.readLineSync();
//   }
// }

// void _exibirMenu() {
//   print("\n---------------------------");
//   print(" \n Selecione uma opção: \n");
//   print("---------------------------");
//   print(
//     "1. Cadastrar Nova Conta\n"
//     "2. Realizar Transferência Pix\n"
//     "3. Exibir Todas as Contas\n"
//     "4. Exibir Saldo de uma Conta\n"
//     "5. Sacar\n"
//     "6. Depositar\n"
//     "7. Simular Rendimento (Poupança)\n"
//     "8. Sair\n",
//   );
// }

// String _obterOpcao() {
//   List<String> opcoesValidasMenu = ["1", "2", "3", "4", "5", "6", "7", "8"];
//   String? opcao;

//   do {
//     stdout.write("Digite uma opção válida: ");
//     opcao = stdin.readLineSync();
//     if (opcao == null || !opcoesValidasMenu.contains(opcao)) {
//       print("Opção inválida. Tente novamente!");
//     }
//   } while (opcao == null || !opcoesValidasMenu.contains(opcao));

//   return opcao;
// }

// void _lidarComOpcoes(String opcao) {
//   switch (opcao) {
//     case "1":
//       cadastrarConta(contas);
//       break;
//     case "2":
//       // A função realizarTransferencia precisa ser adaptada para essa nova lógica
//       realizarTransferencia(contas);
//       break;
//     case "3":
//       _exibirContas();
//       break;
//     case "4":
//       _exibirSaldoConta(contas);
//       break;
//     case "5":
//       _sacarConta(contas);
//       break;
//     case "6":
//       _depositarConta(contas);
//       break;
//     case "7":
//       _simularRendimento(contas);
//       break;
//   }
// }

// import 'dart:io';

// import 'package:banco_senai/cadastrarConta.dart';
// import 'package:banco_senai/conta.dart';
// import 'package:banco_senai/contaCorrente.dart';
// import 'package:banco_senai/contaPoupanca.dart';
// import 'package:banco_senai/filtrarConta.dart';
// import 'package:banco_senai/realizarTransferencia.dart';
// import 'package:banco_senai/usuario.dart';

// // A lista de contas de usuários
// List<Conta> contas = [];

// // Nova função para iniciar o menu principal
// void iniciarMenu(Usuario usuarioLogado) {
//   // Exemplo de contas iniciais para testes (criando os dois tipos de conta)
//   contas.add(ContaCorrente("Ercione", 10000));
//   contas.add(ContaPoupanca("Ercione", 2000));
//   contas.add(ContaCorrente("Ana", 5000));
//   contas.add(ContaPoupanca("Ana", 1500));

//   while (true) {
//     _exibirMenu(usuarioLogado);
//     String opcaoEscolhida = _obterOpcao();

//     if (opcaoEscolhida == '8') {
//       print("Obrigado por usar o SenaiBank! 👋");
//       break;
//     }

//     _lidarComOpcoes(opcaoEscolhida, usuarioLogado);
//     print("\nPressione Enter para continuar...");
//     stdin.readLineSync();
//   }
// }

// // Exibe o menu de opções com base no papel do usuário.
// void _exibirMenu(Usuario usuario) {
//   print("\n---------------------------");
//   print("Usuário logado: ${usuario.username} (${usuario.role})");
//   print("Selecione uma opção: \n");
//   print("---------------------------");

//   // Opções para o administrador
//   if (usuario.role == 'admin') {
//     print("1. Cadastrar Nova Conta\n"
//       "2. Realizar Transferência Pix\n"
//       "3. Exibir Todas as Contas\n"
//       "4. Exibir Saldo de uma Conta\n"
//       "5. Sacar\n"
//       "6. Depositar\n"
//       "7. Simular Rendimento (Poupança)\n"
//       "8. Sair\n");
//   } else {
//     // Opções para um cliente padrão
//     print("2. Realizar Transferência Pix\n"
//       "4. Exibir Saldo de uma Conta\n"
//       "5. Sacar\n"
//       "6. Depositar\n"
//       "7. Simular Rendimento (Poupança)\n"
//       "8. Sair\n");
//   }
// }

// String _obterOpcao() {
//   List<String> opcoesValidasMenu = ["1", "2", "3", "4", "5", "6", "7", "8"];
//   String? opcao;

//   do {
//     stdout.write("Digite uma opção válida: ");
//     opcao = stdin.readLineSync();
//     if (opcao == null || !opcoesValidasMenu.contains(opcao)) {
//       print("Opção inválida. Tente novamente!");
//     }
//   } while (opcao == null || !opcoesValidasMenu.contains(opcao));

//   return opcao;
// }

// void _lidarComOpcoes(String opcao, Usuario usuario) {
//   switch (opcao) {
//     case "1":
//       if (usuario.role == 'admin') {
//         cadastrarConta(contas);
//       } else {
//         print("Acesso negado. Esta opção é apenas para administradores.");
//       }
//       break;
//     case "2":
//       realizarTransferencia(contas);
//       break;
//     case "3":
//       if (usuario.role == 'admin') {
//         _exibirContas();
//       } else {
//         print("Acesso negado. Esta opção é apenas para administradores.");
//       }
//       break;
//     case "4":
//       _exibirSaldoConta(contas);
//       break;
//     case "5":
//       _sacarConta(contas);
//       break;
//     case "6":
//       _depositarConta(contas);
//       break;
//     case "7":
//       _simularRendimento(contas);
//       break;
//   }
// }

// import 'dart:io';

// import 'package:banco_senai/cadastrarConta.dart';
// import 'package:banco_senai/conta.dart';
// import 'package:banco_senai/contaCorrente.dart';
// import 'package:banco_senai/contaPoupanca.dart';
// import 'package:banco_senai/filtrarConta.dart';
// import 'package:banco_senai/realizarTransferencia.dart';
// import 'package:banco_senai/usuario.dart';

// // Variável global para armazenar todas as contas
// List<Conta> contas = [];

// // Lista de usuários
// List<Usuario> usuarios = [];

// // Nova função para iniciar o menu principal
// void iniciarMenu(Usuario usuarioLogado) {
//   contas.add(ContaCorrente("Ercione", 10000));
//   contas.add(ContaPoupanca("Ercione", 2000));
//   contas.add(ContaCorrente("Ana", 5000));
//   contas.add(ContaPoupanca("Ana", 1500));

//   while (true) {
//     _exibirMenu(usuarioLogado);
//     String opcaoEscolhida = _obterOpcao();

//     if (opcaoEscolhida == '8') {
//       print("Obrigado por usar o SenaiBank! 👋");
//       break;
//     }

//     _lidarComOpcoes(opcaoEscolhida, usuarioLogado);
//     print("\nPressione Enter para continuar...");
//     stdin.readLineSync();
//   }
// }

// // Restante do código do menu...

// void _lidarComOpcoes(String opcao, Usuario usuario) {
//   switch (opcao) {
//     case "1":
//       if (usuario.role == 'admin') {
//         // Aqui o erro é corrigido: passa a lista de usuários como argumento
//         cadastrarConta(contas, usuarios);
//       } else {
//         print("Acesso negado. Esta opção é apenas para administradores.");
//       }
//       break;
//     case "2":
//       realizarTransferencia(contas);
//       break;
//     case "3":
//       if (usuario.role == 'admin') {
//         _exibirContas();
//       } else {
//         print("Acesso negado. Esta opção é apenas para administradores.");
//       }
//       break;
//     case "4":
//       _exibirSaldoConta(contas);
//       break;
//     case "5":
//       _sacarConta(contas);
//       break;
//     case "6":
//       _depositarConta(contas);
//       break;
//     case "7":
//       _simularRendimento(contas);
//       break;
//   }
// }
// // Resto das funções...

// // Função auxiliar para exibir as contas, sem alterações.
// void _exibirContas() {
//   if (contas.isEmpty) {
//     print("Nenhuma conta cadastrada.");
//     return;
//   }
//   print("\n--- Contas Cadastradas ---");
//   for (var conta in contas) {
//     print("Titular: ${conta.titular}");
//     print("Saldo: R\$${conta.saldo.toStringAsFixed(2)}");
//     print("Tipo: ${conta.tipo}");
//     print("--------------------------");
//   }
// }

// // Novo auxiliar para obter e selecionar uma conta
// Conta? _selecionarConta(List<Conta> contasEncontradas) {
//   if (contasEncontradas.length == 1) {
//     return contasEncontradas.first;
//   }

//   print("Contas encontradas:");
//   for (int i = 0; i < contasEncontradas.length; i++) {
//     print(
//       "${i + 1}. Titular: ${contasEncontradas[i].titular} (${contasEncontradas[i].tipo})",
//     );
//   }

//   stdout.write("Selecione a conta (1 ou 2): ");
//   String? escolha = stdin.readLineSync();
//   int? index = int.tryParse(escolha!) ?? -1;

//   if (index! > 0 && index <= contasEncontradas.length) {
//     return contasEncontradas[index - 1];
//   } else {
//     print("Seleção inválida.");
//     return null;
//   }
// }

// // Função para exibir o saldo de uma conta específica
// void _exibirSaldoConta(List<Conta> contas) {
//   print("\n--- Exibir Saldo ---");
//   List<Conta> contasEncontradas = filtrarContasPorTitular(contas);

//   if (contasEncontradas.isNotEmpty) {
//     Conta? contaSelecionada = _selecionarConta(contasEncontradas);
//     if (contaSelecionada != null) {
//       print(
//         "Saldo da conta de ${contaSelecionada.titular} (${contaSelecionada.tipo}): R\$${contaSelecionada.saldo.toStringAsFixed(2)}",
//       );
//     }
//   }
// }

// // Função para sacar de uma conta
// void _sacarConta(List<Conta> contas) {
//   print("\n--- Sacar ---");
//   List<Conta> contasEncontradas = filtrarContasPorTitular(contas);

//   if (contasEncontradas.isNotEmpty) {
//     Conta? conta = _selecionarConta(contasEncontradas);
//     if (conta != null) {
//       stdout.write("Digite o valor a ser sacado: ");
//       double valorSaque = double.parse(stdin.readLineSync()!);
//       if (valorSaque <= 0) {
//         print("Valor de saque inválido.");
//         return;
//       }

//       if (conta is ContaCorrente) {
//         conta.sacarComChequeEspecial(valorSaque);
//       } else if (conta.saldo >= valorSaque) {
//         conta.saldo -= valorSaque;
//         print(
//           "Saque de R\$${valorSaque.toStringAsFixed(2)} realizado com sucesso!",
//         );
//         print("Novo saldo: R\$${conta.saldo.toStringAsFixed(2)}.");
//       } else {
//         print("Saldo insuficiente.");
//       }
//     }
//   }
// }

// // Função para depositar em uma conta
// void _depositarConta(List<Conta> contas) {
//   print("\n--- Depositar ---");
//   List<Conta> contasEncontradas = filtrarContasPorTitular(contas);

//   if (contasEncontradas.isNotEmpty) {
//     Conta? conta = _selecionarConta(contasEncontradas);
//     if (conta != null) {
//       stdout.write("Digite o valor a ser depositado: ");
//       double valorDeposito = double.parse(stdin.readLineSync()!);
//       if (valorDeposito > 0) {
//         conta.saldo += valorDeposito;
//         print(
//           "Depósito de R\$${valorDeposito.toStringAsFixed(2)} realizado com sucesso!",
//         );
//         print("Novo saldo: R\$${conta.saldo.toStringAsFixed(2)}.");
//       } else {
//         print("Valor de depósito inválido.");
//       }
//     }
//   }
// }

// // Função para simular rendimento
// void _simularRendimento(List<Conta> contas) {
//   print("\n--- Simular Rendimento ---");
//   List<Conta> contasEncontradas = filtrarContasPorTitular(contas);

//   if (contasEncontradas.isNotEmpty) {
//     Conta? conta = _selecionarConta(contasEncontradas);
//     if (conta != null) {
//       if (conta is ContaPoupanca) {
//         stdout.write("Digite a taxa de juros mensal (ex: 0.005 para 0.5%): ");
//         double taxa = double.parse(stdin.readLineSync()!);
//         conta.simularRendimento(taxa);
//       } else {
//         print("A conta de ${conta.titular} não é uma Conta Poupança.");
//       }
//     }
//   }
// }

//***
//*

// import 'dart:io';

// import 'package:banco_senai/cadastrarConta.dart';
// import 'package:banco_senai/conta.dart';
// import 'package:banco_senai/contaCorrente.dart';
// import 'package:banco_senai/contaPoupanca.dart';
// import 'package:banco_senai/filtrarConta.dart';
// import 'package:banco_senai/realizarTransferencia.dart';
// import 'package:banco_senai/usuario.dart';

// // Variável global para armazenar todas as contas
// List<Conta> contas = [];
// // Lista de usuários
// List<Usuario> usuarios = [];

// void iniciarMenu(Usuario usuarioLogado) {
//   // Exemplo de contas iniciais para testes (criando os dois tipos de conta)
//   contas.add(ContaCorrente("Ercione", 10000));
//   contas.add(ContaPoupanca("Ercione", 2000));
//   contas.add(ContaCorrente("Ana", 5000));
//   contas.add(ContaPoupanca("Ana", 1500));

//   while (true) {
//     _exibirMenu(usuarioLogado);
//     String opcaoEscolhida = _obterOpcao();

//     if (opcaoEscolhida == '8') {
//       print("Obrigado por usar o SenaiBank! 👋");
//       break;
//     }

//     _lidarComOpcoes(opcaoEscolhida, usuarioLogado);
//     print("\nPressione Enter para continuar...");
//     stdin.readLineSync();
//   }
// }

// // Exibe o menu de opções com base no papel do usuário.
// void _exibirMenu(Usuario usuario) {
//   print("\n---------------------------");
//   print("Usuário logado: ${usuario.username} (${usuario.role})");
//   print("Selecione uma opção: \n");
//   print("---------------------------");

//   // Opções para o administrador
//   if (usuario.role == 'admin') {
//     print(
//       "1. Cadastrar Nova Conta\n"
//       "2. Realizar Transferência Pix\n"
//       "3. Exibir Todas as Contas\n"
//       "4. Exibir Saldo de uma Conta\n"
//       "5. Sacar\n"
//       "6. Depositar\n"
//       "7. Simular Rendimento (Poupança)\n"
//       "8. Sair\n",
//     );
//   } else {
//     // Opções para um cliente padrão
//     print(
//       "2. Realizar Transferência Pix\n"
//       "4. Exibir Saldo de uma Conta\n"
//       "5. Sacar\n"
//       "6. Depositar\n"
//       "7. Simular Rendimento (Poupança)\n"
//       "8. Sair\n",
//     );
//   }
// }

// String _obterOpcao() {
//   List<String> opcoesValidasMenu = ["1", "2", "3", "4", "5", "6", "7", "8"];
//   String? opcao;

//   do {
//     stdout.write("Digite uma opção válida: ");
//     opcao = stdin.readLineSync();
//     if (opcao == null || !opcoesValidasMenu.contains(opcao)) {
//       print("Opção inválida. Tente novamente!");
//     }
//   } while (opcao == null || !opcoesValidasMenu.contains(opcao));

//   return opcao;
// }

// void _lidarComOpcoes(String opcao, Usuario usuario) {
//   switch (opcao) {
//     case "1":
//       if (usuario.role == 'admin') {
//         cadastrarConta(contas, usuarios);
//       } else {
//         print("Acesso negado. Esta opção é apenas para administradores.");
//       }
//       break;
//     case "2":
//       realizarTransferencia(contas);
//       break;
//     case "3":
//       if (usuario.role == 'admin') {
//         _exibirContas();
//       } else {
//         print("Acesso negado. Esta opção é apenas para administradores.");
//       }
//       break;
//     case "4":
//       _exibirSaldoConta(contas);
//       break;
//     case "5":
//       _sacarConta(contas);
//       break;
//     case "6":
//       _depositarConta(contas);
//       break;
//     case "7":
//       _simularRendimento(contas);
//       break;
//   }
// }

// // Funções auxiliares (elas precisam estar definidas antes de serem chamadas no menu)
// // A ordem não importa tanto aqui, desde que estejam antes da função principal.
//**Funcional */

// lib/menu.dart

import 'dart:io';

import 'package:banco_senai/cadastrarConta.dart';
import 'package:banco_senai/conta.dart';
import 'package:banco_senai/contaCorrente.dart';
import 'package:banco_senai/contaPoupanca.dart';
import 'package:banco_senai/filtrarConta.dart';
import 'package:banco_senai/realizarTransferencia.dart';
import 'package:banco_senai/usuario.dart';

List<Conta> contas = [];
List<Usuario> usuarios = [];

// A função iniciarMenu agora recebe as contas
void iniciarMenu(Usuario usuarioLogado, List<Conta> contas) {
  while (true) {
    _exibirMenu(usuarioLogado);
    String opcaoEscolhida = _obterOpcao();

    if (opcaoEscolhida == '8') {
      print("Deslogando usuário ${usuarioLogado.username}.");
      break; // Sai do menu, mas o programa continua.
    }

    // Adicione um case para a nova opção de sair do sistema
    if (opcaoEscolhida == '9') {
      print("Saindo do sistema. Até mais!");
      exit(0); // Encerra o programa completamente
    }

    _lidarComOpcoes(opcaoEscolhida, usuarioLogado);
    print("\nPressione Enter para continuar...");
    stdin.readLineSync();
  }
}

void _exibirMenu(Usuario usuario) {
  print("\n---------------------------");
  print("Usuário logado: ${usuario.username} (${usuario.role})");
  print("Selecione uma opção: \n");
  print("---------------------------");

  if (usuario.role == 'admin') {
    print(
      "1. Cadastrar Nova Conta\n"
      "2. Realizar Transferência Pix\n"
      "3. Exibir Todas as Contas\n"
      "4. Exibir Saldo de uma Conta\n"
      "5. Sacar\n"
      "6. Depositar\n"
      "7. Simular Rendimento (Poupança)\n"
      "8. Deslogar\n"
      "9. Sair do Sistema\n",
    );
  } else {
    print(
      "2. Realizar Transferência Pix\n"
      "4. Exibir Saldo de uma Conta\n"
      "5. Sacar\n"
      "6. Depositar\n"
      "7. Simular Rendimento (Poupança)\n"
      "8. Deslogar\n"
      "9. Sair do Sistema\n",
    );
  }
}

String _obterOpcao() {
  List<String> opcoesValidasMenu = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
  ];
  String? opcao;

  do {
    stdout.write("Digite uma opção válida: ");
    opcao = stdin.readLineSync();
    if (opcao == null || !opcoesValidasMenu.contains(opcao)) {
      print("Opção inválida. Tente novamente!");
    }
  } while (opcao == null || !opcoesValidasMenu.contains(opcao));

  return opcao;
}

// O restante das funções do menu (lidarComOpcoes, exibirContas, etc.)
// precisa ser atualizado para usar a lista de contas que agora é um parâmetro
// da função iniciarMenu.
void _lidarComOpcoes(String opcao, Usuario usuario) {
  switch (opcao) {
    case "1":
      if (usuario.role == 'admin') {
        // A função cadastrarConta também precisa da lista de contas e usuários
        cadastrarConta(contas, usuarios);
      } else {
        print("Acesso negado. Esta opção é apenas para administradores.");
      }
      break;
    case "2":
      realizarTransferencia(contas);
      break;
    case "3":
      if (usuario.role == 'admin') {
        _exibirContas();
      } else {
        print("Acesso negado. Esta opção é apenas para administradores.");
      }
      break;
    case "4":
      _exibirSaldoConta(contas);
      break;
    case "5":
      _sacarConta(contas);
      break;
    case "6":
      _depositarConta(contas);
      break;
    case "7":
      _simularRendimento(contas);
      break;
  }
}

// Função auxiliar para exibir as contas
void _exibirContas() {
  if (contas.isEmpty) {
    print("Nenhuma conta cadastrada.");
    return;
  }
  print("\n--- Contas Cadastradas ---");
  for (var conta in contas) {
    print("Titular: ${conta.titular}");
    print("Saldo: R\$${conta.saldo.toStringAsFixed(2)}");
    print("Tipo: ${conta.tipo}");
    print("--------------------------");
  }
}

Conta? _selecionarConta(List<Conta> contasEncontradas) {
  if (contasEncontradas.length == 1) {
    return contasEncontradas.first;
  }

  print("Contas encontradas:");
  for (int i = 0; i < contasEncontradas.length; i++) {
    print(
      "${i + 1}. Titular: ${contasEncontradas[i].titular} (${contasEncontradas[i].tipo})",
    );
  }

  stdout.write("Selecione a conta (1 ou 2): ");
  String? escolha = stdin.readLineSync();
  int? index = int.tryParse(escolha!) ?? -1;

  if (index! > 0 && index <= contasEncontradas.length) {
    return contasEncontradas[index - 1];
  } else {
    print("Seleção inválida.");
    return null;
  }
}

void _exibirSaldoConta(List<Conta> contas) {
  print("\n--- Exibir Saldo ---");
  List<Conta> contasEncontradas = filtrarContasPorTitular(contas);

  if (contasEncontradas.isNotEmpty) {
    Conta? contaSelecionada = _selecionarConta(contasEncontradas);
    if (contaSelecionada != null) {
      print(
        "Saldo da conta de ${contaSelecionada.titular} (${contaSelecionada.tipo}): R\$${contaSelecionada.saldo.toStringAsFixed(2)}",
      );
    }
  }
}

void _sacarConta(List<Conta> contas) {
  print("\n--- Sacar ---");
  List<Conta> contasEncontradas = filtrarContasPorTitular(contas);

  if (contasEncontradas.isNotEmpty) {
    Conta? conta = _selecionarConta(contasEncontradas);
    if (conta != null) {
      stdout.write("Digite o valor a ser sacado: ");
      double valorSaque = double.parse(stdin.readLineSync()!);
      if (valorSaque <= 0) {
        print("Valor de saque inválido.");
        return;
      }

      if (conta is ContaCorrente) {
        conta.sacarComChequeEspecial(valorSaque);
      } else if (conta.saldo >= valorSaque) {
        conta.saldo -= valorSaque;
        print(
          "Saque de R\$${valorSaque.toStringAsFixed(2)} realizado com sucesso!",
        );
        print("Novo saldo: R\$${conta.saldo.toStringAsFixed(2)}.");
      } else {
        print("Saldo insuficiente.");
      }
    }
  }
}

void _depositarConta(List<Conta> contas) {
  print("\n--- Depositar ---");
  List<Conta> contasEncontradas = filtrarContasPorTitular(contas);

  if (contasEncontradas.isNotEmpty) {
    Conta? conta = _selecionarConta(contasEncontradas);
    if (conta != null) {
      stdout.write("Digite o valor a ser depositado: ");
      double valorDeposito = double.parse(stdin.readLineSync()!);
      if (valorDeposito > 0) {
        conta.saldo += valorDeposito;
        print(
          "Depósito de R\$${valorDeposito.toStringAsFixed(2)} realizado com sucesso!",
        );
        print("Novo saldo: R\$${conta.saldo.toStringAsFixed(2)}.");
      } else {
        print("Valor de depósito inválido.");
      }
    }
  }
}

void _simularRendimento(List<Conta> contas) {
  print("\n--- Simular Rendimento ---");
  List<Conta> contasEncontradas = filtrarContasPorTitular(contas);

  if (contasEncontradas.isNotEmpty) {
    Conta? conta = _selecionarConta(contasEncontradas);
    if (conta != null) {
      if (conta is ContaPoupanca) {
        stdout.write("Digite a taxa de juros mensal (ex: 0.005 para 0.5%): ");
        double taxa = double.parse(stdin.readLineSync()!);
        conta.simularRendimento(taxa);
      } else {
        print("A conta de ${conta.titular} não é uma Conta Poupança.");
      }
    }
  }
}
