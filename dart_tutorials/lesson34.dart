void main() {
  String? name = _getUserName();
  print(name?.substring(0, 1));
}

String? _getUserName() {
  return 'Ууаваьырив';
}
