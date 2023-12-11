import 'package:objectbox/objectbox.dart';

@Entity()
class Estatistica {
  int id = 0;

  int? idViagem, ano;
  String? mes;

  Estatistica(
      {this.idViagem,
      this.ano,
      this.mes});
}