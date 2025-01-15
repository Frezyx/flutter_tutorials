void main() {
  final result = pow(5, 3);
  print(formatResult(result));

  final result1 = pow(7, 3);
  print(formatResult(result1));

  final result2 = pow(8, 2);
  print(formatResult(result2));
}

int pow(int number, int n) {
  for (var i = 1; i < n; i++) {
    number = square(number);
  }
  return number;
}

int square(int number) {
  return number * number;
}

String formatResult(int number) {
  return 'Результат операции: $number';
}
