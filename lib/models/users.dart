
// Model será usado para o estabelecimento ter controle dos dados dos usuarios cadastrados

class Users {
  String? id;
  String uid;
  String nome;
  String telefone;
  String nascimento;

  Users({
    this.id,
    required this.uid,
    required this.nome,
    required this.telefone,
    required this.nascimento,
  });

  factory Users.fromJson(Map<String, dynamic> map, String id) {
    return Users(
      id: id,
      uid: map['uid'],
      nome: map['nome'],
      telefone: map['telefone'],
      nascimento: map['nascimento'],
    );
  }
}
