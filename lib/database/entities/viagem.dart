" id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL," +
                " nome VARCHAR," +
                " rg VARCHAR," +
                " cpf VARCHAR," +
                " dataNascimento VARCHAR," +
                " fk_viagens_id INTEGER, " +
                " FOREIGN KEY (fk_viagens_id) REFERENCES viagens(id)" +
