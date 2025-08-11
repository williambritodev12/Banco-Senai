// // Esta classe pode ser usada para representar uma Pessoa Física
// //ou Jurídica.
// class Pessoa {
//   String nome;
//   String tipo; // Pode ser "PF" ou "PJ"

//   Pessoa(this.nome, this.tipo);
// }

//*** Funcional */
// class Pessoa {
//   String nome;
//   String tipoPessoa; // Pode ser 'PF' ou 'PJ'
//   String documento; // CPF ou CNPJ

//   Pessoa(this.nome, this.tipoPessoa, this.documento);
// }

//**Funional*/

// Esta é a classe-base. Ela Representa o que é comum a todas as pessoas.
abstract class Pessoa {
  String nome;
  get tipoPessoa => null; // Pode ser PF ou PJ

  Pessoa(this.nome);
}
