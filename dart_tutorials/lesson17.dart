void main() {
  var sanya = Human(name: 'Саша', age: 23, height: 190);

  print(sanya);
  print(sanya.name);
  print(sanya.height);

  sanya.age = 24;
  print(sanya.age);
}

class Human {
  Human({
    required this.name,
    required this.age,
    required this.height,
  });

  final String name;
  int age;
  double height;
}
