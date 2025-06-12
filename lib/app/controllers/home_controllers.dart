import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:flutter/widgets.dart';

// Classe responsável por controlar a lógica de conversão e os estados das moedas
class HomeControllers {
  // Lista de moedas disponíveis para conversão
  late List<CurrencyModel> currencies;

  // Controllers dos campos de texto (origem e destino)
  final TextEditingController fromText;
  final TextEditingController toText;

  // Moeda selecionada como destino e origem
  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  // Construtor: inicializa as moedas e os controllers
  HomeControllers({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrency(); // Carrega as moedas disponíveis
    fromCurrency = currencies[0]; // Define moeda de origem padrão (primeira da lista)
    toCurrency = currencies[1];   // Define moeda de destino padrão (segunda da lista)
  }

  // Método que realiza a conversão de valores entre moedas
  void converter() {
    String text = fromText.text; // Lê o valor digitado no campo de origem
    double value = double.tryParse(text) ?? 0.0; // Converte para double, ou 0 se inválido

    // Conversão universal: converte de qualquer moeda para qualquer moeda usando o valor em reais
    double valorFinal = value * (fromCurrency.real / toCurrency.real);

    toText.text = valorFinal.toStringAsFixed(2); // Atualiza o campo de destino com o resultado formatado
  }
}