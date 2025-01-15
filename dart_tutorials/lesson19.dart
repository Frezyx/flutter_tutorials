void main() {
  var sanya = Human(name: 'Саша', age: 23, height: 190);
  var michael = Mechanic(name: 'Михаил', age: 30, height: 160, category: 1);
  var alice = Artist(name: 'Алиса', age: 20, height: 187, style: 'Графика');
  var valya = Cook(name: 'Валентин', age: 36, height: 156, level: 'Су-шеф');

  michael.fixSomething();
  alice.drawPicture();
  valya.cookDinner();

  print(sanya.isHighter(alice));
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

  void grewUp(int years) {
    age += years;
  }

  bool isHighter(Human otherHuman) {
    return this.height > otherHuman.height;
  }

  @override
  String toString() {
    return 'Человек Имя: $name Возраст: $age Рост: $height';
  }
}

class Artist extends Human {
  Artist({
    required super.name,
    required super.age,
    required super.height,
    required this.style,
  });

  void drawPicture() {
    print('Художник рисует картину');
  }

  String style;

  @override
  String toString() {
    return '[Художник]' + super.toString() + ' Стиль: $style';
  }
}

class Cook extends Human {
  Cook({
    required super.name,
    required super.age,
    required super.height,
    required this.level,
  });

  String level;

  void cookDinner() {
    print('Повар готовит ужин');
  }

  @override
  String toString() {
    return '[Повар]' + super.toString() + ' Уровень: $level';
  }
}

class Mechanic extends Human {
  Mechanic({
    required super.name,
    required super.age,
    required super.height,
    required this.category,
  });

  int category;

  void fixSomething() {
    print('Механик чинит что-то');
  }

  @override
  String toString() {
    return '[Механик]' + super.toString() + ' Разряд: $category';
  }
}
