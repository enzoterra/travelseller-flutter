import 'package:objectbox/objectbox.dart';

@Entity()
class Configuracao {
  int id = 0;

  bool ida, volta, umaHora, umDia, doisDias, limpar, passar;

  Configuracao(
      {required this.ida,
      required this.volta,
      required this.umaHora,
      required this.umDia,
      required this.doisDias,
      required this.limpar,
      required this.passar});
}