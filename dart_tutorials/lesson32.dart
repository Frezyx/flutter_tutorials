void main() {
  final storage = Storage<String>();
  print(storage.value);
  storage.update('ывбарывопа');
  print(storage.value);
  storage.update('sdsdhsgghd');
  print(storage.value);
}

class Storage<T> {
  Storage({this.value});
  T? value;

  T? read() => value;

  void update(T value) {
    this.value = value;
  }
}
