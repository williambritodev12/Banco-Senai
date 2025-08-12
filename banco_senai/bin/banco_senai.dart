import 'dart:io';
import 'package:banco_senai/menu.dart';
import 'package:banco_senai/usuario.dart';
import 'package:banco_senai/cadastrarUsuario.dart';
import 'package:banco_senai/conta.dart';

List<Usuario> usuarios = [];
List<Conta> contas = []; // Lista global de contas

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
