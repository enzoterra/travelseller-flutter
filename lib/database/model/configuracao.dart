import 'package:objectbox/objectbox.dart';

@Entity()
class Configuracao {
  int id = 0;

  bool? embarque, desembarque, umaHora, umDia, doisDias, limpar, passar;

  Configuracao(
      {this.embarque,
      this.desembarque,
      this.umaHora,
      this.umDia,
      this.doisDias,
      this.limpar,
      this.passar});
}