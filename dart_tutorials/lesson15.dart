void main() {
  try {
    print(divide(1, 0));
    print('Все хорошо');
  } on Exception catch (e) {
    print('Произшла ошибка\n' + e.toString());
  } on Error catch (e) {
    print('ААААААААААА!\n' + e.toString());
  } finally {
    print('Конец работы функции');
  }
}

num divide(num a, num b) {
  if (b == 0) {
    throw Exception('Делить на ноль нельзя');
  }
  return a / b;
}
