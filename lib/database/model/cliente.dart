import 'package:objectbox/objectbox.dart';

@Entity()
class Cliente {
  int id = 0;

  String nome;
  String? cpf, rg, dataNascimento;
  int? idViagem;

  Cliente(
      {required this.nome,
      this.cpf,
      this.rg,
      this.dataNascimento,
      this.idViagem});
}
