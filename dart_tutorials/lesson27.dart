void main() {
  int a = 1;
  bool b = false;

  double c = a.toDouble() + converBoolToDouble(b);
  print(c);
  print(c.runtimeType);
}

double converBoolToDouble(bool value) {
  if (value) {
    return 1;
  }
  return 0;
}
