import 'package:objectbox/objectbox.dart';

@Entity()
class Cliente {
  int id = 0;

  String? nome, cpf, rg, dataNascimento;
  int? idViagem;

  Cliente(
      {this.nome,
      this.cpf,
      this.rg,
      this.dataNascimento,
      this.idViagem});
}