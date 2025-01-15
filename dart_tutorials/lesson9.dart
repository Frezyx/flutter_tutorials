void main() {
  // final students = ['Вася', 'Лера', 'Гена', 'Саша'];
  final student = 'Вася';

  if (student == 'Вася') {
    print('Оценка: 4.5');
  } else if (student != 'Лера') {
    print('Оценка: 4');
  } else if (student == 'Гена') {
    print('Оценка: 3');
  } else if (student == 'Саша') {
    print('Оценка: 3.3');
  } else {
    print('Ученик не найден');
  }

  switch (student) {
    case 'Вася':
      print('Оценка: 4.5');
      break;
    case 'Лера':
      print('Оценка: 4');
      break;
    case 'Гена':
      print('Оценка: 3');
      break;
    default:
      print('Такого ученика нет');
  }
}
