class Personagem {
  final String nome;
  final int nivel;
  final int? forca;
  final String? apelido;

  // TODO: implemente um construtor usando 'construtor simplificado'
  // Personagem( ... );
  Personagem(this.nome, {this.forca, this.apelido, this.nivel = 1});

  int poder() {
    return (forca ?? 10) * nivel;
  }

  String descricao({String? saudacao}) {
    // TODO: use ?? para saudacao (padrão "Olá") e para escolher entre apelido e nome
    final s =  saudacao ?? "Olá";
    final chamado =  apelido ?? nome;
    return '$s, eu sou $chamado (nível $nivel). Poder: ${poder()}';
  }
}

void main() {
  // TODO: crie dois personagens
  // p1: somente com nome
  final p1 = Personagem('Joao');

  // p2: com nome e argumentos nomeados (nivel, forca, apelido)
  final p2 = Personagem('Pedro', forca: 2, apelido: 'pedrinho');
  

  print(p1.descricao(saudacao: 'salve'));
  print(p2.descricao(saudacao: 'Oi'));
}
