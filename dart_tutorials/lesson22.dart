void main() {
  final Animal wolf = Wolf(5);
  final Animal tiger = Tiger(1);

  wolf.makeSound();
  tiger.makeSound();
}

abstract interface class Animal {
  double get age;
  void makeSound();
}

class Wolf implements Animal {
  Wolf(this.age);
  @override
  void makeSound() {
    print('Auuuuuu!');
  }

  @override
  final double age;
}

class Tiger implements Animal {
  Tiger(this.age);
  @override
  void makeSound() {
    print('RRRRRRR!');
  }

  void makePerformanceInCircus() {
    print('Тигр в цирке выступает');
  }

  @override
  final double age;
}
