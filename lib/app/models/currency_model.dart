// Modelo que representa uma moeda no app
class CurrencyModel {
  // Nome da moeda (ex: Real, Dólar, Euro)
  final String name;
  // Valor de 1 unidade dessa moeda em reais
  final double real;

  // Construtor da classe, recebe nome e valor em reais
  CurrencyModel(this.name, this.real);

  // Método estático que retorna a lista de moedas disponíveis no app
  static List<CurrencyModel> getCurrency(){
    return <CurrencyModel>[
      CurrencyModel("Real", 1.0),         // 1 Real vale 1 real
      CurrencyModel("Dólar", 5.24),       // 1 Dólar vale 5.24 reais
      CurrencyModel("Euro", 5.45),        // 1 Euro vale 5.45 reais
      CurrencyModel("Iene", 0.038),       // 1 Iene vale 0.038 reais
      CurrencyModel("Bitcoin", 200000.00),// 1 Bitcoin vale 200.000 reais
    ];
  }
}

