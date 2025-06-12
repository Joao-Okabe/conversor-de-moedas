import 'package:conversor_de_moedas/app/components/currency_box.dart';
import 'package:conversor_de_moedas/app/controllers/home_controllers.dart';
import 'package:flutter/material.dart';

// Tela principal do app, usando StatefulWidget para atualizar a interface
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Controllers para os campos de texto das moedas
  final TextEditingController fromText = TextEditingController();
  final TextEditingController toText = TextEditingController();

  // Controller principal que gerencia as moedas e conversão
  late HomeControllers homeControllers;

  @override
  void initState() {
    // Inicializa o controller principal com os controllers dos campos de texto
    homeControllers = HomeControllers(
      toText: toText,
      fromText: fromText,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // Garante que o conteúdo ocupe toda a tela
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          // Espaçamento nas bordas superiores e laterais
          padding: const EdgeInsets.only(
            top: 75,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              // Exibe uma imagem centralizada no topo
              Center(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset('assets/images/currency_exchange.png'),
                ),
              ),
              SizedBox(height: 40), // Espaço entre a imagem e os campos

              // Primeira caixa de seleção e texto (moeda de origem)
              CurrencyBox(
                selectedItem: homeControllers.fromCurrency, // moeda selecionada de origem
                controller: fromText, // campo de texto de origem
                items: homeControllers.currencies, // lista de moedas disponíveis
                onChanged: (model) {
                  setState(() {
                    homeControllers.fromCurrency = model; // atualiza moeda de origem
                  });
                },
              ),
              SizedBox(height: 10), // Espaço entre as caixas

              // Segunda caixa de seleção e texto (moeda de destino)
              CurrencyBox(
                selectedItem: homeControllers.toCurrency, // moeda selecionada de destino
                controller: toText, // campo de texto de destino
                items: homeControllers.currencies, // lista de moedas disponíveis
                onChanged: (model) {
                  setState(() {
                    homeControllers.toCurrency = model; // atualiza moeda de destino
                  });
                },
              ),
              SizedBox(height: 20), // Espaço antes do botão

              // Botão para realizar a conversão
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: Size(MediaQuery.of(context).size.width, 50),
                ),
                onPressed: () {
                  // Chama o método de conversão do controller
                  homeControllers.converter();
                  // Atualiza os campos de texto na tela
                  setState(() {
                    fromText.text = homeControllers.fromText.text;
                    toText.text = homeControllers.toText.text;
                  });
                },
                child: const Text('Converter'),
              )
            ],
          ),
        ),
      ),
    );
  }
}