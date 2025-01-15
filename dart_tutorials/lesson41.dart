import 'dart:isolate';

Future<void> main() async {
  final receivePort = ReceivePort();

  final numberList = List.generate(20, (i) => i + 1);
  final isolatesCount = 4;

  final resultResultList = <int>[];
  var completedIsolates = 0;

  for (var i = 0; i < isolatesCount; i++) {
    final stepSize = numberList.length ~/ isolatesCount;
    final sublist = numberList.sublist(i * stepSize, (i + 1) * stepSize);
    Isolate.spawn(mathIsolate, [sublist, receivePort.sendPort, i]);
  }

  await for (final data in receivePort) {
    resultResultList.addAll(data as List<int>);
    completedIsolates += 1;
    if (completedIsolates == 4) {
      resultResultList.sort();
      print('Все посчитано:\n$resultResultList');
      receivePort.close();
      break;
    }
  }
}

void mathIsolate(List<Object> args) async {
  final numbersList = args[0] as List<int>;
  final sendPort = args[1] as SendPort;
  final index = args[2] as int;

  final resultList = <int>[];

  await Future.delayed(Duration(seconds: 5));

  for (final number in numbersList) {
    final result = number * number;
    resultList.add(result);
    print('Изолят [$index] посчитал $result');
  }

  sendPort.send(resultList);
  print('Изолят [$index] закончил работу');
}
