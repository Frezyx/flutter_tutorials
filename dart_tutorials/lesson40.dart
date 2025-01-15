import 'dart:math';

void main() {
  final user = User(height: 190, weight: 87);
  print(user.bmi);
}

class User {
  User({
    required this.height,
    required this.weight,
  }) {
    bmi = weight / pow(height, 2);
  }

  final double height;
  final double weight;
  double? bmi;
}
