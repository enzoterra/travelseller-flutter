class ViagensScripts {
  String encurtaNome(String nome) {
    var nomeSplit = nome.split(" ");
    if (nomeSplit.first == nomeSplit.last) {
      nome = nomeSplit.first;
    } else {
      nome = nomeSplit.first + (" ") + nomeSplit.last;
    }
    return nome;
  }
}
