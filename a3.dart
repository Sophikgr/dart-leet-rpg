import 'dart:collection';

class Item {
  final String nome;
  final double preco;
  final int qtd;

  // TODO 1: Construtor com required e asserts (nome não vazio, preco >= 0, qtd > 0)
  Item({required this.nome, required this.preco, required this.qtd}) :
  assert(nome != ''), assert(preco >= 0), assert(qtd > 0);

  // TODO 2: factory a partir de Map<String, dynamic>
  // Converta preco para double: (map['preco'] as num).toDouble()
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(nome: map['nome'] as String,
    preco: (map['preco'] as num).toDouble(),
    qtd: map['qtd'] as int);
  }

  @override
  String toString() => 'Item($nome, R\$ ${preco.toStringAsFixed(2)}, x$qtd)';
}

class Carrinho {
  final List<Item> _itens;

  // TODO 3: Construtor que copia a lista recebida (List.of(itens))
  Carrinho(List<Item> itens)
      : _itens =  List.of(itens);

  // TODO 4: Getter imutável usando UnmodifiableListView<Item>
  UnmodifiableListView<Item> get itens {
    return UnmodifiableListView(_itens);
    throw UnimplementedError();
  }
}

// TODO 5: Extension em List<Item> com total() e nomes()
extension ListaDeItensX on List<Item> {
  double total() {
    double total = 0;
    for(final i in this){
      total += (i.qtd * i.preco);
    };
    return total;
  }
  String nomes() => [for (final i in this) i.nome].join(', '); 
}

void main() {
  // "Dados" vindo de uma fonte externa (ex.: JSON)
  final dados = <Map<String, dynamic>>[
    {'nome': 'Poção de Vida', 'preco': 12.5, 'qtd': 2},
    {'nome': 'Espada Curta', 'preco': 80, 'qtd': 1},
    {'nome': 'Escudo de Madeira', 'preco': 35, 'qtd': 1},
  ];

  // TODO 6: Usar collection-for para criar List<Item> a partir de dados
  final base = <Item>[
    for (final m in dados) Item.fromMap(m),
  ]; //PAREI AQUI

  // Brinde opcional
  const incluirBrinde = true;
  final Item brinde = Item(
    nome: 'Mapa da Cidade',
    preco: 0,
    qtd: 1,
  );

  // TODO 7: Montar a lista final usando spread e if condicional
  //

  // TODO 8: Instanciar o carrinho e imprimir nomes e total usando a extension

  // Demonstração de imutabilidade (deve falhar se descomentar)
  // carrinho.itens.add(Item(nome: 'Hack', preco: 0)); // <- não compila
}
