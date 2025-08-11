# 🏦 SenaiBank: Sistema de Gerenciamento Bancário em Dart

Este é um sistema de gerenciamento de contas bancárias desenvolvido em Dart, como parte de um projeto educacional. O objetivo é simular as principais operações de um banco, como cadastro de contas, depósitos, saques, transferências e gerenciamento de usuários.

---

## 🚀 Funcionalidades

O SenaiBank oferece um conjunto completo de funcionalidades para clientes e administradores:

### Tela de Login e Cadastro
- **Login:** Autenticação de usuários com nome de usuário e senha.
- **Cadastro de Usuário:** Novos clientes podem se cadastrar no sistema, criando um nome de usuário e senha.
- **Controle de Acesso:** O sistema diferencia usuários com a função de `admin` e usuários com a função de `cliente`, exibindo menus e permissões diferentes para cada um.

### Gerenciamento de Contas
- **Cadastro de Contas (Apenas Admin):** O administrador pode criar novas contas bancárias para clientes, diferenciando entre Pessoa Física (PF) e Pessoa Jurídica (PJ) e oferecendo opções de Conta Corrente, Conta Poupança ou ambas.
- **Tipos de Conta:**
    - **Conta Corrente:** Permite operações básicas e inclui um limite de cheque especial.
    - **Conta Poupança:** Oferece simulação de rendimento com base em uma taxa de juros mensal.
- **Visualização de Contas (Apenas Admin):** O administrador pode visualizar todas as contas cadastradas no sistema.

### Operações Bancárias
- **Depósito:** Adiciona saldo a uma conta específica.
- **Saque:** Remove saldo de uma conta. Para Contas Correntes, o saque pode utilizar o cheque especial se necessário.
- **Transferência Pix:** Permite a transferência de valores entre contas cadastradas no sistema.
- **Consulta de Saldo:** O usuário pode consultar o saldo de sua conta.

### Interação com o Sistema
- **Deslogar:** Permite que o usuário retorne à tela de login sem encerrar o programa.
- **Sair do Sistema:** Encerra a aplicação completamente.

---

## 🛠️ Como Executar o Projeto

Para executar o SenaiBank, você precisa ter o **SDK do Dart** instalado em seu ambiente.

### Pré-requisitos
- [SDK do Dart](https://dart.dev/get-dart) instalado e configurado no PATH do seu sistema.

### Passos para a Execução
1.  Clone este repositório para o seu computador:
    ```bash
    git clone [https://docs.github.com/articles/referencing-and-citing-content](https://docs.github.com/articles/referencing-and-citing-content)
    ```

2.  Navegue até o diretório do projeto:
    ```bash
    cd banco_senai
    ```

3.  Rode o aplicativo a partir do terminal. O ponto de entrada do sistema é o arquivo `banco_senai.dart` na pasta `bin`:
    ```bash
    dart run bin/banco_senai.dart
    ```

4.  O sistema irá iniciar e exibir a tela de login. Você pode usar as credenciais do super administrador ou criar uma nova conta.
    - **Usuário Admin Padrão:**
      - **Nome de Usuário:** `admin`
      - **Senha:** `admin123`

---

## 📁 Estrutura do Projeto

A organização do código segue a estrutura padrão de projetos Dart:

banco_senai/
├── bin/
│   └── banco_senai.dart         # Arquivo principal para iniciar a aplicação.
├── lib/
│   ├── conta/                   # Diretório para classes relacionadas a contas.
│   │   ├── conta.dart
│   │   ├── contaCorrente.dart
│   │   └── contaPoupanca.dart
│   ├── pessoa/                  # Diretório para classes de pessoas.
│   │   ├── pessoa.dart
│   │   ├── pessoaFisica.dart
│   │   └── pessoaJuridica.dart
│   ├── usuario/                 # Diretório para classes de usuários.
│   │   └── usuario.dart
│   ├── cadastrarConta.dart      # Lógica para cadastro de novas contas (usado por admins).
│   ├── cadastrarUsuario.dart    # Lógica para cadastro de novos usuários (clientes).
│   ├── filtrarConta.dart        # Funções para filtrar contas.
│   ├── menu.dart                # Lógica para a exibição do menu principal.
│   └── realizarTransferencia.dart  # Lógica para transações entre contas.
└── pubspec.yaml                 # Configurações do projeto e dependências.



---

## 🧑‍💻 Contribuindo

Se você deseja contribuir para este projeto, sinta-se à vontade para:

- **Abrir uma Issue:** Para reportar bugs, sugerir melhorias ou novas funcionalidades.
- **Enviar um Pull Request:** Para submeter suas próprias alterações.

---

## 📄 Licença

Este projeto é distribuído sob a licença [MIT](https://opensource.org/licenses/MIT).