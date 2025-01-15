import 'dart:math';

Stream<String> messageStream() async* {
  final id = Random().nextInt(1000);
  print('Канал $id создан');
  yield 'Привет!';
  await Future.delayed(Duration(seconds: 1));
  yield 'Давно не виделись)';
  await Future.delayed(Duration(seconds: 1));
  yield 'Как дела?';
}

void main() {
  final stream = messageStream().asBroadcastStream();
  final sub1 = stream.listen((value) => print(value));
  final sub2 = stream.listen((value) => print(value));

  stream.last.then((_) {
    sub1.cancel();
    sub2.cancel();
  });
}
