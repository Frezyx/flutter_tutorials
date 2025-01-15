abstract class Animal {
  double get age;
  void makeSound();
}

final class Bird extends Animal {
  Bird({required this.age});

  @override
  final double age;

  @override
  void makeSound() => print('Twit twit twit');
}

final class Owl extends Bird {
  Owl({required super.age});
}
