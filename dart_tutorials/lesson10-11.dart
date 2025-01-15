void main() {
  final students = ['Вася', 'Лера', 'Маша'];

  print(students);

  for (final student in students) {
    print(student);
  }

  for (var i = 0; i < students.length; i++) {
    students[i] = students[i] + ' ' + i.toString();
  }
  print(students);

  while (students.isNotEmpty) {
    students.removeLast();
    print('#########');
  }
  print(students);

  var a = 980;
  do {
    a = a + 1;
    print(a);
  } while (a < 1000);
}
