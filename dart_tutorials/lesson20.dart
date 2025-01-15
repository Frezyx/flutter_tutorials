void main() {
  var sanya = Human(name: 'Саша', age: 23, height: 190);
  print(sanya.age);
  sanya.grewUp(1);
  print(sanya.age);
  print(sanya.nameAndAge);
}

class Human {
  Human({
    required this.name,
    required int age,
    required this.height,
  }) : _age = age;

  int get age => _age;
  String get nameAndAge => '$name:$age';

  final String name;
  int _age;
  double height;

  void grewUp(int years) {
    _age += years;
  }
}
