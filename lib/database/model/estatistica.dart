import 'package:objectbox/objectbox.dart';

@Entity()
class Estatistica {
  int id = 0;

  int idViagem;
  int? ano;
  String? mes;

  Estatistica({required this.idViagem, this.ano, this.mes});
}
