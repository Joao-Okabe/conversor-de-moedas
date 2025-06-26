import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

// Widget reutilizável que exibe um Dropdown para seleção de moeda e um campo de texto para valor
class CurrencyBox extends StatelessWidget {
  // Lista de moedas disponíveis para o Dropdown
  final List<CurrencyModel> items;
  // Controller do campo de texto (para ler/escrever o valor)
  final TextEditingController controller;
  // Moeda atualmente selecionada no Dropdown
  final CurrencyModel selectedItem;
  // Função chamada quando o usuário seleciona uma nova moeda
  final void Function(CurrencyModel) onChanged;

  // Construtor do CurrencyBox, recebe todos os parâmetros obrigatórios
  const CurrencyBox({
    super.key,
    required this.items,
    required this.controller,
    required this.onChanged,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dropdown para seleção da moeda
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 65,
            child: DropdownButton<CurrencyModel>(
              value: selectedItem, // moeda atualmente selecionada
              isExpanded: true, // ocupa toda a largura disponível
              underline: Container(height: 2, color: Colors.yellow), // linha amarela abaixo do Dropdown
              items: items 
                .map((e) => DropdownMenuItem(
                  value: e,
                  child: Row(
                    children: [
                      Text(
                        e.name,
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(e.icon),
                    ]
                  ),
                ))
                .toList(),
              onChanged: (CurrencyModel? model) {
                // Chama a função passada quando o usuário seleciona uma nova moeda
                if (model != null) {
                  onChanged(model);
                }
              },
            ),
          ),
        ),
        SizedBox(width: 20), // Espaço entre o Dropdown e o campo de texto
        // Campo de texto para digitar ou exibir o valor da moeda
        Expanded(
          flex: 3,
          child: TextField(
            controller: controller, // conecta o campo ao controller externo
            decoration: InputDecoration(
              labelText: 'Valor',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow, width: 2),
              ),
            ),
            keyboardType: TextInputType.number, // só permite números
          ),
        ),
      ],
    );
  }
}
