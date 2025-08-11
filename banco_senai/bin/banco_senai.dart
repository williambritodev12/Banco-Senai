// // Importa o arquivo principal, que é o menu
// import 'package:banco_senai/menu.dart' as app;

// void main() {
//   // A função main do menu.dart já contém a lógica principal do  programa.
//   // Basta chamá-la para iniciar o aplicativo.
//   app.main();
// }

// Erro ** 1.2
// import 'dart:io';
// import 'package:banco_senai/menu.dart' as app;
// import 'package:banco_senai/usuario.dart';

// // Lista global de usuários
// List<Usuario> usuarios = [];

// void main() {
//   // Inicialização do sistema
//   usuarios.add(Usuario('admin', 'admin123', 'admin'));
//   print("Usuário administrador padrão criado.");

//   // Loop de login
//   while (true) {
//     print("___ Bem-vindo(a) ao SenaiBank ___");
//     print("\n--- Tela de Login ---");

//     stdout.write("Nome de usuário: ");
//     String username = stdin.readLineSync()!;

//     stdout.write("Senha: ");
//     String senha = stdin.readLineSync()!;

//     // Busca pelo usuário na lista
//     Usuario? usuarioLogado = buscarUsuario(username, senha);

//     if (usuarioLogado != null) {
//       print("\nLogin bem-sucedido! Bem-vindo(a), ${usuarioLogado.username}!");
//       app.main(usuarioLogado); // Chama o menu principal com o usuário logado
//       break;
//     } else {
//       print("\nUsuário ou senha incorretos. Tente novamente.");
//       print("------------------------------\n");
//     }
//   }
// }

// // Função para buscar o usuário na lista
// Usuario? buscarUsuario(String username, String senha) {
//   try {
//     return usuarios.firstWhere(
//       (user) => user.username == username && user.senha == senha,
//     );
//   } catch (e) {
//     return null;
//   }
// }
// Erro 1.2 ***

// import 'dart:io';
// import 'package:banco_senai/menu.dart';
// import 'package:banco_senai/usuario.dart';

// // A lista de usuários deve ser declarada apenas aqui.
// List<Usuario> usuarios = [];

// void main() {
//   // Inicialização do sistema
//   usuarios.add(Usuario('admin', 'admin123', 'admin'));
//   print("Usuário administrador padrão criado.");

//   // Loop de login
//   while (true) {
//     print("___ Bem-vindo(a) ao SenaiBank ___");
//     print("\n--- Tela de Login ---");

//     stdout.write("Nome de usuário: ");
//     String username = stdin.readLineSync()!;

//     stdout.write("Senha: ");
//     String senha = stdin.readLineSync()!;

//     // Busca pelo usuário na lista
//     Usuario? usuarioLogado = buscarUsuario(username, senha);

//     if (usuarioLogado != null) {
//       print("\nLogin bem-sucedido! Bem-vindo(a), ${usuarioLogado.username}!");
//       // Chamada do menu principal, passando o usuário logado e a lista de usuários.
//       iniciarMenu(usuarioLogado);
//       break;
//     } else {
//       print("\nUsuário ou senha incorretos. Tente novamente.");
//       print("------------------------------\n");
//     }
//   }
// }

// // A função de busca de usuário também deve ficar aqui.
// Usuario? buscarUsuario(String username, String senha) {
//   try {
//     return usuarios.firstWhere(
//       (user) => user.username == username && user.senha == senha,
//     );
//   } catch (e) {
//     return null;
//   }
// }

//** Funcional 1.3 */

// import 'dart:io';
// import 'package:banco_senai/menu.dart';
// import 'package:banco_senai/usuario.dart';
// import 'package:banco_senai/cadastrarUsuario.dart'; // Importa a nova função de cadastro

// // A lista de usuários deve ser declarada apenas aqui.
// List<Usuario> usuarios = [];

// void main() {
//   // Inicialização do sistema
//   usuarios.add(Usuario('admin', 'admin123', 'admin'));
//   print("Usuário administrador padrão criado.");

