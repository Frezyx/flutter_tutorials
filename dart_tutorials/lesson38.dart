void main() async {
  Future(() => print('Кофе #1 готов'));
  Future(() => print('Кофе #2 готов'));
  for (var i = 0; i < 100000; i++) {
    Future.microtask(() => print('Кофе #${i + 3} готов'));
  }
}
