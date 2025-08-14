class Missao {
  int? id;
  final String? titulo;
  int? recompensa;
  String? descricao;
  bool? concluida;

  // TODO 1: construtor nomeado com required e valores padrão
  Missao({this.id, this.descricao, required this.titulo, this.recompensa, this.concluida = false});

  // TODO 2: factory que cria a partir de um Map<String, dynamic>
  // Use ?? para títulos ausentes, concluida padrão false, etc.
  // Dica: acessar map['campo'] as Tipo? e tratar com ?? quando necessário.
  factory Missao.fromMap(Map<String, dynamic> map) {
    return Missao(id: map['id'] as int?,
    descricao: (map['descricao'] as String?) ?? 'sem desc',
    titulo: (map['titulo'] as String?) ?? 'Sem titúlo', 
    recompensa: map['recompensa'] as int?, 
    concluida: (map['concluida'] as bool?) ?? false);
  }

  // Cálculo simples de XP
  int xp() {
    // TODO 3: use ?? e ?.length

    return (recompensa ?? 0) + (125 + (descricao?.length ?? 1)) ;
  }

  // Marca como concluída
  void marcarConcluida() {
    concluida = true;
  }

  // Texto de resumo
  String resumo() {
    // TODO 5: usar ?. e ?? para montar o resumo
    final idStr = id?.toString() ?? '-';
    final d = descricao ?? 'Sem descrição';
    return '[$idStr] $titulo | XP=${xp()} | Concluída: $concluida | Desc: $d';
  }
}

void main() {
  // Dados crus (simulando "JSON")
  final dadosBrutos = <Map<String, dynamic>>[
    {'id': 1, 'titulo': 'Caçar slimes', 'recompensa': 120},
    {'titulo': 'Entregar carta', 'descricao': 'Levar ao vilarejo vizinho'},
    {'id': 3, 'titulo': 'Explorar caverna', 'recompensa': null, 'concluida': true},
  ];

  // TODO 6: converter para List<Missao> usando a factory
  final missoes = dadosBrutos.map((m) => Missao.fromMap(m)).toList(); // substitua pela conversão correta

  // TODO 7: criar missão extra sem id e com alguma recompensa
  var extra = Missao(titulo: 'Beber água', recompensa: 44);
  // Gerar próximo id sequencial com base no maior id existente
  final maiorId = missoes
      .map((m) => m.id ?? 0)
      .fold<int>(0, (acc, v) => v > acc ? v : acc);
  final proximoId = maiorId + 1;

  // TODO 8: use ??= para setar o id da extra apenas se for null
  extra.id ??= proximoId;

  // TODO 9: use operador cascata .. na missão extra para marcar concluída
  // e definir uma descricao padrão apenas se ainda estiver nula (??=)
  extra
    ..marcarConcluida()
    ..descricao??= 'Sem descrição';

  // Imprimir resumos
  for (final m in [...missoes, extra]) {
    print(m.resumo());
  }
}
