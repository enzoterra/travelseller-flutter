import 'package:objectbox/objectbox.dart';

@Entity()
class Cliente {
  int id = 0;

  String nome;
  String cpf, rg, dataNascimento;
  int? idViagem;

  Cliente(
      {required this.nome,
      required this.cpf,
      required this.rg,
      required this.dataNascimento,
      this.idViagem});
}
