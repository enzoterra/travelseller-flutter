import 'package:objectbox/objectbox.dart';

@Entity()
class Cliente {
  @Id()
  int id = 0;
  
  String? nome, cpf, rg, dataNascimento, hotel, localizador, companhiaAerea, numeroVenda, cidade, embarqueData, embarqueHora;

  
  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime? date;

  @Transient() // Ignore this property, not stored in the database.
  int? computedProperty;

    " id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL," +
                " nomeCliente VARCHAR," +
                " cpfCliente VARCHAR," +
                " rgCliente VARCHAR," +
                " dataNascimentoCliente VARCHAR," +
                " hotel VARCHAR," +
                " localizador VARCHAR," +
                " companhiaAerea VARCHAR," +
                " numeroVenda VARCHAR," +
                " cidade VARCHAR," +
                " embarqueHora VARCHAR," +
                " embarqueData DATE," +
                " desembarqueHora VARCHAR," +
                " desembarqueData DATE," +
                " observacoes VARCHAR," +
                " valorComissao REAL," +
                " valorTotal REAL, " +
                " mes VARCHAR, " +
                " ano VARCHAR " +
}