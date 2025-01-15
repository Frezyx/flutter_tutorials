void main() {
  print(greaterOrLess(2, 2));
}

String greaterOrLess(int a, int b) {
  if (a == b) return 'Числа равны';
  return a > b ? 'Больше' : 'Меньше';
}
