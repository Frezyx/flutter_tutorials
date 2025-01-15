void main() {
  final calculator = Calculator();
  print(calculator.sum(1, 2));
  print(calculator.sum(1.5, 2.7));
}

class Calculator {
  num sum(num a, num b) {
    final result = a + b;
    print(result.runtimeType);
    return result;
  }
}
