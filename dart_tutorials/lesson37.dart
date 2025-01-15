import 'dart:math';

void main() async {
  final sec1 = await makeCoffee(1);
  final sec2 = await makeCoffee(2);
  final sec3 = await makeCoffee(3);
  print('Кофейня закончила работать!');
  print('Все кофе приготовлили за ${sec1 + sec2 + sec3} сек');
}

Future<int> makeCoffee(int number) async {
  print('Делаем кофе №$number...');
  final random = Random();
  final seconds = random.nextInt(4);
  await Future.delayed(Duration(seconds: seconds));
  print('Сделали кофе №$number за $seconds сек.');
  return seconds;
}
