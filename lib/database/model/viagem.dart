import 'package:objectbox/objectbox.dart';

@Entity()
class Viagem {
  int id = 0;

  String? codigoVenda,
      localizador,
      companhiaAerea,
      cidade,
      hotel,
      dataIda,
      horaIda,
      dataVolta,
      horaVolta,
      observacoes;
  double? valorTotal, valorComissao;

  Viagem(
      {this.codigoVenda,
      this.localizador,
      this.companhiaAerea,
      this.cidade,
      this.hotel,
      this.dataIda,
      this.horaIda,
      this.dataVolta,
      this.horaVolta,
      this.observacoes,
      this.valorTotal,
      this.valorComissao});
}