//   // Loop de login
//   while (true) {
//     print("___ Bem-vindo(a) ao SenaiBank ___");
//     print("\n--- Tela de Login ---");
//     print("1. Entrar");
//     print("2. Cadastrar-se");
//     stdout.write("Escolha uma opção: ");
//     String escolha = stdin.readLineSync()!;

//     if (escolha == '1') {
//       stdout.write("Nome de usuário: ");
//       String username = stdin.readLineSync()!;

//       stdout.write("Senha: ");
//       String senha = stdin.readLineSync()!;

//       // Busca pelo usuário na lista
//       Usuario? usuarioLogado = buscarUsuario(username, senha);

//       if (usuarioLogado != null) {
//         print("\nLogin bem-sucedido! Bem-vindo(a), ${usuarioLogado.username}!");
//         iniciarMenu(
//           usuarioLogado,
//         ); // Chama o menu principal com o usuário logado
//         break;
//       } else {
//         print("\nUsuário ou senha incorretos. Tente novamente.");
//         print("------------------------------\n");
//       }
//     } else if (escolha == '2') {
//       // Chama a nova função de cadastro
//       cadastrarUsuario(usuarios);
//       print("\nCadastro realizado com sucesso! Faça login para continuar.");
//       print("------------------------------\n");
//     } else {
//       print("\nOpção inválida. Tente novamente.");
//       print("------------------------------\n");
//     }
//   }
// }

// // Função para buscar o usuário na lista
// Usuario? buscarUsuario(String username, String senha) {
//   try {
//     return usuarios.firstWhere(
//       (user) => user.username == username && user.senha == senha,
//     );
//   } catch (e) {
//     return null;
//   }
// }

// Funcional 1.4

// bin/banco_senai.dart

import 'dart:io';
import 'package:banco_senai/menu.dart';
import 'package:banco_senai/usuario.dart';
import 'package:banco_senai/cadastrarUsuario.dart';
import 'package:banco_senai/conta.dart';

List<Usuario> usuarios = [];
List<Conta> contas = []; // Variável de contas também precisa estar aqui.

void main() {
  usuarios.add(Usuario('admin', 'admin123', 'admin'));
  print("Usuário administrador padrão criado.");

  while (true) {
    print("___ Bem-vindo(a) ao SenaiBank ___");
    print("\n--- Tela de Login ---");
    print("1. Entrar");
    print("2. Cadastrar-se");
    print("3. Sair do Sistema");
    stdout.write("Escolha uma opção: ");
    String? escolha = stdin.readLineSync();

    if (escolha == '1') {
      stdout.write("Nome de usuário: ");
      String username = stdin.readLineSync()!;
      stdout.write("Senha: ");
      String senha = stdin.readLineSync()!;

      Usuario? usuarioLogado = buscarUsuario(username, senha);
      if (usuarioLogado != null) {
        print("\nLogin bem-sucedido! Bem-vindo(a), ${usuarioLogado.username}!");
        iniciarMenu(usuarioLogado, contas);
        // Quando o usuário deslogar, o loop continua e retorna à tela de login.
      } else {
        print("\nUsuário ou senha incorretos. Tente novamente.");
        print("------------------------------\n");
      }
    } else if (escolha == '2') {
      // Passando a lista de contas para a função de cadastro.
      cadastrarUsuario(usuarios, contas);
      print(
        "\nUsuário e conta cadastrados com sucesso! Faça login para continuar.",
      );
      print("------------------------------\n");
    } else if (escolha == '3') {
      print("Encerrando o sistema. Até mais!");
      break; // Encerra o programa
    } else {
      print("\nOpção inválida. Tente novamente.");
      print("------------------------------\n");
    }
  }
}

Usuario? buscarUsuario(String username, String senha) {
  try {
    return usuarios.firstWhere(
      (user) => user.username == username && user.senha == senha,
    );
  } catch (e) {
    return null;
  }
}
