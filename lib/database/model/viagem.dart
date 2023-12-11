import 'package:objectbox/objectbox.dart';

@Entity()
class Viagem {
  int id = 0;

  String? codigoVenda,
      localizador,
      companhiaAerea,
      cidade,
      hotel,
      embarqueData,
      embarqueHora,
      observacoes;
  double? valorTotal, valorComissao;

  Viagem(
      {this.codigoVenda,
      this.localizador,
      this.companhiaAerea,
      this.cidade,
      this.hotel,
      this.embarqueData,
      this.embarqueHora,
      this.observacoes,
      this.valorTotal,
      this.valorComissao});
}
