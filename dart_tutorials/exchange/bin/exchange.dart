import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> main(List<String> arguments) async {
  if (arguments.length != 3) {
    print('Неверный формат вызова');
    print('Формат: exchange EUR GBP 1000');
    return;
  }
  final fromCurrency = arguments[0];
  final toCurrency = arguments[1];
  final strAmount = arguments[2];
  if (double.tryParse(strAmount) == null) {
    print('Последним аргументом должна быть сумма');
    return;
  }
  final amount = double.parse(strAmount);

  print('Начал подсчет: $fromCurrency -> $toCurrency сумма: $amount');

  final uri = Uri(
    scheme: 'https',
    host: 'api.exchangerate.host',
    path: 'convert',
    queryParameters: {
      'from': fromCurrency,
      'to': toCurrency,
      'amount': amount.toString(),
      'access_key': 'f80b67a9cebb4b434c72dcafa8520235',
    },
  );

  final response = await http.get(uri);
  final stringBody = response.body;
  final data = JsonDecoder().convert(stringBody) as Map<String, dynamic>;
  print(data['result']);
}
